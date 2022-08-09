package com.mycompany.portfolio.board.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardAuthor;
	private String boardContent;
	private Timestamp createDate;
	private String boardStatus;
	private int boardCount;
	private ArrayList<Reply> replyList;
	
	public Board() {}

	public Board(int boardNo, String boardTitle, String boardAuthor, String boardContent, Timestamp createDate, String boardStatus,
			int boardCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardAuthor = boardAuthor;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.boardStatus = boardStatus;
		this.boardCount = boardCount;
	}

	
	public Board(int boardNo, String boardTitle, String boardAuthor, String boardContent, Timestamp createDate,
			String boardStatus, int boardCount, ArrayList<Reply> replyList) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardAuthor = boardAuthor;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.boardStatus = boardStatus;
		this.boardCount = boardCount;
		this.replyList = replyList;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardAuthor() {
		return boardAuthor;
	}

	public void setBoardAuthor(String boardAuthor) {
		this.boardAuthor = boardAuthor;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public ArrayList<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(ArrayList<Reply> replyList) {
		this.replyList = replyList;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardAuthor=" + boardAuthor
				+ ", boardContent=" + boardContent + ", createDate=" + createDate + ", boardStatus=" + boardStatus
				+ ", boardCount=" + boardCount + ", replyList=" + replyList + "]";
	}
	
	
}
