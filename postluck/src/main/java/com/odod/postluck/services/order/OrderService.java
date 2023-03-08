package com.odod.postluck.services.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

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
		case "OR02":
			this.updOrderStateToCancel(model);
			break;
		case "OR03":
			this.updOrderStateToAccept(model);
			break;
		case "OR04":
			this.selOrderDetail(model);
			break;
		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "OR01":
			this.updOrderStateToComplete(mav);
			break;
		}
	}

	private void makeOrder(Model model) {
		StoreBean order = (StoreBean) model.getAttribute("order");
		OrderInfoBean orderInfo;
		try {
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

	private void updOrderStateToComplete(ModelAndView mav) {
		// 주문 상태 -> 완료

	}

	private void updOrderStateToCancel(Model model) {
		// 주문 상태 -> 취소

	}

	private void updOrderStateToAccept(Model model) {
		// 주문 상태 -> 접수

	}

	private void selOrderDetail(Model model) {
		// 주문상세내역리스트 불러오기

	}

}
