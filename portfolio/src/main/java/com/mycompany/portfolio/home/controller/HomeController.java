package com.mycompany.portfolio.home.controller;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.swing.JApplet;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;

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
public class HomeController extends JApplet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5461916055592333093L;

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
		init();
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
			model.addAttribute("msg", "??????????????? ???????????????????????????");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "???????????? ??????????????? ????????? ?????????????????? ??????????????? ?????????");
			return "common/error";
		}
	}
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(String noticeNo, Model model) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "??????????????? ?????????????????????");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg","??????????????? ???????????? ??????????????? ?????? ??????????????????");
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
			model.addAttribute("msg", "??????????????? ????????? ??????????????????");
			return "redirect: home.do";
		}
		else {
		model.addAttribute("msg","???????????? ????????? ????????? ?????????????????? ?????? ????????? ?????????");
		return "common/error";
		}
	}
    //Called when this applet is loaded into the browser.
	@Override
    public void init() {
        //Execute a job on the event-dispatching thread; creating this applet's GUI.
        try {
            SwingUtilities.invokeAndWait(new Runnable() {
                public void run() {
                    JLabel lbl = new JLabel("Hello World");
                    add(lbl);
                }
            });
        } catch (Exception e) {
            System.err.println("createGUI didn't complete successfully");
        }
    }
	@RequestMapping("messagingJsp.do")
	public String messagingJsp() {
		return "home/messaging";
	}
}

