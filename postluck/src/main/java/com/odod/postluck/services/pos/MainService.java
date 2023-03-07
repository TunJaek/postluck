package com.odod.postluck.services.pos;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odod.postluck.beans.LocationBean;
import com.odod.postluck.beans.MenuBean;
import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.JsonWebTokenService;
import com.odod.postluck.utils.ProjectUtils;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class MainService extends TransactionAssistant {
	@Autowired
	private ProjectUtils pu;
	@Autowired
	private JsonWebTokenService jwts;
	@Autowired
	private SimpleTransactionManager tranManager;
	@Autowired
	private JsonWebTokenService jwt;
	@Autowired
	private MainService main;
	
	public MainService() {

	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "PO01":
			this.modifyStoreStatus(model);
			break;
		case "PO03":
			this.getStoreInfo(model);
			break;

		}

	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "PO02":
			this.movePosManage(mav);
			break;
		case "PO03":
			this.movePos(mav);
			break;
		}
	}

	private void getStoreInfo(Model model) {
		model.addAttribute("store", this.getStoreInfoAsStoreBean(model));

	}
	private void movePos(ModelAndView mav) {
		StoreBean store =(StoreBean) mav.getModel().get("store");
		store.setStoreCode(this.jwt.getTokenInfoFromJWT(mav.getModel().get("jwt").toString()).getStoreCode());
		try {
			mav.addObject("store", new ObjectMapper().writeValueAsString(this.main.getStoreInfoAsStoreBean(mav)));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.setViewName("pos-main");
	}
	/**
	 * @method private StoreBean getUserInfo(Model model)
	 * 
	 * @author 이예림
	 *
	 * @brief 사용자의 storeCode 값으로 저장된 정보를 storeBean 형태로 반환해주는 함수
	 * 
	 * @date 2023/03/02
	 * 
	 * @return StoreBean
	 * 
	 * @param storeBean(사용자의 storecode)을 담은 model 객체
	 * 
	 */
	public StoreBean getStoreInfoAsStoreBean(Object obj) {
		StoreBean store = null;
		String jwt = null;
		String message = null;
		if (obj instanceof ModelAndView) {
			System.out.println("this is mav");
			ModelAndView mav = (ModelAndView) obj;
			jwt = mav.getModel().get("jwt").toString();
			store = (StoreBean) mav.getModel().get("store");
			store.setStoreCode(this.jwts.getTokenInfoFromJWT(jwt).getStoreCode());
		} else if (obj instanceof Model) {
			System.out.println("this is model");
			Model model = (Model) obj;
			store = (StoreBean) model.getAttribute("store");
		} else {
			System.out.println("this is not mav or model");
		}
		message = store.getMessage();
		List<MenuBean> menuList;
		List<LocationBean> locationList;

		try {
			if (store.getStoreCode() != null) {
				store = (StoreBean) this.sqlSession.selectList("selStoreInfo", store).get(0);
				menuList = this.sqlSession.selectList("selMenuList", store);
				locationList = this.sqlSession.selectList("selLocationList", store);
				store.setLocationList((ArrayList<LocationBean>) locationList);
				store.setMenuList((ArrayList<MenuBean>) menuList);
				System.out.println("store Info is " + store);

			} else {
				System.out.println("storeCode is null or is not member");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			store.setMessage(message);
		}

		return store;
	}

	private void movePosManage(ModelAndView mav) {
		;
		try {
			mav.addObject("store", new ObjectMapper().writeValueAsString(this.getStoreInfoAsStoreBean(mav)));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.setViewName("pos-manage");
	}

	private void modifyStoreStatus(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		System.out.println(store.getStoreCode());
		try {
			this.tranManager = this.getTransaction(false);
			this.tranManager.tranStart();
			if (this.convertToBoolean(this.sqlSession.insert("insSalesLog", store))) {
				if (store.getSalesLogList().get(0).getSalesState() == 'O') {
					this.pu.setAttribute("isOpen", "true");
					store.setMessage("plain::영업이 시작되었습니다.:");
				} else if (store.getSalesLogList().get(0).getSalesState() == 'C') {
					this.pu.setAttribute("isOpen", "false");
					store.setMessage("plain::영업이 종료되었습니다.:");
				} else {
					store.setMessage("error:서버 오류:통신이 불안정합니다. 잠시후 다시 시도해주세요.::");
					// warn::삭제시 복구가 불가능합니다. 삭제하시겠습니까?: <, 버튼이 두개
					// error:에러(JWT가 없습니다<< 버튼이 하나
					//
				}
			}
			this.tranManager.commit();
		} catch (Exception e) {
			this.tranManager.rollback();
			e.printStackTrace();
		} finally {
			this.tranManager.tranEnd();
		}

	}

}
