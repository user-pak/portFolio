package com.mycompany.portfolio.messagingstompwebsocket.model.service;

import com.mycompany.portfolio.messagingstompwebsocket.model.vo.GreetingMessage;
import com.mycompany.portfolio.messagingstompwebsocket.model.vo.HelloMessage;

public interface GreetingService {

	GreetingMessage greeting(String clientMessage);

}
