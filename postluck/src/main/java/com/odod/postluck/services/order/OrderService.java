package com.odod.postluck.services.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.OrderBean;
import com.odod.postluck.beans.OrderDetailBean;
import com.odod.postluck.beans.OrderInfoBean;
import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class OrderService extends TransactionAssistant {
	@Autowired
	private SimpleTransactionManager tranManager;

	public OrderService() {

	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "OR01":
			this.makeOrder(model);
			break;
		case "OR02":
			this.selOrderDetail(model);
			break;
		case "OR03":
			this.getOrderList(model);
			break;
		case "OR04":
			this.cancelOrder(model);
			break;
		case "OR05":
			this.completeOrder(model);
			break;
		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {

		}
	}
	private void cancelOrder(Model model) {
		OrderInfoBean orderInfo = (OrderInfoBean)model.getAttribute("cancelOrder");
		try {
			this.tranManager.setTransactionConf(false);
			this.tranManager.tranStart();
			this.sqlSession.update("updOrderStateToCancel",orderInfo);
			this.tranManager.commit();
		}catch(Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		}
		finally {
			this.tranManager.tranEnd();
		}
	}
	private void completeOrder(Model model) {
		OrderInfoBean orderInfo = (OrderInfoBean)model.getAttribute("completeOrder");
		try {
			this.tranManager.setTransactionConf(false);
			this.tranManager.tranStart();
			this.sqlSession.update("updOrderStateToComplete",orderInfo);
			this.tranManager.commit();
		}catch(Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		}
		finally {
			this.tranManager.tranEnd();
		}
	}
	private void makeOrder(Model model) {
		StoreBean order = (StoreBean) model.getAttribute("order");
		OrderInfoBean orderInfo;
		try {
			this.tranManager.setTransactionConf(false);
			this.tranManager.tranStart();
			if (this.convertToBoolean(this.sqlSession.insert("insOrder", order))) {
				if (this.convertToBoolean(this.sqlSession.insert("insOrderDetail", order))) {
					this.tranManager.commit();
					orderInfo = new OrderInfoBean();
					orderInfo.setOrderDate(order.getOrderList().get(0).getOrderDate());
					orderInfo.setOrderNum(String.format("%3s", this.sqlSession.selectOne("selOrderNum", order) + "")
							.replace(' ', '0'));
					model.addAttribute("orderInfo", orderInfo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}
	}

	private void getOrderList(Model model) {
		String storeCode = ((OrderInfoBean) model.getAttribute("storeInfo")).getStoreCode();
		ArrayList<OrderBean> orderBeanArr = new ArrayList<OrderBean>();
		OrderInfoBean orderInfo = new OrderInfoBean();
		orderInfo.setStoreCode(storeCode);
		try {
			this.tranManager.setTransactionConf(true);
			this.tranManager.tranStart();
			List<OrderBean> orderList = this.sqlSession.selectList("selOrderList", storeCode);
			orderBeanArr = (ArrayList<OrderBean>) orderList;
			for (OrderBean order : orderBeanArr) {
				orderInfo.setOrderDate(order.getOrderDate().replaceAll("[^0-9]", ""));
				List<OrderDetailBean> orderDetailBeanList = this.sqlSession.selectList("selOrderDetail", orderInfo);
				ArrayList<OrderDetailBean> orderDetailBeanArr = (ArrayList<OrderDetailBean>) orderDetailBeanList;
				order.setOrderMenuList(orderDetailBeanArr);
				
			}
			model.addAttribute("orderList",orderBeanArr);
		} catch (Exception e) {
			this.tranManager.rollback();
			e.printStackTrace();
		} finally {
			this.tranManager.tranEnd();
		}
	}


	private void selOrderDetail(Model model) {
		// 주문상세내역리스트 불러오기
		OrderInfoBean orderInfo = (OrderInfoBean) model.getAttribute("orderInfo");
		System.out.println(orderInfo);
		OrderBean order = new OrderBean();
		ArrayList<OrderDetailBean> orderDetailArrList = new ArrayList<OrderDetailBean>();
		this.tranManager.setTransactionConf(false);
		System.out.println(orderInfo.getStoreCode());
		System.out.println(orderInfo.getOrderDate());
		System.out.println(orderInfo.getOrderNum());

		try {
			this.tranManager.setTransactionConf(true);
			this.tranManager.tranStart();
			order = this.sqlSession.selectOne("selOrderInfo", orderInfo);
			List<OrderDetailBean> orderDetailList = this.sqlSession.selectList("selOrderDetail", orderInfo);
			System.out.println(orderDetailList);
			orderDetailArrList = (ArrayList<OrderDetailBean>) (orderDetailList);
			order.setOrderMenuList(orderDetailArrList);
			model.addAttribute("order", order);
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
			System.out.println("실패");
		} finally {
			this.tranManager.tranEnd();
		}

	}

}
