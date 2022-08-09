package com.mycompany.portfolio.member.model.service;

import java.util.ArrayList;

import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.book.model.vo.Book;
import com.mycompany.portfolio.member.model.vo.Member;
import com.mycompany.portfolio.member.model.vo.Rent;

public interface MemberService {

	ArrayList<Rent> historyRentList(String id);

	int insertRentBook(Rent rent);
	
	public abstract int register(Member mem);

	Member selectLoginMember(Member mem);

	int insertWishBook(Book book);

	int deleteMember(Member mem);

	int updateMember(Member member);

	int checkDuplId(String id);

	int changePassword(Member mem);

	int getDueCount(String id);

	int updateRentBook(Rent rent);

	ArrayList<Reply> getReplyRefList(String id);
}
