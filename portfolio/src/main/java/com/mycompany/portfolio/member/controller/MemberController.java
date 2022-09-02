package com.mycompany.portfolio.member.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.mycompany.portfolio.member.model.vo.Rent;
import com.mycompany.portfolio.board.model.vo.Reply;
import com.mycompany.portfolio.book.model.vo.Book;
import com.mycompany.portfolio.member.model.vo.Member;
import com.mycompany.portfolio.member.model.service.MemberService;

@Controller
@ImportResource("classpath:properties-config.xml")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Value("${adminId}")
	private String admin;
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("loginJsp.do")
	public String loginJsp() {
		return "member/login";
	}
	@RequestMapping("login.do")
	public String login(Member mem, HttpSession session, Model model) {
		Member loginUser = service.selectLoginMember(mem);
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("role", "user");
			ArrayList<Reply> replyRefList = service.getReplyRefList(loginUser.getId());
			if(!replyRefList.isEmpty()) {
				session.setAttribute("replyRefList",replyRefList);
				session.setAttribute("newBadge", true);
			}
//			session.setAttribute("replyRefList",service.getReplyRefList(loginUser.getId()));
			if(loginUser.getId().equals(admin)) {
				session.setAttribute("role", admin);
			}
		//	session.setMaxInactiveInterval(60);
			return "redirect: home.do";
			
		}
		else {
			model.addAttribute("msg", "로그인에 실패했습니다 아이디와 비밀번호를 확인해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("msg", "로그아웃되었습니다");
		return "common/error";
	}
	@RequestMapping("insertRentBook.do")
	public String rentBook(String bookNo, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int dueCount = service.getDueCount(loginUser.getId());
		if(dueCount > 0) {
			model.addAttribute("msg", "연체중인 도서가 있어서 대출이 불가합니다 반납해 주세요");
			return "common/error";
		}
		Rent rent = new Rent(Integer.parseInt(bookNo), loginUser.getId());
		int result = service.insertRentBook(rent);
		if(result>0) {
			model.addAttribute("msg", "대출신청이 완료되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "대출 신청중 에러가 발생했습니다 다시 신청해주세요");
			return "common/error";
		}
	}
	@RequestMapping("historyRentList.do")
	public String historyRentList(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		if(loginUserId.equals(admin)) {
			loginUserId = null;
		}
		model.addAttribute("historyRentList", new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(service.historyRentList(loginUserId)));
		return "member/historyRentList";		
	}
	@RequestMapping("registerJsp.do")
	public String registerJsp() {
		return "member/register";
	}

	@RequestMapping("register.do")
	public String register(Member mem, HttpSession session, Model model) {
		int result = service.register(mem);
		if (result > 0) {
			session.setAttribute("loginUser", mem);
			session.setAttribute("role", "user");
			if(mem.getId().equals(admin)) {
				session.setAttribute("role", admin);
			}
			model.addAttribute("msg", "회원이 되었습니다");
			return "redirect: home.do";
		} else {
			model.addAttribute("msg", "회원이 되지 못했습니다 다시 시도해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("insertRentBookJsp.do")
	public String insertRentBookJsp() {
		return "member/insertRentBook";
	}
	@RequestMapping("insertWishBookJsp.do")
	public String buyBook() {	
		return "member/insertWishBook";
	}
	@RequestMapping("insertWishBook.do")
	public String insertWishBook(Book book, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		book.setISBN(loginUser.getId());//ISBN setter로  userId전달
		int result = service.insertWishBook(book);
		if(result>0) {
			model.addAttribute("msg", "도서 구입 신청이 완료되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "도서구입신청 중 에러가 발생했습니다 다시 시도해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("deleteMember.do")
	public String deleteMember(Member mem, HttpSession session, Model model) {
		Member member = service.selectLoginMember(mem);
		if(member != null) {
			int result = service.deleteMember(mem);
			if(result>0) {
				session.invalidate();
				model.addAttribute("msg", "더이상 회원이 아닙니다");
				return "common/error";
			}else {
				model.addAttribute("msg","회원탈퇴중 에러가 발생했습니다 다시 시도해 주세요");
				return "common/error";				
			}
		}else {
			model.addAttribute("msg", "해당하는 회원이 없습니다 아이디를 확인해주세요");
			return "common/error";
		}
	}
	@RequestMapping("updateMemberJsp.do")
	public String updateMemberJsp() {
		
		return "member/updateMember";
	}
	@RequestMapping("updateMember.do")
	public String updateMember(Member member, Model model, HttpSession session) {
		 int result = service.updateMember(member);
		 if(result>0) {
			 session.setAttribute("loginUser", member);
			 model.addAttribute("msg", "회원정보가 수정되었습니다");
			 return "redirect: home.do";
		 }else {
			 model.addAttribute("msg", "회원정보가 제대로 수정되지 않았습니다 다시시도해 주세요");
			 return "common/error";
		 }		 
	}
	@ResponseBody
	@RequestMapping("checkDuplId.do")
	public String checkDuplId(String id) {
		return String.valueOf(service.checkDuplId(id));
	}
	@RequestMapping("changePassword.do")
	public String changePassword(Member mem, Model model) {
		int result = service.changePassword(mem);
		if(result>0) {
			model.addAttribute("msg", "비밀번호가 변경되었습니다");
			return "member/updateMember";
		}else {
			model.addAttribute("msg", "비밀번호 변경 중 에러가 발생했습니다 다시시도해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("updateRentBook.do")
	public String updateRentBook(String refBno, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int result = service.updateRentBook(new Rent(refBno,loginUser.getId()));
		if(result>0) {
			model.addAttribute("msg", "반납되었습니다");
			return "redirect: home.do";	
		}else {
			model.addAttribute("msg", "에러가 발생했습니다 다시 반납해 주세요");
			return "common/error";
		}				
	}
}
