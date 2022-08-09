package com.mycompany.portfolio.book.model.vo;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class Publisher {

	private int pubNo;
	private String pubName;
	private String pubPhone;
	private String dealYn;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Timestamp createDate;
	
	public Publisher() {}

	public Publisher(int pubNo, String pubName, String pubPhone, String dealYn, Timestamp createDate) {
		super();
		this.pubNo = pubNo;
		this.pubName = pubName;
		this.pubPhone = pubPhone;
		this.dealYn = dealYn;
		this.createDate = createDate;
	}

	public int getPubNo() {
		return pubNo;
	}

	public String getPubName() {
		return pubName;
	}

	public String getPubPhone() {
		return pubPhone;
	}

	public String getDealYn() {
		return dealYn;
	}

	public void setPubNo(int pubNo) {
		this.pubNo = pubNo;
	}

	public void setPubName(String pubName) {
		this.pubName = pubName;
	}

	public void setPubPhone(String pubPhone) {
		this.pubPhone = pubPhone;
	}

	public void setDealYn(String dealYn) {
		this.dealYn = dealYn;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Publisher [pubNo=" + pubNo + ", pubName=" + pubName + ", pubPhone=" + pubPhone + ", dealYn=" + dealYn
				+ ", createDate=" + createDate + "]";
	}
	
	
}
