package com.odod.postluck.beans;

import lombok.Data;

@Data
public class OrderDetailBean {
	private String menuCode; // 메뉴 코드 (M01,M02,M03...)
	private String menuName; // 메뉴 이름
	private String menuPrice; // 메뉴 가격
	private String menuImageCode; // 메뉴 이미지 코드 (storeCode+M01/M02, ...)
	private String menuImageLocation;// 메뉴 이미지 경로
	private char isMain; // 대표 메뉴 여부 (true: 대표 메뉴, false: 그 외)
	private char isKiosk; // 키오스크 메뉴 여부 (true: 키오스크 화면 표시, false: 키오스크 화면 표시하지않음)
	private char isSoldOut;
	private int quantity;
}
