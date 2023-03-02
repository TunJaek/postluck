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
    private LocationService locService;
    @Autowired
    private MainService mainService;
    @Autowired
    private StoreService storeService;
    

    @PostMapping("/Api/UpdSalesLog")
    public StoreBean updSalesLog(Model model, @ModelAttribute StoreBean store) {
	model.addAttribute("store", store);
	this.mainService.backController("PO01", model);
	return (StoreBean) model.getAttribute("store");
    }

    @PostMapping("/Api/ModifyStoreInfo")
    public StoreBean modifyStoreInfo(Model model, @ModelAttribute StoreBean store,
	   @ModelAttribute("JWTForPostluck") String jwt) {
	model.addAttribute("store", store);
	this.storeService.backController("ST02", model);
	return (StoreBean) model.getAttribute("store");

    }

    @PostMapping("/Api/RegLocation")
    public StoreBean regLocation(Model model, @ModelAttribute StoreBean store,@ModelAttribute("JWTForPostluck") String jwt) {
	model.addAttribute("store", store);
	System.out.println(model.addAttribute("store", store));
	System.out.println("regLocation token : "+jwt);
	this.locService.backController("LO04", model);
	return (StoreBean) model.getAttribute("store");
    }
}
