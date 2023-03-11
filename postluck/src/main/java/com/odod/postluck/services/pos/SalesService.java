package com.odod.postluck.services.pos;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

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
		case "SA01":
			this.getSalesList(model);
			break;
		case "SA02":
			this.getTypeSalesList(model);
			break;
		case "SA03":
			this.getSalesDetail(model);
			break;
		case "SA04":
			this.getPeriodSalesList(model);
			break;
		case "SA05":
			this.getAllSalesAnalysis(model);
			break;
		case "SA06":
			this.selLocateList(model);
			break;
		case "SA07":
			this.getpaymentTypeList(model);
			break;
		case "SA08":
			this.getmenuTypeList(model);
			break;
		}
		}
	



	private void getSalesList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		try {
			this.tranManager.tranStart();
			List<OrderBean> orderList = this.sqlSession.selectList("selPayment", store);
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
			List<OrderBean> orderList = this.sqlSession.selectList("selTypeSalesList", store);
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
		try {
			this.tranManager.tranStart();
			List<OrderDetailBean> orderDetailList = this.sqlSession.selectList("selPaymentList", store);
			store.getOrderList().get(0).setOrderMenuList((ArrayList<OrderDetailBean>) orderDetailList);
			List<LocationBean> selLocationList = this.sqlSession.selectList("selSalesLocation", store);
			store.setLocationList((ArrayList<LocationBean>) selLocationList);
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}

	}

	private void getPeriodSalesList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("salesInfo");
		String period = store.getSalesAnalysisList().get(0).getPeriod();
		try {
			this.tranManager.tranStart();
			if (period.equals("today")) {
				List<SalesAnalysisBean> salesAnalysis = this.sqlSession.selectList("selTodaySalesInfo", store);
				System.out.println("오늘" + salesAnalysis);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) salesAnalysis);
			} else if (period.equals("oneWeek")) {
				List<SalesAnalysisBean> salesAnalysis = this.sqlSession.selectList("selOneweekSalesInfo", store);
				System.out.println("일주일" + salesAnalysis);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) salesAnalysis);
			} else if (period.equals("oneMonth")) {
				List<SalesAnalysisBean> salesAnalysis = this.sqlSession.selectList("selOnemonthSalesInfo", store);
				System.out.println("한달" + salesAnalysis);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) salesAnalysis);
			} else if (period.equals("threeMonth")) {
				List<SalesAnalysisBean> salesAnalysis = this.sqlSession.selectList("selThreemonthSalesInfo", store);
				System.out.println("세달" + salesAnalysis);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) salesAnalysis);
			}

			System.out.println(store);
			this.tranManager.commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}
	}

	private void getpaymentTypeList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("selpaymentTypeList");
		System.out.println(store);
		try {
			this.tranManager.tranStart();
			List<SalesAnalysisBean> salesAnalysis = this.sqlSession.selectList("selPaymentTypeList", store);
			System.out.println(salesAnalysis);
			store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) salesAnalysis);
			System.out.println("결제수단"+store);
			this.tranManager.commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}

	}

	private void selLocateList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("selLocateList");
		System.out.println("로컬"+store);
		try {
			this.tranManager.tranStart();
			List<SalesAnalysisBean> locationList=this.sqlSession.selectList("selLocateList", store);
			store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) locationList);
			System.out.println(store);
			this.tranManager.commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}
	}
	private void getmenuTypeList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("menuTypeList");
		try {
			this.tranManager.tranStart();
			List<SalesAnalysisBean> menuTypeList=this.sqlSession.selectList("menuTypeList", store);
			store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) menuTypeList);
			System.out.println(store);
			this.tranManager.commit();
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
