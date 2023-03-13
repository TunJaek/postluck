package com.odod.postluck.services.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Autowired
	private HomeService homeService;

	@GetMapping("/Home") // 홈페이지 이동
	public ModelAndView moveHome(ModelAndView mav) {
		this.homeService.backController("HO01", mav);
		return mav;
	}

	@GetMapping("/Home/StoreInfo") // 홈페이지 이동
	public ModelAndView moveStoreInfoPage(ModelAndView mav, @RequestParam String storeCode) {
		mav.addObject("storeCode", storeCode);
		System.out.println(storeCode);
		this.homeService.backController("HO02", mav);
		return mav;

	}
}
