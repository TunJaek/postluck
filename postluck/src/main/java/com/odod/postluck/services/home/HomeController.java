package com.odod.postluck.services.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {

	
	@PostMapping("Home/moveHome")
	public String MoveHome() {
		return "home";
	}
}
