package com.mycompany.portfolio.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.portfolio.board.model.vo.Board;
import com.mycompany.portfolio.board.model.vo.Reply;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("BoardMapper.insertBoard", board);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Board> selectBoardList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("BoardMapper.selectBoardList");
	}
	public int plusBoardCount(int boardNo) {
		return sqlSession.update("BoardMapper.plusBoardCount", boardNo);
	}

	public Board selectBoardDetail(String boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BoardMapper.selectBoardDetail", boardNo);
	}

	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.update("BoardMapper.updateBoard", board);
	}
	
	public int deleteBoard(int boardNo) {
		return sqlSession.update("BoardMapper.deleteBoard", boardNo);
	}

	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("BoardMapper.insertReply", reply);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Reply> getReplyList(int refBno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("BoardMapper.getReplyList", refBno);
	}

	public int deleteReplyAjax(String replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("BoardMapper.deleteReplyAjax", replyNo);
	}

	public int updateReplyCheck(int[] replyNoArray) {
		// TODO Auto-generated method stub
		return sqlSession.update("BoardMapper.updateReplyCheck", replyNoArray);
	}
}
