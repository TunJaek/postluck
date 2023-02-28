package com.odod.postluck.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.odod.postluck.beans.StoreBean;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class JwtIntercepter implements HandlerInterceptor {
	@Autowired
	private JsonWebTokenService jwtService;
	@Autowired
	private ProjectUtils util;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, 
			Object handler) throws Exception {
						
		String userKey = null, message = null;
		boolean result = false;
		if(!req.getMethod().equals("OPTIONS")) {// API Request(preFlight -> response -> Flight)인 경우 preFlight인 경우 제외
			
			if(!req.getMethod().equals("GET")) {
				if(((StoreBean)this.util.getAttribute("AccessInfo")) != null) {
					userKey = ((StoreBean)this.util.getAttribute("AccessInfo")).getSnsID();
					/* 통신방식에 따라 JWT 접근방식 달리하기 */
					String jwtToken = 
							req.getRequestURI().split("\\/")[1].equals("View")? 
									req.getParameter("JWTForPostluck") : req.getHeader("JWTForPostluck");
					
					if(jwtToken != null	&& jwtToken.length() > 0) {
						if((result = this.jwtService.tokenExpiredDateCheck(jwtToken, userKey)) == true) {
							message = null;
							result = true;
						} else message = "error:Session 오류:세션이 만료되었습니다.다시 로그인 해주세요.(jwt만료)";
					}else message = "error:Session 오류:세션이 만료되었습니다.다시 로그인 해주세요.(jwt null)";
				} else {
					System.out.println("attribute is"+(StoreBean)this.util.getAttribute("AccessInfo"));
					message = "error:Session 오류:보안상 다시 로그인을 해주세요.(accessinfo null)";	
				}
			}else message = "error:접근 오류:비정상적인 접근 경로입니다.(get으로 접근)";
		}else result = true;
		
		if(!result) res.sendRedirect("/?"+ message);
		
		return result;
	}

	/*
	 * @Override public void postHandle( HttpServletRequest req, HttpServletResponse
	 * res, Object handler, ModelAndView mav)throws Exception { // Before View
	 * Rendering log.info(">>> postHandle <<< "); }
	 * 
	 * @Override public void afterCompletion(HttpServletRequest req,
	 * HttpServletResponse res, Object handler, Exception ex)throws Exception { //
	 * After View Rendering log.info(">>> afterComplection <<<"); }
	 */
	
	/* Spring Framework 6.0 지원 현재 Spring Boot 에서 지원 >> postHandle, afterCompletion 실행 과정 없음
	public void afterConcurrentHandlingStarted(HttpServletRequest req, HttpServletResponse res, 
			Object handler, Exception ex) {
	}*/
}