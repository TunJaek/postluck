package com.odod.postluck.services.home;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odod.postluck.beans.HomeSearchBean;
import com.odod.postluck.beans.LocationBean;
import com.odod.postluck.beans.MenuBean;
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
		this.getSearchStoreList(model);
		break;
		}
	}

	private void getSearchStoreList(Model model) {
			HomeSearchBean locate = (HomeSearchBean) model.getAttribute("locate");
			String city=locate.getCity();
			String country=locate.getCountry();
			String adress = (city+" ") + (country +"");
			System.out.println("adress"+adress);
			locate.setLocate(adress);
			System.out.println(locate);
			List<StoreBean> storeList;
			ArrayList<StoreBean> storeListArr;
			try {
				this.tranManager.tranStart();
				storeList = this.sqlSession.selectList("getSearchStoreList",locate);
				storeListArr = (ArrayList<StoreBean>) storeList;
				for (StoreBean store : storeListArr) {
					LocationBean location = new LocationBean();
					location = (LocationBean) this.sqlSession.selectOne("selStoreLocation", store);
					ArrayList<LocationBean> locationList = new ArrayList<LocationBean>();
					store.setLocationList(locationList);
					store.getLocationList().add(location);
				}
			model.addAttribute("storeList", storeListArr);
			System.out.println("최종 스토어"+model);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				this.tranManager.tranEnd();
			}

		
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "HO01":
			this.getStoreList(mav);
			break;
		case "HO02":
			this.getStoreInfoDetail(mav);
			break;
		}
	}

	private void getStoreInfoDetail(ModelAndView mav) {
		String storeCode = mav.getModel().get("storeCode").toString();
		StoreBean store = new StoreBean();
		try {
			this.tranManager.tranStart();
			store = this.sqlSession.selectOne("selStoreInfoForHome", storeCode);
			LocationBean location = new LocationBean();
			location = this.sqlSession.selectOne("selStoreLocationForHome", store);
			ArrayList<LocationBean> locationList = new ArrayList<LocationBean>();
			locationList.add(location);
			store.setLocationList(locationList);
			List<MenuBean> menuList = this.sqlSession.selectList("selStoreMenuForHome", store);
			ArrayList<MenuBean> menuListArr = (ArrayList<MenuBean>) menuList;
			store.setMenuList(menuListArr);

			mav.addObject("store", store);
			mav.addObject("menuList", new ObjectMapper().writeValueAsString(menuListArr));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.tranManager.tranEnd();
		}
		mav.setViewName("home-storeInfo");
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
