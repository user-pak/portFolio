package com.mycompany.portfolio.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.portfolio.member.model.vo.Rent;
import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.book.model.vo.Book;
import com.mycompany.portfolio.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectLoginMember(Member mem) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberMapper.selectLoginMember", mem);
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Rent> historyRentList(String id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("MemberMapper.historyRentList", id);
	}

	public int insertRentBook(Rent rent) {
		// TODO Auto-generated method stub
		return sqlSession.insert("MemberMapper.insertRentBook", rent);
	}
	public int register(Member mem) {
		// TODO Auto-generated method stub
		return sqlSession.insert("MemberMapper.register", mem);
	}
	public int insertWishBook(Book book) {
		// TODO Auto-generated method stub
		return sqlSession.insert("MemberMapper.insertWishBook", book);
	}
	public int deleteMember(Member mem) {
		// TODO Auto-generated method stub
		return sqlSession.update("MemberMapper.deleteMember", mem);
	}
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("MemberMapper.updateMember", member);
	}
	public int checkDuplId(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberMapper.checkDuplId", id);
	}
	public int changePassword(Member mem) {
		// TODO Auto-generated method stub
		return sqlSession.update("MemberMapper.changePassword", mem);
	}
	public int getDueCount(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberMapper.getDueCount",id);
	}
	public int updateRentBook(Rent rent) {
		// TODO Auto-generated method stub
		return sqlSession.update("MemberMapper.updateRentBook", rent);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Reply> getReplyRefList(String id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("MemberMapper.getReplyRefList", id);
	}
}
