package com.odod.postluck.utils;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.odod.postluck.beans.JWTBean;
import com.odod.postluck.beans.StoreBean;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ProjectUtils {
	
	/* RequestContetHolder Class --> Spring 3.0 이상
	 *  : ThreadLocal를 사용해서 현재 쓰레드에 RequestAttributes 인스턴스를 바인딩 해두었다가 요청을 하면 이 인스턴스를 돌려주는 역할을 합니다.
	 *  : ThreadLocal을 사용하는 경우 ThreadLocal 변수에 보관된 데이터의 사용이 끝나면 반드시 삭제 해야 재사용되는 쓰레드의 잘못된 참조를 방지
	 *    그렇지 않으면, 재사용되는 쓰레드가 올바르지 않은 데이터를 참조할 수 있다.
	 *    
	 * org.springframework.mobile   spring-mobile-device
	 */
	@Autowired
	private JsonWebTokenService jwts;
	
	public int screenType(int serviceCode){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return serviceCode * (isMobile(request)? -1 : 1);
	}
		
	private boolean isMobile(HttpServletRequest request){
		return DeviceUtils.getCurrentDevice(request).isMobile();
	}
	
	public JWTBean convertToBean(String token, StoreBean... store) {
		JWTBean tokenInfo = null;
		Object obj = null;
		ObjectMapper objMap;
		try {
			if((obj = this.getAttribute("AccessInfo")) != null) {
				Map<String, Object> tokenInfoMap =  this.jwts.getTokenInfo(token, ((StoreBean)obj).getSnsID());
				objMap = new ObjectMapper();
				tokenInfo = objMap.convertValue(tokenInfoMap.get("TokenBody"), JWTBean.class);
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return tokenInfo;
	}
	/* JWT 정보와 Session정보 일치 여부 리턴 추가 */
	public boolean isMatchSession(String token) {
		boolean isMatch = false;
		Object obj = null;
		try {
			if((obj = this.getAttribute("AccessInfo")) != null) {
				StoreBean accessInfo = ((StoreBean)obj);
				JWTBean tokenInfo = this.convertToBean(token);
				if(accessInfo.getStoreCode().equals(tokenInfo.getStoreCode())) {
					isMatch = true;
				} 
			}
		} catch (Exception e) {e.printStackTrace();}
		return isMatch;
	}
	
	/* Response Header 추가 */
	public void transferJWTByResponse(String jwt) {
		System.out.println("sessionStorage에"+jwt+"저장");
		((ServletRequestAttributes)RequestContextHolder
				.getRequestAttributes())
				.getResponse().setHeader("JWTForPostluck", jwt);
	}
		
	/* Session영역으로부터 attribute 값을 가져 오기 위한 method  */
    public Object getAttribute(String name) throws Exception {
        return (Object) RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
    }
 
    /* Session영역에 attribute 설정 method */
    public void setAttribute(String name, Object object) throws Exception {
    	System.out.println("setAttribute"+name+object);
        RequestContextHolder.getRequestAttributes().setAttribute(name, object, RequestAttributes.SCOPE_SESSION);
    }
 
    /* Session영역에 설정된 attribute 삭제 */
    public void removeAttribute(String name) throws Exception {
        RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
    }
 
    /* Session영역의 SessionId값을 가져오기 위한 Method */
    public String getSessionId() throws Exception  {
        return RequestContextHolder.getRequestAttributes().getSessionId();
    }
    
    /* Client IP */
	public String getHeaderInfo(boolean flag) {
		HttpServletRequest req = 
				((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		return (flag)? req.getRemoteAddr() : req.getHeader("user-agent");
	}
	
    /* Client BrowserInfo */
    public String getBrowserInfo(String header) {
		String browser = null;
		String version = null;
		
		if(header.toLowerCase().indexOf("windows") != -1) {
			if(header.toLowerCase().indexOf("firefox") != -1) {
				browser = "W-FIREFOX";
				version = header.toLowerCase().split("firefox/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("opera") != -1 || header.toLowerCase().indexOf("opr") != -1) {
				browser = "W-OPERA";
				if(header.toLowerCase().indexOf("opera") != 1) version = header.toLowerCase().split("opera/")[1].split(" ")[0];
				else version = header.toLowerCase().split("opr/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("whale") != -1) {
				browser = "W-WHALE";
				version = header.toLowerCase().split("whale/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("naver") != -1) {
				browser = "W-NAVER";
				version = "inapp";
			}else if(header.toLowerCase().indexOf("trident") != -1) {
				browser = "W-IE";
				version = header.toLowerCase().split("rv:")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("edge") != -1 || header.toLowerCase().indexOf("edg") != -1) {
				browser = "W-EDGE";
				if(header.toLowerCase().indexOf("edge") != -1) version = header.toLowerCase().split("edge/")[1].split("\\.")[0];
				else version = header.toLowerCase().split("edg/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("chrome") != -1) {
				browser = "W-CHROME";
				version = header.toLowerCase().split("chrome/")[1].split("\\.")[0];
			}
		}else {
			if(header.toLowerCase().indexOf("fxios") != -1) {
				browser = "M-FIREFOX";
				version = header.toLowerCase().split("fxios/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("opt") != -1 || header.toLowerCase().indexOf("opr") != -1) {
				browser = "M-OPERA";
				version = header.toLowerCase().split("opt/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("whale") != -1) {
				browser = "M-WHALE";
				version = header.toLowerCase().split("whale/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("naver") != -1) {
				browser = "M-NAVER";
				version = "inapp";
			}else if(header.toLowerCase().indexOf("edge") != -1 || header.toLowerCase().indexOf("edg") != -1) {
				browser = "M-EDGE";
				if(header.toLowerCase().indexOf("edge") != -1) version = header.toLowerCase().split("edge/")[1].split("\\.")[0];
				else version = header.toLowerCase().split("edg/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("crios") != -1) {
				browser = "M-CHROME";
				version = header.toLowerCase().split("crios/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("duckduckgo") != -1) {
				browser = "M-DUCKDUCKGO";
				version = header.toLowerCase().split("duckduckgo/")[1].split(" ")[0];
			}else if(header.toLowerCase().indexOf("safari") != -1) {
				browser = "M-SAFARI";
				version = header.toLowerCase().split("safari/")[1].split("\\.")[0];
			}
		}
		
		return browser+"(v."+ version + ")";
	}
}
