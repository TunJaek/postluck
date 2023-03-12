package com.odod.postluck.services.home;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odod.postluck.beans.LocationBean;
import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.services.pos.MainService;
import com.odod.postluck.utils.ProjectUtils;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class HomeService extends TransactionAssistant {
	@Autowired
	private ProjectUtils pu;
	@Autowired
	private SimpleTransactionManager tranManager;
	@Autowired
	private MainService main;

	public HomeService() {
	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {

		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "HO01":
			this.getStoreList(mav);
			break;
		}
	}

	private void getStoreList(ModelAndView mav) {
		List<StoreBean> storeList;
		ArrayList<StoreBean> storeListArr;
		try {
			this.tranManager.tranStart();
			storeList = this.sqlSession.selectList("selStoreList");
			storeListArr = (ArrayList<StoreBean>) storeList;
			for (StoreBean store : storeListArr) {
				LocationBean location = new LocationBean();
				location = (LocationBean) this.sqlSession.selectOne("selStoreLocation", store);
				ArrayList<LocationBean> locationList = new ArrayList<LocationBean>();
				store.setLocationList(locationList);
				store.getLocationList().add(location);
			}
			mav.addObject("storeList", new ObjectMapper().writeValueAsString(storeListArr));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.tranManager.tranEnd();
			mav.setViewName("home");
		}

	}

}
