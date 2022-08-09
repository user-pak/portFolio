package com.mycompany.portfolio.home.controller;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.GsonBuilder;
import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.home.model.service.HomeService;
import com.mycompany.portfolio.home.model.vo.Notice;
import com.mycompany.portfolio.member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private HomeService service;
	@RequestMapping(value = {"/","home.do"})
	public String home(Locale locale, Model model, @RequestParam(required=false)String msg) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("newMemberCount", service.getNewMemberCount());
		model.addAttribute("newWishBookCount", service.getNewWishBookCount());
		model.addAttribute("topList", service.getBorrowTopList());
		model.addAttribute("bookTitleImg", service.getBookTitleImg());
		model.addAttribute("recentNotices", service.getRecentNotices());
		model.addAttribute("topBoardTitle", service.getTopBoardTitle());
		model.addAttribute("msg", msg);
		
		return "home";
	}
	@RequestMapping("board.do")
	public String board() {
		return "redirect: home.do";
	}
	@RequestMapping("selectNoticeList.do")
	public String selectNotice(Model model) {
		model.addAttribute("selectNoticeList", new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(service.selectNoticeList()));	
		return "home/selectNoticeList";
	}
	@RequestMapping("selectNoticeDetail.do")
	public String selectNoticeDetail(String noticeNo, Model model) {
		model.addAttribute("notice", service.selectNoticeDetail(noticeNo));
		return "home/selectNoticeDetail";
	}
	@RequestMapping("updateNotice.do")
	public String updateNotice(Notice notice, Model model) {
		int result = service.updateNotice(notice);
		if(result>0) {
			model.addAttribute("msg", "공지사항이 업데이트되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "공지사항 업데이트중 에러가 발생했습니다 다시시도해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(String noticeNo, Model model) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "공지사항이 삭제되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg","공지사항이 삭제되지 않았습니다 다시 시도해주세요");
			return "common/error";
		}
	}
	@RequestMapping("insertNoticeJsp.do")
	public String insertNoticeJsp() {
		return "home/insertNotice";
	}
	@RequestMapping("insertNotice.do")
	public String insertNotice(Notice notice, Model model) {
		int result = service.insertNotice(notice);
		if(result>0) {
			model.addAttribute("msg", "공지사항을 새롭게 작성했습니다");
			return "redirect: home.do";
		}
		else {
		model.addAttribute("msg","공지사항 작성중 에러가 발생했습니다 다시 작성해 주세요");
		return "common/error";
		}
	}
	
}
