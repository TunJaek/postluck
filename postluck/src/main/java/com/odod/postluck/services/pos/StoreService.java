package com.odod.postluck.services.pos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.JsonWebTokenService;
import com.odod.postluck.utils.ProjectUtils;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class StoreService extends TransactionAssistant {

    @Autowired
    private ProjectUtils pu;
    @Autowired
    private SimpleTransactionManager tranManager;

    public StoreService() {
    }

    /* Ajax 방식의 요청 컨트롤러 */
    public void backController(String serviceCode, Model model) {
	switch (serviceCode) {
	case "ST00":
	    this.insStoreInfo(model);
	    break;

	case "ST02":
	    this.updStoreInfo(model);

	}
    }

    /* View 방식의 요청 컨트롤러 */
    public void backController(String serviceCode, ModelAndView mav) {
	switch (serviceCode) {
	case "ST01":
	    this.selStoreInfo(mav);
	    break;
	}
    }

    private void selStoreInfo(ModelAndView mav) {

    }

    private void insStoreInfo(Model model) {

    }

    private void updStoreInfo(Model model) {
	StoreBean store = (StoreBean) model.getAttribute("store");
	StoreBean st;
	this.tranManager.tranStart();
	try {
	    store.setStoreCode(((StoreBean) this.pu.getAttribute("AccessInfo")).getStoreCode());
	    store.setSnsID(((StoreBean) this.pu.getAttribute("AccessInfo")).getSnsID());
	    if (this.convertToBoolean(this.sqlSession.update("updStoreInfo", store))) {
		this.tranManager.commit();
		st = (StoreBean)this.sqlSession.selectList("selStoreInfo",store).get(0);
		st.setMessage("plain::매장 정보 수정이 완료되었습니다!:");
		model.addAttribute("store",st);
		this.pu.setAttribute("store", st);
		System.out.println(st);
		System.out.println(store);
	    } else {
		store.setMessage("error:오류:매장 정보 수정중 오류가 발생했습니다.:");
	    }
	} catch (Exception e) {
	    this.tranManager.rollback();
	    e.printStackTrace();
	}
	finally {
	    this.tranManager.tranEnd();
	}
    }

}
