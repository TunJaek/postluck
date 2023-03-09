package com.odod.postluck.services.pos;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.odod.postluck.beans.StoreBean;

@RestController
public class PosRestController {
	@Autowired
	private LocationService locService;
	@Autowired
	private MainService mainService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private SalesService salesService;

	@PostMapping("/Api/UpdSalesLog")
	public StoreBean updSalesLog(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		this.mainService.backController("PO01", model);
		return (StoreBean) model.getAttribute("store");
	}

	@PostMapping("/Api/ModifyStoreInfo")
	public StoreBean modifyStoreInfo(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		this.storeService.backController("ST02", model);
		System.out.println("modifyStoreInfo" + model.getAttribute("store"));
		return (StoreBean) model.getAttribute("store");

	}

	@PostMapping("/Api/GetStoreInfo")
	public StoreBean getStoreInfo(Model model, @ModelAttribute StoreBean store) {
		System.out.println(store);
		model.addAttribute("store", store);
		this.mainService.backController("PO03", model);

		return (StoreBean) model.getAttribute("store");
	}

	@PostMapping("/Api/RegLocation")
	public StoreBean regLocation(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		System.out.println(model.addAttribute("store", store));
		this.locService.backController("LO04", model);
		return (StoreBean) model.getAttribute("store");
	}

	@PostMapping("/Api/ModifyLocation")
	public StoreBean modifyLocation(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		System.out.println(model.addAttribute("store", store));
		this.locService.backController("LO02", model);
		return (StoreBean) model.getAttribute("store");
	}

	@PostMapping("/Api/DeleteLocation")
	public StoreBean deleteLocation(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		System.out.println(model.addAttribute("store", store));
		this.locService.backController("LO03", model);
		return (StoreBean) model.getAttribute("store");
	}

	@PostMapping("/Api/RegMenu")
	public StoreBean regMenu(Model model, @ModelAttribute StoreBean store, @RequestParam("file") MultipartFile file)
			throws IOException {
		model.addAttribute("file", file);
		model.addAttribute("store", store);
//		System.out.println(model.addAttribute("store", store));
		System.out.println("RegMenu PostMapping들어옴");
		this.menuService.backController("ME03", model);
		return (StoreBean) model.getAttribute("store");
	}

	@PostMapping("/Api/ModifyMenu")
	public StoreBean modifyMenu(Model model, @ModelAttribute StoreBean store, @RequestParam("file") MultipartFile file)
			throws IOException {
		model.addAttribute("file", file);
		model.addAttribute("model", model);
		System.out.println(model.addAttribute("store", store));
		System.out.println("ModifyMenu PostMapping들어옴");
		this.menuService.backController("ME05", model);

		return (StoreBean) model.getAttribute("store");
	}

	@PostMapping("/Api/DeleteMenu")
	public StoreBean deleteMenu(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		System.out.println("DeleteMenu PostMapping들어옴");
		System.out.println(model.addAttribute("store", store));
		this.menuService.backController("ME06", model);
		return (StoreBean) model.getAttribute("store");
	}
	
	@PostMapping("/Api/ChangePayment")
	public StoreBean changePayment(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		this.salesService.backController("SA02", model);
		return (StoreBean)model.getAttribute("store");
	}
	@PostMapping("/Api/SelPayment")
	public StoreBean selPayment(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store",store);
		this.salesService.backController("SA01", model);
		return (StoreBean)model.getAttribute("store");
	}
	@PostMapping("/Api/selSalesDetail")
	public StoreBean selSalesDetail(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("salesStore", store);
		this.salesService.backController("SA03", model);
		return (StoreBean)model.getAttribute("salesStore");
	}

}
