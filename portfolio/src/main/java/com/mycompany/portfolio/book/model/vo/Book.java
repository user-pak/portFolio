package com.mycompany.portfolio.book.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class Book {

	private int bookNo;
	private String bookTitle;
	private String author;
	private int price;
	private String publisherNo;
	private String ISBN;
	private int page;
	private String mainCategory;
	private String subCategory;
	private String issueDate;
	private String rentYn;
	private int stock;
	private String originalFilename;
	private String renameFilename;
	
	public Book() {}

	public Book(int bookNo, String bookTitle, String author, int price, String publisherNo, String ISBN, int page,
			String mainCategory, String subCategory, String issueDate, String rentYn, int stock) {
		super();
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.author = author;
		this.price = price;
		this.publisherNo = publisherNo;
		this.ISBN = ISBN;
		this.page = page;
		this.mainCategory = mainCategory;
		this.subCategory = subCategory;
		this.issueDate = issueDate;
		this.rentYn = rentYn;
		this.stock = stock;
	}

	public Book(int bookNo, String bookTitle, String author, int price, String publisherNo, String ISBN, int page,
			String mainCategory, String subCategory, String issueDate, String rentYn, int stock, String originalFilename,
			String renameFilename) {
		super();
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.author = author;
		this.price = price;
		this.publisherNo = publisherNo;
		this.ISBN = ISBN;
		this.page = page;
		this.mainCategory = mainCategory;
		this.subCategory = subCategory;
		this.issueDate = issueDate;
		this.rentYn = rentYn;
		this.stock = stock;
		this.originalFilename = originalFilename;
		this.renameFilename = renameFilename;
	}

	public int getBookNo() {
		return bookNo;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public String getAuthor() {
		return author;
	}

	public int getPrice() {
		return price;
	}

	public String getPublisherNo() {
		return publisherNo;
	}

	public String getISBN() {
		return ISBN;
	}

	public int getPage() {
		return page;
	}

	public String getMainCategory() {
		return mainCategory;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public String getRentYn() {
		return rentYn;
	}

	public int getStock() {
		return stock;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setPublisherNo(String publisherNo) {
		this.publisherNo = publisherNo;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public void setRentYn(String rentYn) {
		this.rentYn = rentYn;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	
	public String getOriginalFilename() {
		return originalFilename;
	}

	public String getRenameFilename() {
		return renameFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public void setRenameFilename(String renameFilename) {
		this.renameFilename = renameFilename;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookTitle=" + bookTitle + ", author=" + author + ", price=" + price
				+ ", publisherNo=" + publisherNo + ", ISBN=" + ISBN + ", page=" + page + ", mainCategory="
				+ mainCategory + ", subCategory=" + subCategory + ", issueDate=" + issueDate + ", rentYn=" + rentYn
				+ ", stock=" + stock + ", originalFilename=" + originalFilename + ", renameFilename=" + renameFilename
				+ "]";
	}
	
}
