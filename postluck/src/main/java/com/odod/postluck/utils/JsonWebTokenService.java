package com.odod.postluck.utils;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.odod.postluck.beans.JWTBean;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JsonWebTokenService {
//	private long[] expiredDate = {1000L * 60 * 60, 1000L * 60 * 3};
    private long expiredDate = 1000L * 60 * 60 * 24;

    public String tokenIssuance(JWTBean tokenBody, String userKey) {

//		int expiredIdx = tokenBody.getEmpCode() != null? 0:1;
//		String subject = tokenBody.getEmpCode() != null? "AccessToken":"AuthToken";

	/* JWT Specification Configure 1 : Header */
	Map<String, Object> jwtHeaders = new HashMap<>();
	jwtHeaders.put("typ", "JWT");
	jwtHeaders.put("alg", "HS256");

	/* JWT Specification Configure 2-1 : SignatureAlgorithm */
	SignatureAlgorithm sa = SignatureAlgorithm.HS256;
	/* JWT Specification Configure 2-2 : SecretKey */
	Key secretKey = new SecretKeySpec(userKey.getBytes(), sa.getJcaName());

	return Jwts.builder().setHeader(jwtHeaders) // .setHeaderParam("typ", "JWT");
		.setIssuedAt(new Date(System.currentTimeMillis()))
		.setExpiration(new Date(System.currentTimeMillis() + expiredDate)).claim("TokenBody", tokenBody)
		.signWith(sa, secretKey) // .signWith(SignatureAlgorithm.HS256, secretKey.getBytes())
		.compact();
    }

    public Map<String, Object> getTokenInfo(String userToken, String userKey) throws Exception {
	Claims claims = null;
	try {
	    claims = Jwts.parser().setSigningKey(userKey.getBytes()).parseClaimsJws(userToken).getBody();
	} catch (Exception e) {
	    throw new Exception("Token does Not Exist");
	}
	return claims;
    }

    public JWTBean getTokenInfoFromJWT(String jwt) {
	JWTBean tokenInfo = null;
	try {
	    tokenInfo = new ObjectMapper()
		    .convertValue(this.getTokenInfo(jwt, "JWTForPostluckFromODOD").get("TokenBody"), JWTBean.class);
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	return tokenInfo;
    }

    public boolean tokenExpiredDateCheck(String userToken, String userKey) throws Exception {
	System.out.println(userToken);
	System.out.println(userKey);
	boolean result = false;
	try {
	    Claims claims = Jwts.parser().setSigningKey(userKey.getBytes()).parseClaimsJws(userToken).getBody();
	    result = !claims.getExpiration().before(new Date());
	} catch (ExpiredJwtException e) {
	    throw new Exception("Token does not contain Expiration date");
	}

	return result;
    }
}
