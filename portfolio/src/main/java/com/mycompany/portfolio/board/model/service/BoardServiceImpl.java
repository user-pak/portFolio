package com.mycompany.portfolio.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.portfolio.board.model.dao.BoardDao;
import com.mycompany.portfolio.board.model.vo.Board;
import com.mycompany.portfolio.board.model.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;

	@Override
	public ArrayList<Board> selectBoardList() {
		// TODO Auto-generated method stub
		return dao.selectBoardList();
	}

	@Override
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return dao.insertBoard(board);
	}

	@Override
	public Board selectBoardDetail(String boardNo) {
		// TODO Auto-generated method stub
		return dao.selectBoardDetail(boardNo);
	}

	@Override
	public int plusBoardCount(int boardNo) {
		// TODO Auto-generated method stub
		return dao.plusBoardCount(boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return dao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(boardNo);
	}

	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return dao.insertReply(reply);
	}

	@Override
	public ArrayList<Reply> getReplyList(int refBno) {
		// TODO Auto-generated method stub
		return dao.getReplyList(refBno);
	}

	@Override
	public int deleteReplyAjax(String replyNo) {
		// TODO Auto-generated method stub
		return dao.deleteReplyAjax(replyNo);
	}

	@Override
	public int updateReplyCheck(int[] replyNoArray) {
		// TODO Auto-generated method stub
		return dao.updateReplyCheck(replyNoArray);
	}


}
