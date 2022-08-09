package com.mycompany.portfolio.book.model.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.mycompany.portfolio.book.model.vo.Book;
import com.mycompany.portfolio.book.model.vo.Publisher;
import com.mycompany.portfolio.book.model.vo.Search;

public interface BookService {

	ArrayList<Publisher> selectPubList();
	
	ArrayList<Publisher> ajaxSelectPubList();

	int insertPub(Publisher pub);

	int insertBook(Book book);

	ArrayList<Book> selectBookList();

	Object selectCat();

	Book selectBookDetail(String bookNo);

	Publisher selectPub(String pubNo);

	int updatePub(Publisher publisher);

	int deletePub(int pubNo);

	int updateBook(Book book);

	ArrayList<Book> searchBookList(Search search);

	int deleteBook(String bookNo);

	ArrayList<Book> selectWishBookList();



}
