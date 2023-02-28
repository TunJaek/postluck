package com.odod.postluck.beans;

import java.util.ArrayList;

import lombok.Data;

@Data
public class AccessLogBean {
	private String accessDate; //접속일시
	private char accessType; //접속타입 (true: 로그인, false: 로그아웃)
	private String accessIP;
}
