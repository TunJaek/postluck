package com.odod.postluck.services.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.odod.postluck.beans.StoreBean;

@RestController
public class OrderRestController {
	@Autowired
	private OrderService orderService;
	
	@PostMapping("/Api/makeOrder")
	public String makeOrder(@RequestBody StoreBean store) {
		System.out.println("inMakeOrder");
		System.out.println(store);
		return store.getOrderList().get(0).getOrderDate();
	}
}
