package com.odod.postluck.services.pos;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class SalesService {
	public SalesService() {
		
	}
	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "SA01":
			this.getSalesList(model);
			break;
		case "SA02":
			this.getPeriodSalesList(model);
			break;
		case "SA03":
			this.getTypeSalesList(model);
			break;
		case "SA04":
			this.getSalesDetail(model);
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
		// TODO Auto-generated method stub
		
	}
	private void getTypeSalesList(Model model) {
		// TODO Auto-generated method stub
		
	}
	private void getPeriodSalesList(Model model) {
		// TODO Auto-generated method stub
		
	}
	private void getSalesList(Model model) {
		// TODO Auto-generated method stub
		
	}
	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		}
	}

	private boolean convertToBoolean(int value) {
		return value>=1?true:false;
	}
}
