package com.odod.postluck.services.pos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.odod.postluck.beans.StoreBean;
@RestController
public class PosRestController {
	@Autowired
	private MainService mainService;
	@Autowired
	private StoreService storeService;
	
	@PostMapping("/PosManage")
	public String moveKiosk(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		return "pos-manage";
	}
	@PostMapping("/Api/UpdSalesLog")
	public StoreBean updSalesLog(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store",store);
		this.mainService.backController("PO01", model);
		return (StoreBean) model.getAttribute("store");
	}
	@PostMapping("/Api/ModifyStoreInfo")
	public StoreBean modifyStoreInfo(Model model,@ModelAttribute StoreBean store, @ModelAttribute("JWTForPostluck") String jwt) {
	    model.addAttribute("store",store);
	    this.storeService.backController("ST02", model);
	    return (StoreBean)model.getAttribute("store");
	    
	}
}
