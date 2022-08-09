package com.mycompany.portfolio.board.controller;

import java.awt.List;
import java.lang.reflect.Type;
import java.sql.Array;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.mycompany.portfolio.board.model.service.BoardService;
import com.mycompany.portfolio.board.model.vo.Board;
import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("boardList.do")
	public String selectBoardList(Model model) {
		model.addAttribute("boardList", new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(service.selectBoardList()));
		return "board/selectBoardList";
	}
	@RequestMapping("insertBoardJsp.do")
	public String insertBoardJsp() {
		return "board/insertBoardForm";
	}
	@RequestMapping("selectBoardDetail.do")
	public String selectBoardDetail(String boardNo, Model model, HttpSession session) {
		Board board = service.selectBoardDetail(boardNo);
		if(board != null) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			if(loginUser != null && !board.getBoardAuthor().equals(loginUser.getId())) {
				int count = service.plusBoardCount(board.getBoardNo());
				logger.info("게시판번호 " + board.getBoardNo() + "조회수  " + count + "증가");
			}
		}
		model.addAttribute("board", service.selectBoardDetail(boardNo));
		return "board/selectBoardDetail";
	}
	@RequestMapping("insertBoard.do")
	public String insertBoard(Board board, Model model) {
		int result = service.insertBoard(board);
		if(result>0) {
			model.addAttribute("msg", "게시글이 등록되었습니다");
			return "redirect: home.do";
		}else {
			model.addAttribute("msg", "게시글 작성중 에러가 발생했습니다 다시 작성해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("updateBoard.do")
	public String updateBoard(Board board, Model model) {
		int result = service.updateBoard(board);
		if (result >0 ) {
			model.addAttribute("msg", "게시글이 수정되었습니다");
			return "redirect: home.do";
		}else {
			model.addAttribute("msg", "게시글 수정 중 에러가 발생했습니다 다시 수정해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(String boardNo, Model model) {
		int result = service.deleteBoard(Integer.parseInt(boardNo));
		if(result > 0) {
			model.addAttribute("msg", "게시글이 삭제되었습니다");
			return "redirect: home.do";
		}else {
			model.addAttribute("msg", "게시글이 삭제되지 않았습니다 다시 시도해 주세요");
			return "common/error";
		}
	}
	@ResponseBody
	@RequestMapping("insertReply.do")
	public String insertReply(Reply reply, Model model) {
		return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(service.insertReply(reply));
	}
	@ResponseBody
	@RequestMapping("getReplyList.do")
	public String getReplyList(String refBno) {
		return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(service.getReplyList(Integer.parseInt(refBno)));
	}
	@ResponseBody
	@RequestMapping("deleteReplyAjax.do")
	public String deleteReplyAjax(String replyNo) {
		int result = service.deleteReplyAjax(replyNo);
		if(result <= 0) {
			return "삭제되지 않았습니다 다시시도해주세요";
		}
		return null;
	}
	@ResponseBody
	@RequestMapping("updateReplyCheck.do")
	public String updateReplyCheck(String replyNoArr) {
		Gson gson = new Gson();
		int[] replyNoArray = gson.fromJson(replyNoArr, int[].class); 
		int result = service.updateReplyCheck(replyNoArray);
		if(result > 0) {
			return gson.toJson(null);
		}
		return null;
	}

}
