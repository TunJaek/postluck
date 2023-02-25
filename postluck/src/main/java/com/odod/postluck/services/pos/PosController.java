package com.odod.postluck.services.pos;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;

@Controller
public class PosController {

    @PostMapping("/View/MovePosManage")
    public String moveKiosk(ModelAndView mav, @ModelAttribute StoreBean store) {
	mav.addObject("store", store);
	return "pos-manage";
    }
}
