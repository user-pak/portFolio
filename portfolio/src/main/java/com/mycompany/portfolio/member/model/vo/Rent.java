package com.mycompany.portfolio.member.model.vo;


import java.sql.Timestamp;



public class Rent {

	private int rentNo;
	private int refBno;
	private String bookName;
	private String refMemId;	

	private Timestamp rentDate;

	private Timestamp returnDate;
	private int returnCk;//-1연체0대출중1반납
	
	
	public Rent() {}


	public Rent(int refBno, String refMemId) {
		super();
		this.refBno = refBno;
		this.refMemId = refMemId;
	}


	public Rent(int rentNo, int refBno, String refMemId, Timestamp rentDate, Timestamp returnDate, int returnCk) {
		super();
		this.rentNo = rentNo;
		this.refBno = refBno;
		this.refMemId = refMemId;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
		this.returnCk = returnCk;
	}


	public Rent(String refBno, String refMemId) {
		// TODO Auto-generated constructor stub
		this.refBno = Integer.parseInt(refBno);
		this.refMemId = refMemId;
	}


	public int getRentNo() {
		return rentNo;
	}


	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}


	public int getRefBno() {
		return refBno;
	}


	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}


	public String getBookName() {
		return bookName;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getRefMemId() {
		return refMemId;
	}


	public void setRefMemId(String refMemId) {
		this.refMemId = refMemId;
	}


	public Timestamp getRentDate() {
		return rentDate;
	}


	public void setRentDate(Timestamp rentDate) {
		this.rentDate = rentDate;
	}


	public Timestamp getReturnDate() {
		return returnDate;
	}


	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}


	public int getReturnCk() {
		return returnCk;
	}


	public void setRentYn(int returnCk) {
		this.returnCk = returnCk;
	}


	@Override
	public String toString() {
		return "Rent [rentNo=" + rentNo + ", refBno=" + refBno + ", bookName=" + bookName + ", refMemId=" + refMemId
				+ ", rentDate=" + rentDate + ", returnDate=" + returnDate + ", returnCk=" + returnCk + "]";
	}
	
	

}