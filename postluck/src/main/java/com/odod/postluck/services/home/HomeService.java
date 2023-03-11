package com.odod.postluck.services.home;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

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
		case "HO01":
			break;

		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		}
	}

	private void getStoreList(ModelAndView mav) {
		List<StoreBean> storeList;
		ArrayList<StoreBean> storeListArr;
		this.tranManager.tranStart();
		storeList = this.sqlSession.selectList("getStoreList");
		storeListArr = (ArrayList<StoreBean>) storeList;
		this.tranManager.tranEnd();
	}

}
