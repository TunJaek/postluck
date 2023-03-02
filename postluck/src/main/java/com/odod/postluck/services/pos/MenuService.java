package com.odod.postluck.services.pos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.MenuBean;
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

		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "ME06":
			this.deleteMenu(mav);
			break;
		}
	}

	private void getAllMenuList(Model model) {
	}

	private void dupCheckMenu(Model model) {
		MenuBean menu = (MenuBean) model.getAttribute("menu");
		String message = "동일한 메뉴가 존재합니다 .다시 설정해주세요.";
		this.tranManager = getTransaction(false);
		try {
			this.tranManager.tranStart();
			if(this.convertToBoolean(sqlSession.selectOne("isMenu",menu))) {
				
			} else {
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
				
	} // 1 

	private void regMenu(Model model) {
		MenuBean menu = (MenuBean) model.getAttribute("menu");
		String message = "오류가 발생했습니다 다시 시도해주세요.";

		this.tranManager = getTransaction(false);
		/* Transaction Start */
		try {
			this.tranManager.tranStart();

			if (this.convertToBoolean(this.sqlSession.insert("insMenu", menu))) {

//			} else {
//				menu.setMessage(message);
				/* insMenu else */ }
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}
	} // 2

	private void getMenuInfo(Model model) {

	}

	private void modifyMenuInfo(Model model) {

	}

	private void deleteMenu(ModelAndView mav) {

	}

}
