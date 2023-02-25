package com.odod.postluck.services.pos;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class StoreService {
	public StoreService() {
	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "ST00":
			this.insStoreInfo(model);
			break;

		case "ST02":
			this.updStoreInfo(model);

		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "ST01":
			this.selStoreInfo(mav);
			break;
		}
	}

	private void selStoreInfo(ModelAndView mav) {

	}

	private void insStoreInfo(Model model) {

	}
	
	private void updStoreInfo(Model model) {
		
	}
	private boolean convertToBoolean(int value) {
		return value>=1?true:false;
	}

}
