package com.odod.postluck.services.home;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.odod.postluck.beans.HomeSearchBean;
import com.odod.postluck.beans.StoreBean;

@RestController
public class HomeRestController {
	@Autowired
	private HomeService homeService;
	
	@PostMapping("/Home/searchStore")
	public ArrayList<StoreBean> moveStoreInfoPage(Model model, @ModelAttribute HomeSearchBean locate) {
		model.addAttribute("locate", locate);
		this.homeService.backController("HO01", model);
		return (ArrayList<StoreBean>)model.getAttribute("storeList") ;
	}
}
