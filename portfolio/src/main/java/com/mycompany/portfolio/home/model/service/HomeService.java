package com.mycompany.portfolio.home.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.mycompany.portfolio.board.model.vo.Board;
import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.home.model.vo.Notice;

public interface HomeService {

	public abstract int getNewMemberCount();

	public abstract int getNewWishBookCount();

	public abstract String getBookTitleImg();

	public abstract ArrayList<Map<String,Integer>> getBorrowTopList();

	public abstract ArrayList<Notice> selectNoticeList();

	public abstract Notice selectNoticeDetail(String noticeNo);

	public abstract int updateNotice(Notice notice);

	public abstract int deleteNotice(String noticeNo);

	public abstract int insertNotice(Notice notice);

	public abstract ArrayList<Notice> getRecentNotices();

	public abstract String getTopBoardTitle();

}
