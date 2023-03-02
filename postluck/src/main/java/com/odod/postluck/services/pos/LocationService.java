package com.odod.postluck.services.pos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.odod.postluck.beans.JWTBean;
import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.JsonWebTokenService;
import com.odod.postluck.utils.ProjectUtils;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class LocationService extends TransactionAssistant {

    @Autowired
    private ProjectUtils pu;
    @Autowired
    private SimpleTransactionManager tranManager;
    @Autowired
    private JsonWebTokenService jwt;

    public LocationService() {

    }

    /* Ajax 방식의 요청 컨트롤러 */
    public void backController(String serviceCode, Model model) {
	switch (serviceCode) {
	case "LO01":
	    this.getLocationList(model);
	    break;
	case "LO02":
	    this.modifyLocation(model);
	    break;
	case "LO03":
	    this.deleteLocation(model);
	    break;
	case "LO04":
	    this.regLocation(model);
	    break;
	}
    }

    /* View 방식의 요청 컨트롤러 */
    public void backController(String serviceCode, ModelAndView mav) {
	switch (serviceCode) {
	}
    }

    private void regLocation(Model model) {
	StoreBean store = (StoreBean) model.getAttribute("store");
	String message = "error:오류:오류가 발생했습니다. 잠시후 다시 시도해주세요.:";
	this.tranManager.tranStart();
	if (this.convertToBoolean(this.sqlSession.insert("insLocation", store))) {
	    this.tranManager.commit();
	    message = "plain::등록이 완료되었습니다!:";
	}
	store.setMessage(message);
	this.tranManager.tranEnd();
    }

    private void deleteLocation(Model model) {

    }

    private void modifyLocation(Model model) {

    }

    private void getLocationList(Model model) {

    }
}
