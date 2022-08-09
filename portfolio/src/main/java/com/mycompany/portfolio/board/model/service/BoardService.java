package com.mycompany.portfolio.board.model.service;

import java.util.ArrayList;


import com.mycompany.portfolio.board.model.vo.Board;
import com.mycompany.portfolio.board.model.vo.Reply;

public interface BoardService {

	ArrayList<Board> selectBoardList();

	int insertBoard(Board board);

	Board selectBoardDetail(String boardNo);
	
	int plusBoardCount(int boardNo);

	int updateBoard(Board board);
	
	int deleteBoard(int boardNo);

	int insertReply(Reply reply);

	ArrayList<Reply> getReplyList(int refBno);

	int deleteReplyAjax(String replyNo);

	int updateReplyCheck(int[] replyNoArray);

}
