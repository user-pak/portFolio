package com.mycompany.portfolio.book.model.dao;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mycompany.portfolio.book.model.vo.Book;
import com.mycompany.portfolio.book.model.vo.Category;
import com.mycompany.portfolio.book.model.vo.Publisher;
import com.mycompany.portfolio.book.model.vo.Search;

@Repository
public class BookDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Publisher> selectPubList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("BookMapper.selectPubList");
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Publisher> ajaxSelectPubList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("BookMapper.ajaxSelectPubList");
	}

	public int insertPub(Publisher pub) {
		// TODO Auto-generated method stub
		return sqlSession.insert("BookMapper.insertPub", pub);
	}

	public int insertBook(Book book) {
		// TODO Auto-generated method stub
		return sqlSession.insert("BookMapper.insertBook", book);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Book> selectBookList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("BookMapper.selectBookList");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Category> selectCat() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("BookMapper.selectCat");	
	}

	public Book selectBookDetail(String bookNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BookMapper.selectBookDetail", bookNo);
	}

	public Publisher selectPub(String pubNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BookMapper.selectPub", pubNo);
	}

	public int updatePub(Publisher publisher) {
		// TODO Auto-generated method stub
		return sqlSession.update("BookMapper.updatePub", publisher);
	}

	public int deletePub(int pubNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("BookMapper.deletePub", pubNo);
	}

	public int updateBook(Book book) {
		// TODO Auto-generated method stub
		return sqlSession.update("BookMapper.updateBook", book);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Book> searchBookList(Search search) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("BookMapper.searchBookList", search);
	}

	public int deleteBook(String bookNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("BookMapper.deleteBook", bookNo);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Book> selectWishBookList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("BookMapper.selectWishBookList");
	}


}
