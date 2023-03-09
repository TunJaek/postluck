package com.odod.postluck.services.pos;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.OrderBean;
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
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
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
			this.getPeriodSalesDetail(model);
			break;
		case "SA07":
			this.getHotMenu();
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
			}
			this.tranManager.commit();
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}

	}
	private void getHotMenu() {
		// TODO Auto-generated method stub
		
	}
	private void getPeriodSalesDetail(Model model) {
		// TODO Auto-generated method stub
		
	}
	private void getAllSalesAnalysis(Model model) {
		// TODO Auto-generated method stub
		
	}
	private void getSalesDetail(Model model) {
		StoreBean store = (StoreBean)model.getAttribute("salesStore");
		try {
			this.tranManager.tranStart();
			List<OrderBean> orderList = this.sqlSession.selectList("selPaymentList", store);
			System.out.println("오더리스트"+orderList);
//			store.setOrderList((ArrayList<OrderBean>)orderList);
	//		System.out.println("스토어에넣기"+store);
			List<StoreBean>storeList=this.sqlSession.selectList("selSalesList", store);
			System.out.println("스토어리스트만들기"+storeList);
			storeList.get(0).setOrderList((ArrayList<OrderBean>)orderList);
			System.out.println("스토어리스트"+storeList);
			store=storeList.get(0);
			System.out.println("스토어"+store);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void getPeriodSalesList(Model model) {
		// TODO Auto-generated method stub
		
	}

	private void getTypeSalesList(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
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

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		}
	}

}
