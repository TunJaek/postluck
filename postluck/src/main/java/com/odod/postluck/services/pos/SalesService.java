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
		List<SalesAnalysisBean> salesAnalysis = null;
		try {
			this.tranManager.tranStart();
			if (period.equals("today")) {
				salesAnalysis = this.sqlSession.selectList("selTodaySalesInfo", store);
			} else if (period.equals("oneWeek")) {
				salesAnalysis = this.sqlSession.selectList("selOneweekSalesInfo", store);
			} else if (period.equals("oneMonth")) {
				salesAnalysis = this.sqlSession.selectList("selOnemonthSalesInfo", store);
			} else if (period.equals("threeMonth")) {
				salesAnalysis = this.sqlSession.selectList("selThreemonthSalesInfo", store);
			}
			if (salesAnalysis == null || salesAnalysis.isEmpty()) {
				ArrayList<SalesAnalysisBean> salesAnalysisArr = new ArrayList<SalesAnalysisBean>();
				SalesAnalysisBean cardSalesBean = new SalesAnalysisBean();
				SalesAnalysisBean cashSalesBean = new SalesAnalysisBean();
				cardSalesBean.setPaymentType("카드");
				cardSalesBean.setCountSales(0);
				cardSalesBean.setTotalPrice(0);

				cardSalesBean.setPaymentType("현금");
				cashSalesBean.setCountSales(0);
				cashSalesBean.setTotalPrice(0);

				salesAnalysisArr.add(cardSalesBean);
				salesAnalysisArr.add(cashSalesBean);
				store.setSalesAnalysisList(salesAnalysisArr);
			} else {
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) salesAnalysis);
			}
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
		List<SalesAnalysisBean> salesAnalysis = null;
		try {
			this.tranManager.tranStart();
			if (store.getSalesAnalysisList().get(0).getPeriod().equals("today")) {
				salesAnalysis = this.sqlSession.selectList("selPaymentTypoOneDayeList", store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("oneWeek")) {
				salesAnalysis = this.sqlSession.selectList("selPaymentTypoOneWeekeList", store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("oneMonth")) {
				salesAnalysis = this.sqlSession.selectList("selPaymentTypoOneMontheList", store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("threeMonth")) {
				salesAnalysis = this.sqlSession.selectList("selPaymentTypoThreeMontheList", store);
			}

			System.out.println(salesAnalysis);
			if (salesAnalysis == null || salesAnalysis.isEmpty()) {
				ArrayList<SalesAnalysisBean> salesAnalysisArr = new ArrayList<SalesAnalysisBean>();
				SalesAnalysisBean cardSalesBean = new SalesAnalysisBean();
				SalesAnalysisBean cashSalesBean = new SalesAnalysisBean();
				cardSalesBean.setPaymentType("카드");
				cardSalesBean.setCountSales(0);
				cardSalesBean.setTotalPrice(0);

				cardSalesBean.setPaymentType("현금");
				cashSalesBean.setCountSales(0);
				cashSalesBean.setTotalPrice(0);

				salesAnalysisArr.add(cardSalesBean);
				salesAnalysisArr.add(cashSalesBean);
				store.setSalesAnalysisList(salesAnalysisArr);
			} else {
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) salesAnalysis);
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}

	}

	private void selLocateList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("selLocateList");
		System.out.println("로컬" + store);
		try {
			this.tranManager.tranStart();
			if (store.getSalesAnalysisList().get(0).getPeriod().equals("today")) {
				List<SalesAnalysisBean> locationList = this.sqlSession.selectList("selLocateOneDayList", store);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) locationList);
				System.out.println(store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("oneWeek")) {
				List<SalesAnalysisBean> locationList = this.sqlSession.selectList("selLocateOneWeekList", store);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) locationList);
				System.out.println(store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("oneMonth")) {
				List<SalesAnalysisBean> locationList = this.sqlSession.selectList("selLocateOneMonthList", store);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) locationList);
				System.out.println(store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("threeMonth")) {
				List<SalesAnalysisBean> locationList = this.sqlSession.selectList("selLocateThreeMonthList", store);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) locationList);
				System.out.println(store);
			}
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
		System.out.println("스토어뭐시기" + store);
		try {
			this.tranManager.tranStart();
			if (store.getSalesAnalysisList().get(0).getPeriod().equals("today")) {
				List<SalesAnalysisBean> menuTypeList = this.sqlSession.selectList("menuTypeOneDayList", store);

				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) menuTypeList);
				System.out.println(store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("oneWeek")) {
				List<SalesAnalysisBean> menuTypeList = this.sqlSession.selectList("menuTypeOneWeekList", store);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) menuTypeList);
				System.out.println(store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("oneMonth")) {
				List<SalesAnalysisBean> menuTypeList = this.sqlSession.selectList("menuTypeOneMonthList", store);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) menuTypeList);
				System.out.println(store);
			} else if (store.getSalesAnalysisList().get(0).getPeriod().equals("threeMonth")) {
				List<SalesAnalysisBean> menuTypeList = this.sqlSession.selectList("menuTypeThreeMonthList", store);
				store.setSalesAnalysisList((ArrayList<SalesAnalysisBean>) menuTypeList);
				System.out.println(store);
			}
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
