package com.mycompany.portfolio.home.model.vo;

import java.sql.Timestamp;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeCategory;
	private String noticeStatus;
	private Timestamp createDate;
	private String content;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeCategory, String noticeStatus, Timestamp createDate, String content) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeCategory = noticeCategory;
		this.noticeStatus = noticeStatus;
		this.createDate = createDate;
		this.content = content;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeCategory() {
		return noticeCategory;
	}

	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeCategory=" + noticeCategory
				+ ", noticeStatus=" + noticeStatus + ", createDate=" + createDate + ", content=" + content + "]";
	}
	
	
}
