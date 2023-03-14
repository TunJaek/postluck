package com.odod.postluck.beans;

import java.util.ArrayList;

import lombok.Data;

@Data	
public class SalesAnalysisBean {
	private String storeCode;
	private int period;
	
	private ArrayList<CountAmountBean> countAmountList;
	private ArrayList<OrderDetailBean> salesMenuList;
	private ArrayList<LocationBean> salesLocationList;
}
