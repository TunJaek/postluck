package com.odod.postluck.services.pos;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.MenuBean;
import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class MenuService extends TransactionAssistant {
	private SimpleTransactionManager tranManager;

	public MenuService() {

	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "ME01":
			this.getAllMenuList(model);
			break;
		case "ME02":
			this.dupCheckMenu(model);
			break;
		case "ME03":
			this.regMenu(model);
			break;
		case "ME04":
			this.getMenuInfo(model);
			break;
		case "ME05":
			this.modifyMenuInfo(model);
			break;
		case "ME06":
			this.deleteMenu(model);
			break;

		}
	}

	/* View 방식의 요청 컨트롤러 */
//	public void backController(String serviceCode, ModelAndView mav) {
//		switch (serviceCode) {
//		case "ME06":
//			this.deleteMenu(mav);
//			break;
//		}
//	}

	private void getAllMenuList(Model model) {
		/*
		 * storeCode확인. 매장에 있는 메뉴 불러오기 selectMenu(where SM_STCODE=?)
		 */
		StoreBean storeMenu = (StoreBean) model.getAttribute("store");

		this.tranManager = getTransaction(false);
		try {
			this.tranManager.tranStart();
			// storeCode가 존재한다면 oracle count값 = 1
			if (this.convertToBoolean(this.sqlSession.selectOne("isStCode", storeMenu))) {
				storeMenu.setMenuList(this.sqlSession.selectOne("selMenuList", storeMenu));
			} else {
				// storeCode가 존재하지 않는다면 oracle count값 = 0
				storeMenu.setMessage("사업자번호가 조회되지않았습니다.");
			}
		} catch (Exception e) {
		} finally {
			this.tranManager.tranEnd();
		}
	}

	private void dupCheckMenu(Model model) {
		// 메뉴코드는 자동생성 메뉴이름을 입력했을 때 중복검사.
		StoreBean storeMenu = (StoreBean) model.getAttribute("store");
		String message = "메뉴코드 또는 메뉴이름이 중복된 메뉴가있습니다. 다시 설정해주세요.";

		this.tranManager = getTransaction(false);
		/* Transaction Start */
		try {
			this.tranManager.tranStart();
			// 메뉴를 조회했을때 추가할려는 메뉴의 동일한 메뉴코드나 메뉴이름이 존재한다면?
			if (!this.convertToBoolean(this.sqlSession.selectOne("isMenuName", storeMenu))) {
			} else {
				storeMenu.getMenuList().get(0).setMenuName(null);
				storeMenu.setMessage(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {

			this.tranManager.tranEnd();
		}

	}

	private void regMenu(Model model) {
		StoreBean storeMenu = (StoreBean) model.getAttribute("store");
		String message = "메뉴를 추가하는 과정에서 오류가 발생했습니다 다시 시도해주세요.";

		this.tranManager = getTransaction(false);
		/* Transaction Start */
		try {
			this.tranManager.tranStart();

			if (this.convertToBoolean(this.sqlSession.insert("insMenu", storeMenu))) {
				this.tranManager.commit();
				storeMenu.setMessage("메뉴가 등록되었습니다. 많이 파세요~");
			} else {
				storeMenu.setMessage(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}
	}

	private void getMenuInfo(Model model) {
		/*
		 * 메뉴리스트에서 해당 메뉴를 클릭시 해당 메뉴에대한 정보가 나옴.
		 */
		StoreBean storeMenu = (StoreBean) model.getAttribute("store");
		String message = "메뉴를 불러오는 과정에서 오류가 발생했습니다 다시 시도해주세요.";

		this.tranManager = getTransaction(false);

		try {
			this.tranManager.tranStart();
			// 선택한 메뉴의 메뉴코드가 존재한다면
			if (storeMenu.getMenuList().get(0).getMenuCode() != "") {
				storeMenu.setMenuList(this.sqlSession.selectOne("selMenuInfo", storeMenu));
			}
		} catch (Exception e) {
			storeMenu.setMessage(message);
		}
	}

	private void modifyMenuInfo(Model model) {
		StoreBean storeMenu = (StoreBean) model.getAttribute("store");
		String message = "메뉴를 수정하는 과정에서 오류가 발생했습니다 다시 시도해주세요.";

		this.tranManager = getTransaction(false);
		/* Transaction Start */
		try {
			this.tranManager.tranStart();

			if (storeMenu.getMenuList().get(0).getMenuCode() != "") {
				this.sqlSession.update("updMenu", storeMenu);

				this.tranManager.commit();
			} else {
				storeMenu.setMessage(message);
				/* insMenu else */ }
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			storeMenu.setMessage("메뉴정보가 성공적으로 수정되었습니다.");
			this.tranManager.tranEnd();
		}
	}

	private void deleteMenu(Model model) {
		StoreBean storeMenu = (StoreBean) model.getAttribute("store");
		String message = "메뉴를 삭제하는 과정에서 오류가 발생했습니다 다시 시도해주세요.";

		this.tranManager = getTransaction(false);

		try {
			this.tranManager.tranStart();
			// 선택한 메뉴코드의 값이 비어있지않다면
			if (storeMenu.getMenuList().get(0).getMenuCode() != "") {
				this.convertToBoolean(this.sqlSession.delete("delMenu", storeMenu));

				storeMenu.getMenuList().get(0).setMenuCode(null);
				storeMenu.getMenuList().get(0).setMenuName(null);
				storeMenu.getMenuList().get(0).setMenuPrice(null);
				storeMenu.getMenuList().get(0).setMenuImageCode(null);
				storeMenu.setMessage("성공적으로 메뉴를 삭제하였습니다.");
				this.tranManager.commit();
			} else {
				storeMenu.setMessage(message);
			}

		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}

	}
//	private void deleteMenu(ModelAndView mav) {
//
//	}

}
