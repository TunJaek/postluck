package com.odod.postluck.services.kiosk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.services.pos.MainService;
import com.odod.postluck.utils.JsonWebTokenService;
import com.odod.postluck.utils.ProjectUtils;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class KioskService extends TransactionAssistant {

	@Autowired
	private ProjectUtils pu;
	@Autowired
	private SimpleTransactionManager tranManager;
	@Autowired
	private MainService main;
	@Autowired
	private JsonWebTokenService jwt;

	public KioskService() {
	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "KI03":
			break;

		case "KI02":
			break;
		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "KI01":
			this.moveKiosk(mav);
			break;
		}
	}

	private void moveKiosk(ModelAndView mav) {
		StoreBean store =(StoreBean) mav.getModel().get("store");
		store.setStoreCode(this.jwt.getTokenInfoFromJWT(mav.getModel().get("jwt").toString()).getStoreCode());
		mav.addObject("store", this.main.getStoreInfoAsStoreBean(mav));
		mav.setViewName("kiosk-menu");
	}
}