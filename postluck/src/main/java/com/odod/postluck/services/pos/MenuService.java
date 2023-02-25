package com.odod.postluck.services.pos;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MenuService {
	public MenuService() {

	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "ME01":
			this.getAllMenuList(model);
			break;
		case "ME02":
			this.dupCheckMenu(model);
			break;
		case "ME03":
			this.addMenu(model);
			break;
		case "ME04":
			this.getMenuInfo(model);
			break;
		case "ME05":
			this.modifyMenuInfo(model);
			break;

		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "ME06":
			this.deleteMenu(mav);
			break;
		}
	}
	
	private void addMenu(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	private void getMenuInfo(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	private void modifyMenuInfo(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	private void dupCheckMenu(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	private void getAllMenuList(Model model) {
		// TODO Auto-generated method stub
		
	}

	private void deleteMenu(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}
	private boolean convertToBoolean(int value) {
		return value>=1?true:false;
	}

	

}
