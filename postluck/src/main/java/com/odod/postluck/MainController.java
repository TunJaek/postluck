package com.odod.postluck;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.services.auth.Authentication;
import com.odod.postluck.services.pos.StoreService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {
	
	@Autowired
	private StoreService storeSevice;
	@Autowired
	private Authentication auth;
	@GetMapping("/Index")
	public String index(){
	    return "index";
	}
	@GetMapping("/") //index페이지 이동
	public String landing() {
		return "landing";
	}
	
	@GetMapping("/View/MoveHome") //홈페이지 이동
	public String moveHome() {
		return "homePage";
	}
	@PostMapping("/View/MovePos") //
	public String movePos(ModelAndView mav, @ModelAttribute StoreBean store, @ModelAttribute("JWTForPostluck") String jwt) {
		mav.addObject("jwt", jwt);
		mav.addObject("store", store);
		return "pos-main";
	}
	
	@PostMapping("/View/MoveKiosk")
	public String moveKiosk(ModelAndView mav, @ModelAttribute StoreBean store, @ModelAttribute("JWTForPostluck") String jwt) {
		mav.addObject("jwt", jwt);
		mav.addObject("store", store);
		return "kiosk-menu";
	}
	
	
	@GetMapping("/index-callBack")
	public String indexService() {
		return "index-callBack";
	}
	
	
	
	
	
	
	
	
	
}
