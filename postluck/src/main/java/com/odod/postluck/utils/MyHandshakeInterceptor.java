//package com.odod.postluck.utils;
//
//import java.net.URI;
//import java.util.Map;
//
//import org.springframework.http.server.ServerHttpRequest;
//import org.springframework.http.server.ServerHttpResponse;
//import org.springframework.web.socket.WebSocketHandler;
//import org.springframework.web.socket.server.HandshakeInterceptor;
//
//private class MyHandshakeInterceptor implements HandshakeInterceptor {
//
//	@Override
//	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
//			Map<String, Object> attributes) throws Exception {
//		String storeCode = extractStoreCode(request.getURI().getPath());
//		if (storeCode == null ) {
//			return false;
//		}
//		attributes.put("storeCode", storeCode);
//		return true;
//	}
//
//	private String extractStoreCode(URI uri) {
//		String query = uri.getQuery();
//		String[] queryParamPairs = query.split("&");
//		for (String queryParamPair : queryParamPairs) {
//			String[] keyValue = queryParamPair.split("=");
//			if (keyValue[0].equals("storeCode")) {
//				return keyValue[1];
//			}
//		}
//		return null;
//	}
//
//	// ...
//
//}