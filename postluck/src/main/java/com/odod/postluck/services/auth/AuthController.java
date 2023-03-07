package com.odod.postluck.services.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;
@Controller
public class AuthController {
	@Autowired
	private Authentication auth;
	
	@PostMapping("/View/AccessCtl")
	public ModelAndView validCheckJWT(ModelAndView mav, @ModelAttribute("JWTForPostluck") String jwt,@ModelAttribute StoreBean store) {
		mav.addObject("jwt", jwt);
		mav.addObject("store", store);
		
		// 사업자 정보가 있을경우, 없을경우 둘다 snsId와 jwt만을 담고있음
		this.auth.backController("AU03", mav);
		return mav;
	}
	@PostMapping("/View/MoveBack")
	public ModelAndView moveBack(ModelAndView mav,@ModelAttribute("JWTForPostluck") String jwt,@ModelAttribute StoreBean store) {
		mav.addObject("jwt",jwt);
		mav.addObject("store",store);
		mav.setViewName("index-service");
		return mav;
	}
}
