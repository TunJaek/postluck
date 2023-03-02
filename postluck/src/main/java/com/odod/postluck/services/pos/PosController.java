package com.odod.postluck.services.pos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;

@Controller
public class PosController {
    @Autowired
    private LocationService locService;
    @Autowired
    private MainService mainService;
    @Autowired
    private StoreService storeService;

    @PostMapping("/View/MovePosManage")
    public ModelAndView movePosManage(ModelAndView mav, @ModelAttribute StoreBean store, @ModelAttribute("JWTForPostluck") String jwt) {
	mav.addObject("store",store);
	mav.addObject("jwt",jwt);
	System.out.println(jwt);
	this.mainService.backController("PO02", mav);
	return mav; 
    }
}
