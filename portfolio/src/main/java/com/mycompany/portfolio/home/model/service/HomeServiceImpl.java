package com.mycompany.portfolio.home.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.portfolio.board.model.vo.Board;
import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.home.model.dao.HomeDao;
import com.mycompany.portfolio.home.model.vo.Notice;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDao dao;
	@Override
	public int getNewMemberCount() {
		// TODO Auto-generated method stub
		return dao.getNewMemberCount();
	}
	@Override
	public int getNewWishBookCount() {
		// TODO Auto-generated method stub
		return dao.getNewWishBookCount();
	}
	@Override
	public String getBookTitleImg() {
		// TODO Auto-generated method stub
		return dao.getBookTitleImg();
	}
	@Override
	public ArrayList<Map<String, Integer>> getBorrowTopList() {
		// TODO Auto-generated method stub
		return dao.getBorrowTopList();
	}
	@Override
	public ArrayList<Notice> selectNoticeList() {
		// TODO Auto-generated method stub
		return dao.selectNoticeList();
	}
	@Override
	public Notice selectNoticeDetail(String noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectNoticeDetail(noticeNo);
	}
	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return dao.updateNotice(notice);
	}
	@Override
	public int deleteNotice(String noticeNo) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(noticeNo);
	}
	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return dao.insertNotice(notice);
	}
	@Override
	public ArrayList<Notice> getRecentNotices() {
		// TODO Auto-generated method stub
		return dao.getRecentNotices();
	}
	@Override
	public String getTopBoardTitle() {
		// TODO Auto-generated method stub
		return dao.getTopBoardTitle();
	}

	

}
