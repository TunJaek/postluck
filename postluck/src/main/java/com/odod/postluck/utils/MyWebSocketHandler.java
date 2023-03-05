package com.odod.postluck.utils;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

public class MyWebSocketHandler implements WebSocketHandler {

    private static final String SESSION_EXPIRATION_TIME_KEY = "session_expiration_time";

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 세션의 유효 시간 설정
    	System.out.println("afterConnectionEstablished");
        session.getAttributes().put(SESSION_EXPIRATION_TIME_KEY, System.currentTimeMillis() + (30 * 60 * 1000)); // 30분
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String payload = (String) message.getPayload();
        System.out.println("WebSocket message received: " + payload);
        session.sendMessage(new TextMessage("Hello, " + payload + "!"));
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.out.println("WebSocket transport error: " + exception.getMessage());
        session.close(CloseStatus.SERVER_ERROR);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        System.out.println("WebSocket disconnected: " + session.getId());
        session.getAttributes().remove(closeStatus);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }
}
