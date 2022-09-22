package com.mycompany.portfolio.messagingstompwebsocket.model.service;

import org.springframework.stereotype.Service;

import com.mycompany.portfolio.messagingstompwebsocket.model.vo.GreetingMessage;
import com.mycompany.portfolio.messagingstompwebsocket.model.vo.HelloMessage;


@Service
public class GreetingServiceImpl implements GreetingService{
	 
	class KnockKnockProtocol {
	 
	    private String[] clues = { "Turnip", "Little Old Lady", "Atch", "Who", "Who Who" };
	    private String[] answers = { "Turnip the heat, it's cold in here!",
	                                 "I didn't know you could yodel!",
	                                 "Bless you!",
	                                 "Is there an owl in here?",
	                                 "Is there an echo in here?" };
	 
	    String processInput(String theInput) {
	        String theOutput = "You're supposed to say " + "\"Turnip, Little Old Lady, Atch, Who, Who Who\"";
        	for(int i = 0; i <clues.length; i++) {
        		if(theInput.equalsIgnoreCase(clues[i])) {
        			theOutput = answers[i];
        			break;
        		}
        	}
	        return theOutput;
	    }
	}

	@Override
	public GreetingMessage greeting(String clientMessage) {
		// TODO Auto-generated method stub
		return new GreetingMessage(clientMessage, new KnockKnockProtocol().processInput(clientMessage));
	}

}
