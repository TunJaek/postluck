package com.odod.postluck.services.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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
}
