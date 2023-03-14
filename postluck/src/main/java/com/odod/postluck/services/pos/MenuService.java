package com.odod.postluck.services.pos;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.MenuBean;
import com.odod.postluck.beans.StoreBean;
import com.odod.postluck.utils.SimpleTransactionManager;
import com.odod.postluck.utils.TransactionAssistant;

@Service
public class MenuService extends TransactionAssistant {
	@Autowired
	private SimpleTransactionManager tranManager;
	@Autowired
	private MainService main;

	public MenuService() {

	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
			case "ME01" :
				this.getAllMenuList(model);
				break;
			// case "ME02":
			// this.dupCheckMenu(model);
			// break;
			case "ME03" :
				this.regMenu(model);
				break;
			case "ME05" :
				this.modifyMenuInfo(model);
				break;
			case "ME06" :
				this.deleteMenu(model);
				break;
		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
			case "ME06" :
				// this.deleteMenu(mav);
				break;
		}
	}

	private void getAllMenuList(Model model) {
		/*
		 * storeCode확인. 매장에 있는 메뉴 불러오기 selectMenu(where SM_STCODE=?)
		 */
		StoreBean storeMenu = (StoreBean) model.getAttribute("store");
		try {
			this.tranManager.tranStart();
			// storeCode가 존재한다면 oracle count값 = 1
			if (this.convertToBoolean(
					this.sqlSession.selectOne("isStCode", storeMenu))) {
				storeMenu.setMenuList(
						this.sqlSession.selectOne("selMenuList", storeMenu));
			} else {
				// storeCode가 존재하지 않는다면 oracle count값 = 0
				storeMenu.setMessage("사업자번호가 조회되지않았습니다.");
			}
		} catch (Exception e) {
			this.tranManager.commit();
		} finally {
			this.tranManager.tranEnd();
		}
	}
	private void regMenu(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		MultipartFile file = (MultipartFile) model.getAttribute("file");
		System.out.println(file);
		// System.out.println(store);
		String message = null;
		// 가져올 이미지 경로 : MenuImageLocation
		// ex) D:\Project\PosTLUCK\resources\image
		// 생성할 폴더 이름 : 사업자번호(1998033001)
		// 폴더경로 프로젝트폴더 resources > image폴더 안에 사업자번호(1998033001)로 생성.

		/* Transaction Start */
		this.tranManager.tranStart();
		try {
			System.out.println("트랜안에 들어옴");
			String menuCode = this.sqlSession.selectOne("selMaxMenuCode",
					store);
			if (menuCode == null) {
				menuCode = "M00";
				System.out.println("메뉴코드널");
			} else {
				System.out.println("메뉴코드널아님");
				System.out.println("바꾸기전메뉴코드" + menuCode);

				menuCode = "M"
						+ (Integer.parseInt(menuCode.substring(1)) + 1 < 10
								? "0" + (Integer.parseInt(menuCode.substring(2))
										+ 1)
								: Integer.parseInt(menuCode.substring(1)) + 1);
				System.out.println("바꾼후메뉴코드" + menuCode);
			}
			store.getMenuList().get(0).setMenuCode(menuCode);
			if (file != null) {
				String originalFilename = file.getOriginalFilename();
				String extension = originalFilename
						.substring(originalFilename.lastIndexOf("."));
				System.out.println("ImgType : " + extension);
				// 이미지 파일 저장할 폴더 경로.
				String folderPath = "C:\\Users\\user\\git\\postluck\\postluck\\src\\main\\webapp\\resources\\image\\"
						+ store.getStoreCode() + "\\";

				// 이미지 파일 이름. 19980336 M00 .png
				String fileName = store.getStoreCode()
						+ store.getMenuList().get(0).getMenuCode() + extension;

				// filePath += store.getStoreCode() + menuCode + ".jpg";
				store.getMenuList().get(0)
						.setMenuImageCode(store.getStoreCode() + menuCode);
				// 생성할 파일 이름 : 폴더이름(1998033001) + 메뉴코드(M00) + ".jpg"

				store.getMenuList().get(0)
						.setMenuImageLocation(folderPath + fileName);
				if (this.convertToBoolean(
						this.sqlSession.insert("insMenuImgCode", store))) {
					System.out.println("ImgCode : "
							+ store.getMenuList().get(0).getMenuImageCode());
				}
				if (!new File(folderPath).exists()) {
					new File(folderPath).mkdir();
				}
				if (!file.isEmpty()) {
					file.transferTo(new File(folderPath + fileName));
					System.out.println("파일 저장 완료. path: " + fileName);
				} else {
					System.out.println("파일이 없습니다.");
				}
			}
			if (this.convertToBoolean(
					this.sqlSession.insert("insMenu", store))) {
			} else {
				System.out.println("menuIns실패");
			}

			// if (this.convertToBoolean(this.sqlSession.insert("insMenuCode",
			// store))) {
			// 메뉴코드 우선추가 ('1998033036', M00, '00000','00000')
			this.tranManager.commit();
			store.setMessage("plain::메뉴 등록이 완료되었습니다!:sideMenu:2");
			model.addAttribute("store",
					this.main.getStoreInfoAsStoreBean(model));
		} catch (Exception e) {
			System.out.println("메뉴 reg 실패");
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {

			this.tranManager.tranEnd();
		}

	}

	private void modifyMenuInfo(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		MultipartFile file = null;
		if ((MultipartFile) model.getAttribute("file") != null) {
			file = (MultipartFile) model.getAttribute("file");
		}
		System.out.println("modiFyMenuInfo로 들어옴.");
		// String message = null;
		// ArrayList<MenuBean> menuList = null;
		// MenuBean menu = null;
		String folderPath = "C:\\Users\\user\\git\\postluck\\postluck\\src\\main\\webapp\\resources\\image\\"
				+ store.getStoreCode() + "\\";
		String filePath = folderPath;
		/* Transaction Start */
		this.tranManager.tranStart();
		try {
			System.out.println("트랜안에 들어옴");
			String menuCode = this.sqlSession.selectOne("selMaxMenuCode",
					store);
			if (menuCode != null) {
				System.out.println("메뉴코드 존재");
				System.out.println(store.getMenuList());
				store.getMenuList().get(0).setMenuCode(menuCode);
				filePath += store.getStoreCode() + menuCode + ".jpg";
				store.getMenuList().get(0)
						.setMenuImageCode(store.getStoreCode() + menuCode);
				// 생성할 파일 이름 : 폴더이름(1998033001) + 메뉴코드(M00) + ".jpg"
				if (this.convertToBoolean(
						this.sqlSession.insert("updMenu", store))) {
					this.tranManager.commit();
					store.setMessage("plain::메뉴 수정이 완료되었습니다!:sideMenu:2");
					model.addAttribute("store",
							this.main.getStoreInfoAsStoreBean(model));
					
				} else {
					System.out.println("MenuUpadate실패");
				}
				if (file != null && !file.isEmpty()) {
					file.transferTo(new File(filePath));
					System.out.println("파일 저장 완료. path: " + filePath);
				} else {
					System.out.println("파일이 없습니다.");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {

			this.tranManager.tranEnd();
		}
	}

	private void deleteMenu(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		String message = "error:오류:오류가 발생했습니다. 잠시후 다시 시도해주세요.:sideMenu:2";
		try {
			tranManager.tranStart();
			String imgLocate = sqlSession.selectOne("selImgLocation", store);
			if (imgLocate != null && !imgLocate.isEmpty()) {
				Path path = Paths.get(imgLocate);
				String extension = Files.probeContentType(path);
				if (extension != null && extension.startsWith("image/")) {
					File imageFile = new File(imgLocate);
					if (this.convertToBoolean(
							this.sqlSession.delete("delMenu", store))) {
						this.tranManager.commit();
						store.setMessage("plain::메뉴 삭제가 완료되었습니다!:sideMenu:2");
						model.addAttribute("store",
								this.main.getStoreInfoAsStoreBean(model));
					} else {
						System.out.println("메뉴삭제 실패");
					}
					if (this.convertToBoolean(
							this.sqlSession.delete("delMenuImgDB", store))) {
						if (imageFile.delete()) {
							store.setMessage(
									"plain::메뉴 삭제가 완료되었습니다!:sideMenu:2");
							System.out.println("이미지 파일이 삭제되었습니다: " + imgLocate);
						} else {
							store.setMessage(
									"plain::메뉴 삭제가 완료되었습니다!:sideMenu:2");
							System.out.println(
									"이미지 파일 삭제에 실패하였습니다: " + imgLocate);
						}
					} else {
						store.setMessage("plain::메뉴 삭제가 완료되었습니다!:sideMenu:2");
					}

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			tranManager.rollback();
			store.setMessage(message);
		} finally {
			tranManager.tranEnd();
		}
	}

}
