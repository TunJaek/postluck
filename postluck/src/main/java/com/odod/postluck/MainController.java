package com.odod.postluck;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.services.auth.Authentication;
import com.odod.postluck.services.pos.StoreService;

import lombok.extern.slf4j.Slf4j;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@Slf4j
public class MainController {

	@Autowired
	private StoreService storeSevice;
	@Autowired
	private Authentication auth;

	@GetMapping("/Index")
	public String index() {
		return "index";
	}

	@GetMapping("/") // index페이지 이동
	public String landing() {
		return "landing";
	}

	

	@PostMapping("/View/logOut")
	public ModelAndView logOut(ModelAndView mav, @ModelAttribute StoreBean store,
			@ModelAttribute("JWTForPostluck") String jwt) {
		this.auth.backController("AU04", mav);
		return mav;
	}

	@GetMapping("/index-callBack")
	public String indexService() {
		return "index-callBack";
	}

	@PostMapping("/View/MoveBack")
	public ModelAndView moveBack(ModelAndView mav, @ModelAttribute("JWTForPostluck") String jwt,
			@ModelAttribute StoreBean store) {
		mav.setViewName("index-service");
		return mav;
	}

}
