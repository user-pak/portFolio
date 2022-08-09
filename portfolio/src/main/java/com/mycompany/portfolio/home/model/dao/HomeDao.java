package com.mycompany.portfolio.home.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.portfolio.board.model.vo.Board;
import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.home.model.vo.Notice;

@Repository
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getNewMemberCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("HomeMapper.getNewMemberCount");
	}

	public int getNewWishBookCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("HomeMapper.getNewWishBookCount");
	}

	public String getBookTitleImg() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("HomeMapper.getBookTitleImg");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Map<String, Integer>> getBorrowTopList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("HomeMapper.getBorrowTopList");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Notice> selectNoticeList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("HomeMapper.selectNoticeList");
	}

	public Notice selectNoticeDetail(String noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("HomeMapper.selectNoticeDetail", noticeNo);
	}

	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.update("HomeMapper.updateNotice", notice);
	}

	public int deleteNotice(String noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("HomeMapper.deleteNotice", noticeNo);
	}

	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("HomeMapper.insertNotice", notice);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Notice> getRecentNotices() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("HomeMapper.getRecentNotices");
	}

	public String getTopBoardTitle() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("HomeMapper.getTopBoardTitle");
	}

	
	
}
