package com.mycompany.portfolio.messagingstompwebsocket.controller;


import org.springframework.web.util.HtmlUtils;
import com.mycompany.portfolio.messagingstompwebsocket.model.service.GreetingService;

import com.mycompany.portfolio.messagingstompwebsocket.model.vo.GreetingMessage;
import com.mycompany.portfolio.messagingstompwebsocket.model.vo.HelloMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class GreetingController {
	
    private SimpMessagingTemplate template;

//    @Autowired
    public GreetingController(SimpMessagingTemplate template) {
        this.template = template;
    }
    
	@Autowired
	private GreetingService service;

    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public GreetingMessage greeting(HelloMessage clientMessasge) throws Exception {
      Thread.sleep(1000); // simulated delay
//	    return new Greeting("Hello, " + HtmlUtils.htmlEscape(chatMessage.getName()) + "!");
      return service.greeting(clientMessasge);
    }

}
