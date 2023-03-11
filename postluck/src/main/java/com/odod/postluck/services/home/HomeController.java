package com.odod.postluck.services.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Autowired
	private HomeService homeService;

	@GetMapping("/Home") // 홈페이지 이동
	public String moveHome(ModelAndView mav) {
		this.homeService.backController("HO01", mav);
		return "home";
	}

	@GetMapping("/Home/StoreInfo") // 홈페이지 이동
	public String moveStoreInfoPage() {
		return "home-storeInfo";
	}
}
