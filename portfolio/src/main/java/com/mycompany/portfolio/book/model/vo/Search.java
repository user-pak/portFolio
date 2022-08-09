package com.mycompany.portfolio.book.model.vo;

public class Search {

	private String condition;
	private String content;
	
	public Search() {}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Search [condition=" + condition + ", content=" + content + "]";
	}
	
	
	
	
}
