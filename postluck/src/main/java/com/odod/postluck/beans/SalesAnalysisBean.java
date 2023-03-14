package com.odod.postluck.beans;

import lombok.Data;

@Data	
public class SalesAnalysisBean {
	private int cardSales;
	private int cashSales;
	private int cardSalesNum;
	private int cashSalesNum;
	private String period;
	private String paymentType;
	private int totalPrice;
	private int countSales;
	private String locationName;
	private String locationAddr;
	private String locationDetail;
	private String menuName;
}
