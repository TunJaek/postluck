package com.odod.postluck.services.pos;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class StoreService extends TransactionAssistant {

	@Autowired
	private SimpleTransactionManager tranManager;
	@Autowired
	private MainService main;

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
		System.out.println("updStoreInfo");
		StoreBean store = (StoreBean) model.getAttribute("store");
		this.tranManager.tranStart();
		if ((MultipartFile) model.getAttribute("file") != null) {
			System.out.println("file is not null");
			MultipartFile file = (MultipartFile) model.getAttribute("file");
			String originalFilename = file.getOriginalFilename();
			String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
			// 이미지 파일 저장할 폴더 경로.
			String folderPath = "C:\\Users\\user\\git\\postluck\\postluck\\src\\main\\webapp\\resources\\image\\"
					+ store.getStoreCode() + "\\";
			// 이미지 파일 이름. 19980336 M00 .png
			String fileName = store.getStoreCode() + "S00" + extension;
			store.setStoreImageLocation(folderPath + fileName);

			if (this.convertToBoolean(this.sqlSession.insert("insStoreImageCode", store))) {
				System.out.println("ImgCode : " + store.getStoreImageCode());
				if (!new File(folderPath).exists()) {
					new File(folderPath).mkdir();
				}
			} else {
				System.out.println("menuIns실패");
			}

			if (!file.isEmpty()) {
				try {
					File folder = new File(folderPath + fileName);
					File[] files = folder.listFiles();
					if(files!=null && files.length>0) {
						for (int i = 0; i < files.length - 1; i++) {
							for (int j = i + 1; j < files.length; j++) {
								if (files[i].getName().equalsIgnoreCase(files[j].getName())) {
									files[i].delete();
									break;
								}
							}
						}
					}
					file.transferTo(new File(folderPath + fileName));
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					this.tranManager.rollback();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					this.tranManager.rollback();
				}finally {
					this.tranManager.tranEnd();
				}
				System.out.println("파일 저장 완료. path: " + fileName);
			} else {
				System.out.println("파일이 없습니다.");
			}
		}

		if (this.convertToBoolean(this.sqlSession.update("updStoreInfo", store))) {
			this.tranManager.commit();
			store.setMessage("plain::매장 정보 수정이 완료되었습니다!::");

			model.addAttribute("store", this.main.getStoreInfoAsStoreBean(model));
			System.out.println(store);
		} else {
			store.setMessage("error:오류:매장 정보 수정중 오류가 발생했습니다.::");
		}
		this.tranManager.tranEnd();
	}

}
