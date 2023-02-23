package com.odod.postluck.services.order;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class OrderService {
	public OrderService() {
		
	}
	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		
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
		switch(serviceCode) {
		case "OR01":
			this.updOrderStateToComplete(mav);
			break;
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
		//주문상세내역리스트 불러오기
		
	}
	private boolean convertToBoolean(int value) {
		return value>=1?true:false;
	}
}
