package com.odod.postluck.services.pos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odod.postluck.beans.StoreBean;

@RestController
public class PosRestController {
    @Autowired
    private LocationService locService;
    @Autowired
    private MainService mainService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private MenuService menuService;
    

    @PostMapping("/Api/UpdSalesLog")
    public StoreBean updSalesLog(Model model, @ModelAttribute StoreBean store)   {
	model.addAttribute("store", store);
	this.mainService.backController("PO01", model);
	return (StoreBean)model.getAttribute("store");
    }

    @PostMapping("/Api/ModifyStoreInfo")
    public StoreBean modifyStoreInfo(Model model, @ModelAttribute StoreBean store)   {
	model.addAttribute("store", store);
	this.storeService.backController("ST02", model);
	System.out.println("modifyStoreInfo"+model.getAttribute("store"));
	return (StoreBean)model.getAttribute("store");

    }
    @PostMapping("/Api/GetStoreInfo")
    public StoreBean getStoreInfo (Model model, @ModelAttribute StoreBean store)  {
    	System.out.println(store);
	model.addAttribute("store", store);
	this.mainService.backController("PO03", model);
	
	return (StoreBean)model.getAttribute("store");
    }
    @PostMapping("/Api/RegLocation")
    public StoreBean regLocation(Model model, @ModelAttribute StoreBean store)   {
	model.addAttribute("store", store);
	System.out.println(model.addAttribute("store", store));
	this.locService.backController("LO04", model);
	return (StoreBean)model.getAttribute("store");
    }
    @PostMapping("/Api/ModifyLocation")
    public StoreBean modifyLocation(Model model, @ModelAttribute StoreBean store)   {
	model.addAttribute("store", store);
	System.out.println(model.addAttribute("store", store));
	this.locService.backController("LO02", model);
	return (StoreBean)model.getAttribute("store");
    }
    @PostMapping("/Api/DeleteLocation")
    public StoreBean deleteLocation(Model model, @ModelAttribute StoreBean store)   {
	model.addAttribute("store", store);
	System.out.println(model.addAttribute("store", store));
	this.locService.backController("LO03", model);
	return (StoreBean)model.getAttribute("store");
    }
    @PostMapping("/Api/DeleteMenu")
    public StoreBean deleteMenu(Model model, @ModelAttribute StoreBean store)   {
    	model.addAttribute("store", store);
    	System.out.println(model.addAttribute("store", store));
    	this.menuService.backController("ME06", model);
    	return (StoreBean)model.getAttribute("store");
    }
}
