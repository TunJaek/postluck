package com.odod.postluck.services.pos;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.odod.postluck.beans.StoreBean;
@RestController
public class PosRestController {

	@PostMapping("/PosManage")
	public String moveKiosk(Model model, @ModelAttribute StoreBean store, @ModelAttribute("JWTForPostluck") String jwt) {
		model.addAttribute("jwt", jwt);
		model.addAttribute("store", store);
		return "pos-manage";
	}
}
