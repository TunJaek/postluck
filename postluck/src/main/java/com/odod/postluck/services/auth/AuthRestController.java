package com.odod.postluck.services.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.services.pos.MenuService;
import com.odod.postluck.utils.JsonWebTokenService;
import com.odod.postluck.utils.ProjectUtils;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AuthRestController {
    @Autowired
    private Authentication auth;
    @Autowired
    private MenuService menuService;
    @Autowired
    private JsonWebTokenService jwts;
    @Autowired
    private ProjectUtils pu;

    @PostMapping("/Api/DupCheckStCode")
    public StoreBean dupCheckStCode(Model model, @ModelAttribute StoreBean store) {
	model.addAttribute("storeCode", store);
	auth.backController("AU01", model);

	return ((StoreBean) model.getAttribute("storeCode"));
    }

    @PostMapping("/IssuanceJWT")
    public String issuanceJWT(Model model, @ModelAttribute StoreBean store) {
	System.out.println("IP: " + store.getAccessLogList().get(0).getAccessIP());
	model.addAttribute("store", store);
	auth.backController("AU02", model);
	return ((StoreBean) model.getAttribute("store")).getMessage();
    }

    @PostMapping("/Api/RegStoreInfo")
    public StoreBean regStoreInfo(Model model, @ModelAttribute StoreBean store,
	    @ModelAttribute("JWTForPostluck") String jwt) {
	model.addAttribute("jwt", jwt);
	model.addAttribute("store", store);
	auth.backController("AU03", model);
	System.out.println((StoreBean) model.getAttribute("store"));

	return (StoreBean) model.getAttribute("store");
    }
}