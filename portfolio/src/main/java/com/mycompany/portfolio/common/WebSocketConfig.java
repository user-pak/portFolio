package com.mycompany.portfolio.common;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

  @Override
  public void configureMessageBroker(MessageBrokerRegistry config) {
    config.enableSimpleBroker("/topic/", "/queue/");
    config.setApplicationDestinationPrefixes("/app");
  }

  @Override
  public void registerStompEndpoints(StompEndpointRegistry registry) {
    registry.addEndpoint("/gs-guide-websocket")
    .setHandshakeHandler(new DefaultHandshakeHandler() {

        @SuppressWarnings({ "unused", "unchecked", "rawtypes" })
		public boolean beforeHandshake(
          ServerHttpRequest request, 
          ServerHttpResponse response, 
          WebSocketHandler wsHandler,	
          Map attributes) throws Exception {
   
              if (request instanceof ServletServerHttpRequest) {
                  ServletServerHttpRequest servletRequest
                   = (ServletServerHttpRequest) request;
                  HttpSession session = servletRequest
                    .getServletRequest().getSession();
                  attributes.put("sessionId", session.getId());
              }
                  return true;
          }})
    .addInterceptors(new HttpSessionHandshakeInterceptor()).withSockJS();
  }
}
