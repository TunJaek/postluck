package com.odod.postluck.beans;

import lombok.Data;

@Data
public class OrderDetailBean {
	private MenuBean menu;
	private int quantity;
}
