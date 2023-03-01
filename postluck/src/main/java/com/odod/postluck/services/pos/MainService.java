package com.odod.postluck.services.pos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.ProjectUtils;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class MainService extends TransactionAssistant {
	@Autowired
	private ProjectUtils pu;
	@Autowired
	private SimpleTransactionManager tranManager;

	public MainService() {

	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "PO01":
			this.modifyStoreStatus(model);
			break;

		}
	}

	private void modifyStoreStatus(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		System.out.println(store.getStoreCode());
		try {
			this.tranManager = this.getTransaction(false);
			this.tranManager.tranStart();
			if (this.convertToBoolean(this.sqlSession.insert("insSalesLog", store))) {
				store.setMessage("ins성공");
				if (store.getSalesLogList().get(0).getSalesState() == 'O') {
					this.pu.setAttribute("isOpen", "true");
				}else if(store.getSalesLogList().get(0).getSalesState() == 'C'){
					this.pu.setAttribute("isOpen", "false");
				}else {
					store.setMessage("error:서버 오류:통신이 불안정합니다. 잠시후 다시 시도해주세요.:");
					//warn::삭제시 복구가 불가능합니다. 삭제하시겠습니까?: <, 버튼이 두개
					//error:에러(JWT가 없습니다<< 버튼이 하나
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

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		}
	}

}
