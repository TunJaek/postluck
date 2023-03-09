package com.odod.postluck.services.order;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.odod.postluck.beans.OrderBean;
import com.odod.postluck.beans.OrderInfoBean;
import com.odod.postluck.beans.StoreBean;

@RestController
public class OrderRestController {
	@Autowired
	private OrderService orderService;
	
	@PostMapping("/Api/makeOrder")
	public OrderInfoBean makeOrder(Model model, @RequestBody StoreBean store) {
		model.addAttribute("order",store);
		this.orderService.backController("OR01", model);
		System.out.println(store);
		return (OrderInfoBean)model.getAttribute("orderInfo");
	}
	@PostMapping("/Api/getOrderInfo")
	public OrderBean makeOrder(Model model, @ModelAttribute OrderInfoBean order) {
		System.out.println("orderInfo in controller is " + order);
		model.addAttribute("orderInfo",order);
		this.orderService.backController("OR02", model);
		return (OrderBean)model.getAttribute("order");
	}
	@PostMapping("/Api/GetOrderList")
	public ArrayList<OrderBean> getOrderList(Model model, @ModelAttribute OrderInfoBean storeInfo) {
		model.addAttribute("storeInfo",storeInfo);
		this.orderService.backController("OR03", model);
		return (ArrayList<OrderBean>)model.getAttribute("orderList");
	}
	@PostMapping("/Api/CancelOrder")
	public OrderInfoBean cancelOrder(Model model,@ModelAttribute OrderInfoBean orderInfo) {
		model.addAttribute("cancelOrder",orderInfo);
		this.orderService.backController("OR04",model);
		return (OrderInfoBean)model.getAttribute("cancelOrder");
	}
	@PostMapping("/Api/CompleteOrder")
	public OrderInfoBean completeOrder(Model model,@ModelAttribute OrderInfoBean orderInfo) {
		model.addAttribute("completeOrder",orderInfo);
		this.orderService.backController("OR05",model);
		return (OrderInfoBean)model.getAttribute("completeOrder");
	}
}
