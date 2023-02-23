package com.odod.postluck.services.pos;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public class LocationService {
public LocationService() {
		
	}
	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "LO01":
			this.getLocationList(model);
			break;
		case "LO02":
			this.modifyLocation(model);
			break;
		case "LO03":
			this.deleteLocation(model);
			break;
		case "LO04":
			this.regLocation(model);
			break;		
		}
	}
	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		}
	}

	private void regLocation(Model model) {
		
	}
	private void deleteLocation(Model model) {
		
	}
	private void modifyLocation(Model model) {
		
	}
	private void getLocationList(Model model) {
		
	}
	private boolean convertToBoolean(int value) {
		return value>=1?true:false;
	}
	
}
