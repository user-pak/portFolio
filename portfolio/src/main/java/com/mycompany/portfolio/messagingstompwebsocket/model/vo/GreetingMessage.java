package com.mycompany.portfolio.messagingstompwebsocket.model.vo;

public class GreetingMessage {

	private String clientMessage;
	private String serverMessage;
	
	public GreetingMessage() {
		
	}

	public GreetingMessage(String clientMessage, String serverMessage) {
		super();
		this.clientMessage = "client: " + clientMessage;
		this.serverMessage = "server: " + serverMessage;

	}

	public GreetingMessage(String clientMessage) {
		// TODO Auto-generated constructor stub
		super();
		this.clientMessage = clientMessage;
	}

	public String getClientMessage() {
		return clientMessage;
	}

	public void setClientMessage(String clientMessage) {
		this.clientMessage = clientMessage;
	}

	public String getServerMessage() {
		return serverMessage;
	}

	public void setServerMessage(String serverMessage) {
		this.serverMessage = serverMessage;
	}



	
	
}
