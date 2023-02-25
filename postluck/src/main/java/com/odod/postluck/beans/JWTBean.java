package com.odod.postluck.beans;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class JWTBean {
	private String storeCode;
	private String snsID;
	private String snsType;
	private String ceoEmail;
	private String ceoName;
}
