package com.mycompany.portfolio.messagingstompwebsocket.controller;


import com.google.gson.Gson;
import com.mycompany.portfolio.messagingstompwebsocket.model.service.GreetingService;

import com.mycompany.portfolio.messagingstompwebsocket.model.vo.GreetingMessage;
import com.mycompany.portfolio.messagingstompwebsocket.model.vo.HelloMessage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageExceptionHandler;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

@Controller
public class GreetingController {
	
//    private SimpMessagingTemplate template;
//    @Autowired
//    private SimpMessageSendingOperations messagingTemplate;

    private Gson gson = new Gson();
    
	@Autowired
	private GreetingService service;

	@MessageMapping("/knockknock")
	@SendToUser("/queue/questions")
    public GreetingMessage greeting(String clientMessage) throws Exception {
    	Thread.sleep(1000); // simulated delay
//	    return new Greeting("Hello, " + HtmlUtils.htmlEscape(chatMessage.getName()) + "!");   
    	return service.greeting(gson.fromJson(clientMessage, Map.class).get("clientMessage").toString());
    }
    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public HelloMessage echoMessageFromClient(HelloMessage chatMessage) throws Exception {
    	Thread.sleep(1000);
    	return chatMessage;
    }
    @MessageExceptionHandler
    @SendToUser("/queue/errors")
    public String handleException(Throwable exception) {
        return exception.getMessage();
    }

}
