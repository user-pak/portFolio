package com.mycompany.portfolio.book.model.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.mycompany.portfolio.book.model.dao.BookDao;
import com.mycompany.portfolio.book.model.vo.Book;
import com.mycompany.portfolio.book.model.vo.Category;
import com.mycompany.portfolio.book.model.vo.Publisher;
import com.mycompany.portfolio.book.model.vo.Search;

@Component
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDao dao;

	@Override
	public ArrayList<Publisher> selectPubList() {
		// TODO Auto-generated method stub
		return dao.selectPubList();
	}

	@Override
	public int insertPub(Publisher pub) {
		// TODO Auto-generated method stub
		return dao.insertPub(pub);
	}

	@Override
	public int insertBook(Book book) {
		// TODO Auto-generated method stub
		return dao.insertBook(book);
	}

	@Override
	public ArrayList<Book> selectBookList() {
		// TODO Auto-generated method stub
		return dao.selectBookList();
	}

	@Override
	public ArrayList<Category> selectCat() {
		// TODO Auto-generated method stub
		return dao.selectCat();
	}

	@Override
	public Book selectBookDetail(String bookNo) {
		// TODO Auto-generated method stub
		return dao.selectBookDetail(bookNo);
	}

	@Override
	public Publisher selectPub(String pubNo) {
		// TODO Auto-generated method stub
		return dao.selectPub(pubNo);
	}

	@Override
	public int updatePub(Publisher publisher) {
		// TODO Auto-generated method stub
		return dao.updatePub(publisher);
	}

	@Override
	public int deletePub(int pubNo) {
		// TODO Auto-generated method stub
		return dao.deletePub(pubNo);
	}

	@Override
	public int updateBook(Book book) {
		// TODO Auto-generated method stub
		return dao.updateBook(book);
	}

	@Override
	public ArrayList<Book> searchBookList(Search search) {
		// TODO Auto-generated method stub
		return dao.searchBookList(search);
	}

	@Override
	public int deleteBook(String bookNo) {
		// TODO Auto-generated method stub
		return dao.deleteBook(bookNo);
	}

	@Override
	public ArrayList<Book> selectWishBookList() {
		// TODO Auto-generated method stub
		return dao.selectWishBookList();
	}

	@Override
	public ArrayList<Publisher> ajaxSelectPubList() {
		// TODO Auto-generated method stub
		return dao.ajaxSelectPubList();
	}

	@Override
	public int insertMainCatetories(ArrayList<Category> mainInputs) {
		// TODO Auto-generated method stub
		return dao.insertMainCatetories(mainInputs);
	}

	@Override
	public int insertSubCategories(ArrayList<Category> subInputs) {
		// TODO Auto-generated method stub
		return dao.insertSubCategories(subInputs);
	}

	@Override
	public int updateMainCategories(ArrayList<Category> updateMainList) {
		// TODO Auto-generated method stub
		return dao.updateMainCategories(updateMainList);
	}

	@Override
	public int updateSubCategories(ArrayList<Category> updateSubList) {
		// TODO Auto-generated method stub
		return dao.updateSubCategories(updateSubList);
	}

	@Override
	public int delMainCategories(String[] delMainArray) {
		// TODO Auto-generated method stub
		return dao.delMainCategories(delMainArray);
	}

	@Override
	public int delSubCategories(String[] delSubArray) {
		// TODO Auto-generated method stub
		return dao.delSubCategories(delSubArray);
	}


}
