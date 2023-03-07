package com.odod.postluck.utils;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.HandshakeInterceptor;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	
	private final Map<String, Map<String, WebSocketSession>> sessionMap = new ConcurrentHashMap<>();

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new MyWebSocketHandler(sessionMap), "/postluck/{storeCode}").setAllowedOrigins("*")
				.addInterceptors(new MyHandshakeInterceptor());
	}

	private class MyWebSocketHandler implements WebSocketHandler {
		private Map<String, Map<String, WebSocketSession>> sessionMap;

		public MyWebSocketHandler(Map<String, Map<String, WebSocketSession>> sessionMap) {
			System.out.println("sessionMap is" + sessionMap);
			this.sessionMap = sessionMap;
		}

		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			String storeCode = extractStoreCodeAsUri(session.getUri());

			Map<String, WebSocketSession> sessions = sessionMap.getOrDefault(storeCode, new ConcurrentHashMap<>());
			sessions.put(session.getId(), session);
			sessionMap.put(storeCode, sessions);
		}

		@Override
		public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		}

		@Override
		public void handleMessage(WebSocketSession session, WebSocketMessage<?> wsMessage) throws Exception {
		    String storeCode = extractStoreCodeAsUri(session.getUri());
		    Map<String, WebSocketSession> sIdWithSession = sessionMap.get(storeCode);
		    String message= wsMessage.getPayload().toString();
		    System.out.println(message);
		    for (WebSocketSession s : sIdWithSession.values()) {
		        if (!s.equals(session)) {
		            s.sendMessage(new TextMessage(message));
		        }
		    }
		    System.out.println(storeCode);
		}

		private String extractStoreCodeAsUri(URI uri) {
			String[] pathSegments = uri.getPath().split("/");
			if (pathSegments.length > 2) {
				return pathSegments[2]; // ws-chat/{storeCode}에서 {storeCode} 추출
			}
			return null;
		}

		// ...
		@Override
		public boolean supportsPartialMessages() {
			return false;
		}

		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		    String storeCode = extractStoreCodeAsUri(session.getUri());
		    Map<String, WebSocketSession> sessions = sessionMap.get(storeCode);
		    sessions.remove(session.getId());
		}
	}

	private class MyHandshakeInterceptor implements HandshakeInterceptor {

		@Override
		public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
				WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
			if (request instanceof ServletServerHttpRequest) {
				ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
				String storeCode = extractStoreCode(servletRequest.getServletRequest().getRequestURI());
				if (storeCode != null) {
					attributes.put("storeCode", storeCode);
				}
			}
			return true;
		}

		@Override
		public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
				Exception exception) {
			// do nothing
		}

		private String extractStoreCode(String uri) {
			try {
				URI u = new URI(uri);
				String[] pathSegments = u.getPath().split("/");
				if (pathSegments.length > 2) {
					return pathSegments[2]; // ws-chat/{storeCode}에서 {storeCode} 추출
				}
			} catch (URISyntaxException e) {
				e.printStackTrace();
			}
			return null;
		}


	}

}