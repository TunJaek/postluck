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
		case "ME01":
			this.getAllMenuList(model);
			break;
//		case "ME02":
//			this.dupCheckMenu(model);
//			break;
		case "ME03":
			this.regMenu(model);
			break;
//		case "ME04":
//			this.getMenuInfo(model);
//			break;
		case "ME05":
			this.modifyMenuInfo(model);
			break;
		case "ME06":
			this.deleteMenu(model);
			break;
		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "ME06":
//			this.deleteMenu(mav);
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
//	private void getAllMenuList(Model model) {
//		/*
//		 * storeCode확인. 매장에 있는 메뉴 불러오기 selectMenu(where SM_STCODE=?)
//		 */
//		StoreBean storeMenu = (StoreBean) model.getAttribute("store");
//		try {
//			this.tranManager = getTransaction(false);
//			this.tranManager.tranStart();
//			// storeCode가 존재한다면 oracle count값 = 1
//			if (this.convertToBoolean(this.sqlSession.selectOne("isStCode", storeMenu))) {
//				storeMenu.setMenuList(this.sqlSession.selectOne("selMenuList", storeMenu));
//			} else {
//				// storeCode가 존재하지 않는다면 oracle count값 = 0
//				storeMenu.setMessage("사업자번호가 조회되지않았습니다.");
//			}
//		} catch (Exception e) {
//		} finally {
//
//			this.tranManager.tranEnd();
//		}
//	}

	private void regMenu(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		MultipartFile file = (MultipartFile) model.getAttribute("file");
		System.out.println(file);
//		System.out.println(store);
		String message = null;
		// 가져올 이미지 경로 : MenuImageLocation
		// ex) D:\Project\PosTLUCK\resources\image
		// 생성할 폴더 이름 : 사업자번호(1998033001)
		// 폴더경로 프로젝트폴더 resources > image폴더 안에 사업자번호(1998033001)로 생성.

		/* Transaction Start */
		this.tranManager.tranStart();
		try {
			System.out.println("트랜안에 들어옴");
			String menuCode = this.sqlSession.selectOne("selMaxMenuCode", store);
			if (menuCode == null) {
				menuCode = "M00";
				System.out.println("메뉴코드널");
			} else {
				System.out.println("메뉴코드널아님");
				System.out.println("바꾸기전메뉴코드" + menuCode);

				menuCode = "M" + (Integer.parseInt(menuCode.substring(1)) + 1 < 10
						? "0" + (Integer.parseInt(menuCode.substring(2)) + 1)
						: Integer.parseInt(menuCode.substring(1)) + 1);
				System.out.println("바꾼후메뉴코드" + menuCode);
			}
			store.getMenuList().get(0).setMenuCode(menuCode);

			String originalFilename = file.getOriginalFilename();
			String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
			System.out.println("ImgType : " + extension);
			// 이미지 파일 저장할 폴더 경로.
			String folderPath = "C:\\Users\\user\\git\\postluck\\postluck\\src\\main\\webapp\\resources\\image\\"
					+ store.getStoreCode() + "\\";

			// 이미지 파일 이름. 19980336 M00 .png
			String fileName = store.getStoreCode() + store.getMenuList().get(0).getMenuCode() + extension;

//			filePath += store.getStoreCode() + menuCode + ".jpg";
			store.getMenuList().get(0).setMenuImageCode(store.getStoreCode() + menuCode);
			// 생성할 파일 이름 : 폴더이름(1998033001) + 메뉴코드(M00) + ".jpg"

			store.getMenuList().get(0).setMenuImageLocation(folderPath + fileName);
			if (this.convertToBoolean(this.sqlSession.insert("insMenuImgCode", store))) {
				System.out.println("ImgCode : " + store.getMenuList().get(0).getMenuImageCode());
				if (this.convertToBoolean(this.sqlSession.insert("insMenu", store))) {
					if (!new File(folderPath).exists()) {
						new File(folderPath).mkdir();
					}
				} else {
					System.out.println("menuIns실패");
				}

				if (!file.isEmpty()) {
					file.transferTo(new File(folderPath + fileName));
					System.out.println("파일 저장 완료. path: " + fileName);
				} else {
					System.out.println("파일이 없습니다.");
				}
				this.tranManager.commit();
			}
			// if (this.convertToBoolean(this.sqlSession.insert("insMenuCode", store))) {
			// 메뉴코드 우선추가 ('1998033036', M00, '00000','00000')
			this.tranManager.commit();
		} catch (Exception e) {
			System.out.println("메뉴 reg 실패");
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			store.setMessage("plain::메뉴 등록이 완료되었습니다!:showModal:");
		}

	}

	private void modifyMenuInfo(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		MultipartFile file = (MultipartFile) model.getAttribute("file");
		System.out.println("modiFyMenuInfo로 들어옴.");
//		String message = null;
//		ArrayList<MenuBean> menuList = null;
//		MenuBean menu = null;
		String folderPath = "C:\\Users\\user\\git\\postluck\\postluck\\src\\main\\webapp\\resources\\image\\"
				+ store.getStoreCode() + "\\";
		String filePath = folderPath;
		/* Transaction Start */
		try {
			System.out.println("트랜안에 들어옴");
			String menuCode = this.sqlSession.selectOne("selMaxMenuCode", store);
			if (menuCode != null) {
				System.out.println("메뉴코드 존재");
				System.out.println(store.getMenuList());
				store.getMenuList().get(0).setMenuCode(menuCode);
				filePath += store.getStoreCode() + menuCode + ".jpg";
				store.getMenuList().get(0).setMenuImageCode(store.getStoreCode() + menuCode);
				// 생성할 파일 이름 : 폴더이름(1998033001) + 메뉴코드(M00) + ".jpg"
				if (this.convertToBoolean(this.sqlSession.insert("updMenu", store))) {
					this.tranManager.commit();
				} else {
					System.out.println("MenuUpadate실패");
				}
				if (!file.isEmpty()) {
					file.transferTo(new File(filePath));
					System.out.println("파일 저장 완료. path: " + filePath);
				} else {
					System.out.println("파일이 없습니다.");
				}
				// if (this.convertToBoolean(this.sqlSession.insert("insMenuCode", store))) {
				// 메뉴코드 우선추가 ('1998033036', M00, '00000','00000')
				this.tranManager.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			store.setMessage("plain::메뉴 수정이 완료되었습니다!:showModal:");
			this.tranManager.tranEnd();
		}
	}

	private void deleteMenu(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		String message = "warn:오류:오류가 발생했습니다. 잠시후 다시 시도해주세요.:sideMenu:2";
		String storeCode = store.getStoreCode();
		String menuCode = this.sqlSession.selectOne("selMaxMenuCode", store);
		List<MenuBean> menuList = store.getMenuList();
		if (menuList == null || menuList.isEmpty()) {
			store.setMessage(message);
			return;
		}
		if (menuCode == null || menuCode.isEmpty()) {
			store.setMessage(message);
			return;
		}

		try {
			tranManager.tranStart();
			String imgLocate = sqlSession.selectOne("selImgLocation", store);
			if (imgLocate != null && !imgLocate.isEmpty()) {
				Path path = Paths.get(imgLocate);
				String extension = Files.probeContentType(path);
				if (extension != null && extension.startsWith("image/")) {
					File imageFile = new File(imgLocate);
					if (imageFile.delete()) {
						System.out.println("이미지 파일이 삭제되었습니다: " + imgLocate);

						if (this.convertToBoolean(sqlSession.delete("delMenu", store))) {
							if (this.convertToBoolean(sqlSession.delete("delMenuImgDB", store))) {

								store.setMessage("plain::메뉴 삭제가 완료되었습니다!(사진포함):showModal:");
							} else {
								store.setMessage("plain:: DB STOREIMAGE TALBE을 확인해주세요!:showModal:");
							}
						} else {

						}
					} else {
						System.out.println("이미지 파일 삭제에 실패하였습니다: " + imgLocate);
					}
					this.tranManager = getTransaction(false);
					this.tranManager.tranStart();
					System.out.println("MenuCode : " + store.getMenuList().get(0).getMenuCode());
					// 선택한 메뉴코드의 값이 비어있지않다면
					if (store.getMenuList().get(0).getMenuCode() != null) {
						if (this.convertToBoolean(this.sqlSession.delete("delMenu", store))) {
							this.tranManager.commit();
						}
						tranManager.commit();
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
//	private void deleteMenu(Model model) {
//		StoreBean store = (StoreBean) model.getAttribute("store");
//		MultipartFile file = (MultipartFile) model.getAttribute("file");
//		System.out.println("deleteMenu로 들어옴.");
////		String message = null;
////		ArrayList<MenuBean> menuList = null;
////		MenuBean menu = null;
//		String folderPath = "C:\\Users\\user\\git\\postluck\\postluck\\src\\main\\webapp\\resources\\image\\"
//				+ store.getStoreCode() + "\\";
//		String filePath = folderPath;
//		String message = "warn:오류:오류가 발생했습니다. 잠시후 다시 시도해주세요.:sideMenu:2";
//
//		try {
//			this.tranManager = getTransaction(false);
//			this.tranManager.tranStart();
//			System.out.println("MenuCode : " + store.getMenuList().get(0).getMenuCode());
//			// 선택한 메뉴코드의 값이 비어있지않다면
//			if(store.getMenuList().get(0).getMenuCode() != null) {
//				if(this.convertToBoolean(this.sqlSession.delete("delMenu",store))) {
//					this.tranManager.commit();
//				}
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			this.tranManager.rollback();
//		} finally {
//			store.setMessage("plain::메뉴 삭제가 완료되었습니다!:showModal:");
//			this.tranManager.tranEnd();
//		}
//	}

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

}
//	private void dupCheckMenu(Model model) {
//		// 메뉴코드는 자동생성 메뉴이름을 입력했을 때 중복검사.
//		StoreBean store = (StoreBean) model.getAttribute("store");
//
//		String message = null;
//
//		// Transaction Start
//		try {
//			this.tranManager = getTransaction(false);
//			this.tranManager.tranStart();
//			if (this.convertToBoolean(this.sqlSession.insert("insMenuTemp", store))) {
//				// 추가할 메뉴의 정보를 입력하고 동일한 메뉴가 있는지 조회.
//				if (this.convertToBoolean(this.sqlSession.selectOne("isMenuName", store))) {
//					message = "중복된 메뉴가 있습니다. 다시 설정해주세요.";
//					store.getMenuList().get(0).setMenuName(null);
//					// 동일한 메뉴이름이 있으면 메뉴이름은 초기화.
//				} else {
//					message = "정상처리되었습니다.";
//				}
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			this.tranManager.rollback();
//		} finally {
//			this.regMenu(model, true);
//			this.tranManager.tranEnd();
//		}
//	}

//	private void dupCheckMenu(Model model) {
//		// 메뉴코드는 자동생성 메뉴이름을 입력했을 때 중복검사.
//		StoreBean store = (StoreBean) model.getAttribute("store");
//
//		String message = null;
//
//		// Transaction Start
//		try {
//			this.tranManager = getTransaction(false);
//			this.tranManager.tranStart();
//			if (this.convertToBoolean(this.sqlSession.insert("insMenuTemp", store))) {
//				// 추가할 메뉴의 정보를 입력하고 동일한 메뉴가 있는지 조회.
//				if (this.convertToBoolean(this.sqlSession.selectOne("isMenuName", store))) {
//					message = "중복된 메뉴가 있습니다. 다시 설정해주세요.";
//					store.getMenuList().get(0).setMenuName(null);
//					// 동일한 메뉴이름이 있으면 메뉴이름은 초기화.
//				} else {
//					message = "정상처리되었습니다.";
//				}
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			this.tranManager.rollback();
//		} finally {
//			this.regMenu(model, true);
//			this.tranManager.tranEnd();
//		}
//	}

//	private void getMenuInfo(Model model) {
//		/*
//		 * 메뉴리스트에서 해당 메뉴를 클릭시 해당 메뉴에대한 정보가 나옴.
//		 */
//		StoreBean storeMenu = (StoreBean) model.getAttribute("store");
//		String message = "메뉴를 불러오는 과정에서 오류가 발생했습니다 다시 시도해주세요.";
//
//		this.tranManager = getTransaction(false);
//
//		try {
//			this.tranManager.tranStart();
//			// 선택한 메뉴의 메뉴코드가 존재한다면
//			if (storeMenu.getMenuList().get(0).getMenuCode() != "") {
//				storeMenu.setMenuList(this.sqlSession.selectOne("selMenuInfo", storeMenu));
//			}
//		} catch (Exception e) {
//			storeMenu.setMessage(message);
//		}
//	}

//	public void saveImg(Model model) {
/*
 * StoreBean store = (StoreBean) model.getAttribute("store");
 * System.out.println("이미지 작업하는곳 까진 들어옴."); System.out.println("imgStore : " +
 * store); // String imagePath = menu.getMenuImageCode(); // 가져올 이미지 경로 :
 * MenuImageLocation // ex) D:\Project\PosTLUCK\resources\image String imagePath
 * = store.getMenuList().get(0).getMenuImageLocation(); // 생성할 폴더 이름 :
 * 사업자번호(1998033001) String folderName = store.getStoreCode(); // 폴더경로 프로젝트폴더
 * resources > image폴더 안에 사업자번호(1998033001)로 생성. String folderPath =
 * "D:\\Project\\PosTLUCK\\resources\\image\\" + folderName; // 생성할 파일 이름 :
 * 폴더이름(1998033001) + 메뉴코드(M00) + ".jpg" String newFileName = null; // 파일 객체 생성
 * File file = new File(imagePath);
 * 
 * try { // folderPath(resources\\image\\~)사업자번호로 만든 폴더가 존재하지 않으면 폴더 생성 if (!new
 * File(folderPath).exists()) { boolean createFolder = new
 * File(folderPath).mkdir(); if (!createFolder) {
 * System.out.println("폴더 생성 실패"); return; } } else { // 파일의 MIME 타입을 확인. String
 * mimeType = Files.probeContentType(file.toPath()); if (mimeType == null ||
 * !mimeType.startsWith("image/")) { // mimeType이 없거나 image.png/jpg 등을 구별하는
 * 'image/' 문구가없으면 이미지파일이 아님. System.out.println("올바른 이미지 파일이 아닙니다."); return; }
 * else { // mimeType이 판별되면 파일복사 작업 시작.
 * 
 * // 새로 생성할 파일의 이름 : 사업자번호 + 메뉴코드 +. + mimeType // 1998033001M00.jpg
 * newFileName = folderName + store.getMenuList().get(0).getMenuCode() + "." +
 * mimeType;
 * 
 * FileInputStream inputStream = new FileInputStream(file); // 새로 만들 파일의 이름 :
 * 폴더이름(1998033001) + file의 값(SM_CODE) File newFile = new File(newFileName);
 * newFile.createNewFile(); java.nio.file.Files.copy(inputStream,
 * newFile.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
 * inputStream.close(); } } } catch (IOException e) { e.printStackTrace(); } }
 */

//	public void imageUploader(Model model) {
//		StoreBean store = (StoreBean) model.getAttribute("store");
//
//		// String imagePath = menu.getMenuImageCode();
//		// 가져올 이미지 경로 : MenuImageLocation
//		// ex) D:\Project\PosTLUCK\resources\image
//		String imagePath = store.getMenuList().get(0).getMenuImageLocation();
//		// 생성할 폴더 이름 : 사업자번호(1998033001)
//		String folderName = store.getStoreCode();
//		// 폴더경로 프로젝트폴더 resources > image폴더 안에 사업자번호(1998033001)로 생성.
//		String folderPath = "D:\\Project\\PosTLUCK\\resources\\image" + folderName;
//		// 생성할 파일 이름 : 폴더이름(1998033001) + 메뉴코드(M00) + ".jpg"
//		String newFileName = null;
//		// 파일 객체 생성
//		File file = new File(imagePath);
//
//		try {
//			// folderPath(resources\\image\\~)사업자번호로 만든 폴더가 존재하지 않으면 폴더 생성
//			if (!new File(folderPath).exists()) {
//				boolean createFolder = new File(folderPath).mkdir();
//				if (!createFolder) {
//					System.out.println("폴더 생성 실패");
//					return;
//				}
//			} else {
//				// 파일의 MIME 타입을 확인.
//				String mimeType = Files.probeContentType(file.toPath());
//				if (mimeType == null || !mimeType.startsWith("image/")) {
//					// mimeType이 없거나 image.png/jpg 등을 구별하는 'image/' 문구가없으면 이미지파일이 아님.
//					System.out.println("올바른 이미지 파일이 아닙니다.");
//					return;
//				} else {
//					// mimeType이 판별되면 파일복사 작업 시작.
//
//					// 새로 생성할 파일의 이름 : 사업자번호 + 메뉴코드 +. + mimeType
//					// 1998033001M00.jpg
//					newFileName = folderName + store.getMenuList().get(0).getMenuCode() + "." + mimeType;
//
//					FileInputStream inputStream = new FileInputStream(file);
//					// 새로 만들 파일의 이름 : 폴더이름(1998033001) + file의 값(SM_CODE)
//					File newFile = new File(newFileName);
//					newFile.createNewFile();
//					java.nio.file.Files.copy(inputStream, newFile.toPath(),
//							java.nio.file.StandardCopyOption.REPLACE_EXISTING);
//					inputStream.close();
//				}
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}

//		try {
//			if (!new File(folderPath).exists()) {
//				// 사업자번호로 만든 폴더가 존재하지 않으면 폴더 생성
//				boolean createFolder = new File(folderPath).mkdir();
//
//				if (!createFolder) {
//					System.out.println("폴더 생성 실패");
//
//					return;
//				}
//			} else {
//				// 사업자 번호로된 폴더가 있을시 파일복사작업.
//				FileInputStream inputStream = new FileInputStream(file);
//				// 새로 만들 파일의 이름 : 폴더이름(1998033001) + file의 값(SM_CODE)
//				File newFile = new File(newFileName);
//				newFile.createNewFile();
//				java.nio.file.Files.copy(inputStream, newFile.toPath(),
//						java.nio.file.StandardCopyOption.REPLACE_EXISTING);
//
//			}
//		} catch (Exception e) {
//
//			e.printStackTrace();
//			// TODO: handle exception
//		}

//	private void deleteMenu(ModelAndView mav) {
//
//	}

// github.com/dPfal/postluck.git
