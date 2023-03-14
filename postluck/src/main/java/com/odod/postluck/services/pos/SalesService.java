package com.odod.postluck.services.pos;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.CountAmountBean;
import com.odod.postluck.beans.LocationBean;
import com.odod.postluck.beans.OrderBean;
import com.odod.postluck.beans.OrderDetailBean;
import com.odod.postluck.beans.SalesAnalysisBean;
import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class SalesService extends TransactionAssistant {
	@Autowired
	private SimpleTransactionManager tranManager;

	public SalesService() {

	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
			case "SA01" :
				this.getSalesList(model);
				break;
			case "SA02" :
				this.getTypeSalesList(model);
				break;
			case "SA03" :
				this.getSalesDetail(model);
				break;
			case "SA04" :
				this.getSalesAnalysis(model);
				break;
			case "SA05" :
				this.getAllSalesAnalysis(model);
				break;
			case "SA06" :
				break;
			case "SA07" :
				break;
			case "SA08" :
				break;
		}
	}
	private void getSalesAnalysis(Model model) {
		SalesAnalysisBean analysis = (SalesAnalysisBean)model.getAttribute("analysis");
		try {
			this.tranManager.tranStart();
			List<CountAmountBean> caList = this.sqlSession.selectList("selAllSales",analysis);
			analysis.setCountAmountList((ArrayList<CountAmountBean>)caList);
			
			List<OrderDetailBean> odList = this.sqlSession.selectList("selMenuSales",analysis);
			analysis.setSalesMenuList(((ArrayList<OrderDetailBean>)odList));
			
			List<LocationBean> loList = this.sqlSession.selectList("selLocationSales",analysis);
			analysis.setSalesLocationList(((ArrayList<LocationBean>)loList));
			
			
			System.out.println(analysis);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.tranManager.tranEnd();
		}
	}

	private void getSalesList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		try {
			this.tranManager.tranStart();
			List<OrderBean> orderList = this.sqlSession.selectList("selPayment",
					store);
			if (orderList != null) {
				store.setOrderList((ArrayList<OrderBean>) orderList);
				System.out.println("스토어정보" + store);
			}
			this.tranManager.commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}

	}

	private void getTypeSalesList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		System.out.println("getTypeSalesList Store is " + store);
		try {
			this.tranManager.tranStart();
			List<OrderBean> orderList = this.sqlSession
					.selectList("selTypeSalesList", store);
			if (orderList != null) {
				store.setOrderList((ArrayList<OrderBean>) orderList);
			}
			this.tranManager.commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}
	}

	private void getSalesDetail(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("salesStore");
		System.out.println(store + "in getSalesDetail");
		try {
			this.tranManager.tranStart();
			List<OrderDetailBean> orderDetailList = this.sqlSession
					.selectList("selPaymentList", store);
			store.getOrderList().get(0).setOrderMenuList(
					(ArrayList<OrderDetailBean>) orderDetailList);
			List<LocationBean> selLocationList = this.sqlSession
					.selectList("selSalesLocation", store);
			store.setLocationList((ArrayList<LocationBean>) selLocationList);
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}

	}

	private void getAllSalesAnalysis(Model model) {
		// TODO Auto-generated method stub

	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		}
	}

}
