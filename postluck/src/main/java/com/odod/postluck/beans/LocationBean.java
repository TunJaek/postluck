package com.odod.postluck.beans;

import lombok.Data;

@Data
public class LocationBean {
	private String locationCode;	// 위치 코드(L01, L02, ...)
	private String locationName;	// 위치명 
	private String locationDetail;
	private String locationAddr;
	private double latitude;		// 위도
	private double longitude;		// 경도
}
