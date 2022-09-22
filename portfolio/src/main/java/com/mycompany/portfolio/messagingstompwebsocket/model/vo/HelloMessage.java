package com.mycompany.portfolio.messagingstompwebsocket.model.vo;

public class HelloMessage {
	
	private String chatName;
	private String clientMessage;

	public HelloMessage() {}

	public HelloMessage(String chatName, String clientMessage) {
		super();
		this.chatName = chatName;
		this.clientMessage = clientMessage;
	}

	public String getChatName() {
		return chatName;
	}

	public void setChatName(String chatName) {
		this.chatName = chatName;
	}

	public String getClientMessage() {
		return clientMessage;
	}

	public void setClientMessage(String clientMessage) {
		this.clientMessage = clientMessage;
	}


	
	
	
}
