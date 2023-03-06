package com.odod.postluck.services.kiosk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.services.pos.MainService;

@Controller
public class KioskController {
	@Autowired
	private MainService mainService;
	@Autowired
	private KioskService kioskService;
	
	@PostMapping("/View/MoveKiosk")
	public ModelAndView moveKiosk(ModelAndView mav, @ModelAttribute StoreBean store,@ModelAttribute("JWTForPostluck") String jwt) {
		mav.addObject("store", store);
		mav.addObject("jwt", jwt);
		System.out.println("MoveKiosk");
		this.kioskService.backController("KI01", mav);
		return mav;
	}
}
