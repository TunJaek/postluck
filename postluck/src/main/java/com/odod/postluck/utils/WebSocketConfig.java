package com.odod.postluck.utils;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{
    
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(new MyWebSocketHandler(), "/my-websocket").setAllowedOrigins("*");

    }
    
}

/*
 * import org.springframework.context.annotation.Configuration; import
 * org.springframework.messaging.simp.config.MessageBrokerRegistry; import
 * org.springframework.web.socket.config.annotation.
 * EnableWebSocketMessageBroker; import
 * org.springframework.web.socket.config.annotation.StompEndpointRegistry;
 * import org.springframework.web.socket.config.annotation.
 * WebSocketMessageBrokerConfigurer;
 * 
 * @Configuration
 * 
 * @EnableWebSocketMessageBroker public class WebSocketConfig implements
 * WebSocketMessageBrokerConfigurer {
 * 
 * @Override public void configureMessageBroker(MessageBrokerRegistry registry)
 * { registry.enableSimpleBroker("/topic");
 * registry.setApplicationDestinationPrefixes("/app"); }
 * 
 * 
 * public void registerStompEndpoints(StompEndpointRegistry registry) {
 * //String[] origins = {"https://www.url1.com", "https://m.url2.com",
 * "https://url3.com"};
 * registry.addEndpoint("/hello").setAllowedOrigins("*").withSockJS();
 * 
 * }
 * 
 * }
 */