package com.odod.postluck.services.pos;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ScheduleService {
	public ScheduleService() {

	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "SC03":
			this.modifySchedule(model);
			break;
		case "SC04":
			this.deleteSchedule(model);
			break;

		}
	}

	private void deleteSchedule(Model model) {
		// TODO Auto-generated method stub
		
	}

	private void modifySchedule(Model model) {
		// TODO Auto-generated method stub
		
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "SC01":
			this.getSchedule(mav);
			break;
		case "SC05":
			this.regSchedule(mav);
			break;

		}
	}

	private void regSchedule(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	private void getSchedule(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	private boolean convertToBoolean(int value) {
		return value>=1?true:false;
	}
}
