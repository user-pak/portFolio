package com.mycompany.portfolio.board.model.vo;

public class Reply {

	private int replyNo;
	private int refBno;
	private String replyAuthor;
	private String replyContent;
	private String replyCreateDate;
	private String replyStatus;
	
	public Reply() {}

	public Reply(int replyNo, int refBno, String replyAuthor, String replyContent, String replyCreateDate,
			String replyStatus) {
		super();
		this.replyNo = replyNo;
		this.refBno = refBno;
		this.replyAuthor = replyAuthor;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyStatus = replyStatus;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getReplyAuthor() {
		return replyAuthor;
	}

	public void setReplyAuthor(String replyAuthor) {
		this.replyAuthor = replyAuthor;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(String replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", refBno=" + refBno + ", replyAuthor=" + replyAuthor + ", replyContent="
				+ replyContent + ", replyCreateDate=" + replyCreateDate + ", replyStatus=" + replyStatus + "]";
	}
	
	
}
