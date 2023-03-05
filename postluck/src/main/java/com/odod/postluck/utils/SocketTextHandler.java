package com.odod.postluck.utils;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketTextHandler extends TextWebSocketHandler {
	private final Set<WebSocketSession> sessions = ConcurrentHashMap.newKeySet();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished"+ session);
		sessions.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage:" +session + " : " + message);
		String payload = message.getPayload();
		/*
		 * JSONObject jsonObject = new JSONObject(payload);
		 */		for(WebSocketSession s : sessions) {
			/*
			 * s.sendMessage(new TextMessage(payload + "Hi" + jsonObject.get("user") +
			 * "! How may I help you?"));
			 */
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionEstablished"+ session + ":" + status);
		sessions.remove(session);
	}
}
