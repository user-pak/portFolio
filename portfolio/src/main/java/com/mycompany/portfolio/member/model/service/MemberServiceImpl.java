package com.mycompany.portfolio.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mycompany.portfolio.member.model.vo.Member;
import com.mycompany.portfolio.member.model.vo.Rent;
import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.book.model.vo.Book;
import com.mycompany.portfolio.member.model.dao.MemberDao;

@Service@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao dao;
//	@Autowired
//	private DataSourceTransactionManager txManager;
//	@Autowired
//	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Rent> historyRentList(String id) {
		// TODO Auto-generated method stub
		return dao.historyRentList(id);
	}

	@Override
	public int insertRentBook(Rent rent) {
		// TODO Auto-generated method stub
		return dao.insertRentBook(rent);
	}
	@Override
	public int register(Member mem) {
		// TODO Auto-generated method stub
		return dao.register(mem);
	}

	@Override
	public Member selectLoginMember(Member mem) {
		// TODO Auto-generated method stub
		return dao.selectLoginMember(mem);
	}

	@Override
	public int insertWishBook(Book book) {
		// TODO Auto-generated method stub
		return dao.insertWishBook(book);
	}

	@Override
	public int deleteMember(Member mem) {
		// TODO Auto-generated method stub
		return dao.deleteMember(mem);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return dao.updateMember(member);
	}

	@Override
	public int checkDuplId(String id) {
		// TODO Auto-generated method stub
		return dao.checkDuplId(id);
	}

	@Override
	public int changePassword(Member mem) {
		// TODO Auto-generated method stub
		return dao.changePassword(mem);
	}

	@Override
	public int getDueCount(String id) {
		// TODO Auto-generated method stub
		return dao.getDueCount(id);
	}

	@Override
	public int updateRentBook(Rent rent) {
		// TODO Auto-generated method stub
//		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
//		// explicitly setting the transaction name is something that can only be done programmatically
//		//def.setName("SomeTxName");
//		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
//		TransactionStatus status = txManager.getTransaction(def);
//		try {
//			sqlSession.getConnection().setAutoCommit(false);
//			int result1 = dao.updateRentBook(rent);
//			if(result1>0) {
//				int result2 = dao.updateRentBookStatus(rent.getRefBno());
//				if(result2>0) {
//					txManager.commit(status);
//					return 1;
//				}
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			txManager.rollback(status);
//			e.printStackTrace();
//		}
//		return 0;
		return dao.updateRentBook(rent);
		
	}

	@Override
	public ArrayList<Reply> getReplyRefList(String id) {
		// TODO Auto-generated method stub
		return dao.getReplyRefList(id);
	}			
}
