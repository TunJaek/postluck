//package com.odod.postluck.utils;
//
//import java.util.Map;
//import java.util.concurrent.ConcurrentHashMap;
//
//import org.springframework.web.socket.CloseStatus;
//import org.springframework.web.socket.WebSocketHandler;
//import org.springframework.web.socket.WebSocketMessage;
//import org.springframework.web.socket.WebSocketSession;
//
//public class MyWebSocketHandler implements WebSocketHandler {
//
//	private final Map<WebSocketSession,String> sessionMap = new ConcurrentHashMap<>();
//
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		String storeCode = getStoreCode(session);
//		sessionMap.put( session, session.getStoreCode());
//	}
//
//
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		String storeCode = getStoreCode(session);
//		String userId = getUserId(session);
//		String key = storeCode + "/" + userId;
//		handlerMap.remove(key);
//		sessionMap.remove(session.getId());
//	}
//
//	@Override
//	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
//	}
//
//	@Override
//	public boolean supportsPartialMessages() {
//		return true;
//	}
//
//	private String getStoreCode(WebSocketSession session) {
//		return (String) session.getAttributes().get("storeCode");
//	}
//
//	private String getUserId(WebSocketSession session) {
//		return (String) session.getAttributes().get("userId");
//	}
//
//}
////	private static final Map<WebSocketSession, String> sessionIdToStoreCodeMap = new ConcurrentHashMap<>();
////	private static final String SESSION_EXPIRATION_TIME_KEY = "session_expiration_time";
////
////	@Override
////	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
////	    // 세션의 유효 시간 설정
////	    System.out.println("afterConnectionEstablished");
////	    session.getAttributes().put(SESSION_EXPIRATION_TIME_KEY, System.currentTimeMillis() + (12 *60 * 60 * 1000)); // 30분
////	    session.sendMessage(new TextMessage("서버와 연결되었습니다."));
////	    String storeCode = extractStoreCodeFromUri(session.getUri());
////	    sessionIdToStoreCodeMap.put(session, storeCode);
////	    System.out.println(storeCode + ":" + session);
////
////	    for (WebSocketSession ws : sessionIdToStoreCodeMap.keySet()) { // 세션아이디
////	        String stCode = sessionIdToStoreCodeMap.get(ws);
////	        if (stCode.equals(storeCode)) {
////	            ws.sendMessage(new TextMessage("storeCode : " + storeCode + "연결되었습니다."));
////	        }
////	    }
////	}
////
////	@Override
////	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
////		String payload = (String) message.getPayload();
////		System.out.println("WebSocket message received: " + payload);
////		for (WebSocketSession ws : sessionIdToStoreCodeMap.keySet()) { // 세션아이디
////	        String stCode = sessionIdToStoreCodeMap.get(ws);
////	        if (stCode.equals(sessionIdToStoreCodeMap.get(session))) {
////	            ws.sendMessage(new TextMessage(payload));
////	        }
////	    }
////	}
////
////	@Override
////	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
////		System.out.println("WebSocket transport error: " + exception.getMessage());
////		session.close(CloseStatus.SERVER_ERROR);
////	}
////
////	@Override
////	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
////	    System.out.println("WebSocket disconnected: " + session.getId());
////	    sessionIdToStoreCodeMap.remove(session);
////	}
////
////	private String extractStoreCodeFromUri(URI uri) {
////		String query = uri.getQuery();
////		String[] queryParamPairs = query.split("&");
////		for (String queryParamPair : queryParamPairs) {
////			String[] keyValue = queryParamPair.split("=");
////			if (keyValue[0].equals("storeCode")) {
////				return keyValue[1];
////			}
////		}
////		return null;
////	}
////
////	@Override
////	public boolean supportsPartialMessages() {
////		return false;
////	}
