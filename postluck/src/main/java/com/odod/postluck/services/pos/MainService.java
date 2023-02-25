package com.odod.postluck.services.pos;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MainService {
public MainService() {
		
	}
	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "PO01":
			this.openStore(model);
			break;
		case "PO02":
			this.closeStore(model);
			break;
		}
	}

	private void closeStore(Model model) {
		// TODO Auto-generated method stub
		
	}
	private void openStore(Model model) {
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
