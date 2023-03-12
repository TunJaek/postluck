package com.odod.postluck.beans;

import java.util.ArrayList;

import lombok.Data;

@Data
public class StoreBean {
	private String storeName;
	private String storeCategory;
	private String storeCode;
	private String storeInfo;
	private String storeInfoDetail;
	private String storeImageCode;
	private String storePhone;
	private String snsType;
	private String snsID;
	private String ceoEmail;
	private String ceoName;
	private String isOpen;
	private String storeLocationCode;
	private ArrayList<LocationBean> locationList;
	private ArrayList<MenuBean> menuList;
	private ArrayList<AccessLogBean> accessLogList;
	private ArrayList<OrderBean> orderList;
	private ArrayList<SalesLogBean> salesLogList;
	private String message;
}
