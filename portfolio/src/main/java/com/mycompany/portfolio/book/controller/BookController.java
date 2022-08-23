package com.mycompany.portfolio.book.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.mycompany.portfolio.book.model.service.BookService;
import com.mycompany.portfolio.book.model.vo.Book;
import com.mycompany.portfolio.book.model.vo.Category;
import com.mycompany.portfolio.book.model.vo.Publisher;
import com.mycompany.portfolio.book.model.vo.Search;
import com.mycompany.portfolio.employee.model.vo.EmployeeOption;

@Controller
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private BookService service;
	
	@Value("${adminId}")
	private String admin;
	
	@RequestMapping("selectPubList.do")
	public String selectPubList(Model model) {
		ArrayList<Publisher> pubList = service.selectPubList();
		model.addAttribute("pubList", new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(pubList));
		return "book/selectPubList";
		
	}
	
	@RequestMapping("insertPubJsp.do")
	public String insertPubJsp() {
		return "book/insertPubForm";
	}
	
	@RequestMapping("insertPub.do")
	public String insertPub(Publisher pub, Model model) {
		int result = service.insertPub(pub);
		if(result > 0 ) {
			model.addAttribute("msg", "새 거래처가 등록되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "거래처 등록중 에러가 발생했습니다 다시 시도해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("insertBookJsp.do")
	public String insertBookJsp() {
		return "book/insertBook";
	}
	@ResponseBody
	@RequestMapping("selectInsertBook.do")
	public String selectPubAjax() {
		Map<String,Object> insertBookMap = new HashMap<String,Object>();
		insertBookMap.put("pubList", service.ajaxSelectPubList());
		insertBookMap.put("catList", service.selectCat());
		return new Gson().toJson(insertBookMap);
	}
	@RequestMapping("insertBook.do")
	public ModelAndView insertBook(Book book, ModelAndView mav, @RequestParam(value="bookImg", required=false)MultipartFile imgFile, HttpServletRequest request) {		
		if(imgFile != null) {
			if(!imgFile.getOriginalFilename().equals("")) {
				book.setOriginalFilename(imgFile.getOriginalFilename());
				book.setRenameFilename(saveFile(imgFile, request));
			}			
		}
		int result = service.insertBook(book);
		if(result > 0) {
			mav.addObject("msg", "성공적으로 도서가 등록되었습니다").setViewName("redirect: home.do");
		}else {
			mav.addObject("msg", "도서등록중 에러가 발생했습니다 다시 시도해주세요").setViewName("common/error");
		}
		return mav;
	}
	private String saveFile(MultipartFile imgFile, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String rootUrl = request.getSession().getServletContext().getRealPath("resources");
		File folder = new File(rootUrl+"/uploadImg");
		if(!folder.exists()) {folder.mkdirs();}
		String renameFilename = new Date(System.currentTimeMillis()).toLocalDate().toString() + imgFile.getOriginalFilename();
		try {
			imgFile.transferTo(new File(folder+"/"+renameFilename));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return renameFilename;
	}

	@RequestMapping("selectBookList.do")
	public String selectBookList(Model model) {
		ArrayList<Book> bookList = service.selectBookList();
		for(Book book :bookList) {
			System.out.println(book.toString());
		}
		model.addAttribute("bookList", new GsonBuilder().setDateFormat("yyyy년MM월dd일").create().toJson(bookList));
		return "book/selectBookList";
	}
	@RequestMapping("selectBookDetail.do")
	public ModelAndView selectBookDetail(String bookNo, ModelAndView mav) {
		Book book = service.selectBookDetail(bookNo);
		if(book == null) {mav.addObject("msg", "불러오는 중 에러가 발생하였습니다 다시 시도해 주세요").setViewName("common/error");}
		else {
			mav.addObject("book", book).setViewName("book/selectBookDetail");
		}
		return mav;
	}
	@RequestMapping("updateBookJsp.do")
	public ModelAndView updateBook(String bookNo, ModelAndView mav) {
		Book book = service.selectBookDetail(bookNo);
		if(book == null) {mav.addObject("msg", "도서수정 중 에러가 발생하였습니다 다시 시도해 주세요").setViewName("common/error");}
		else {
			mav.addObject("book", book).setViewName("book/updateBook");
		}
		return mav;
	}
	@RequestMapping("updateBook.do")
	public String updateBook(Book book, Model model, @RequestParam(value="updateBookImg", required=false) MultipartFile updateImgFile, HttpServletRequest request) {
		logger.info("updateBookVO: " + book.toString());
//		try {
			if(!updateImgFile.isEmpty()) {
		
			book.setOriginalFilename(updateImgFile.getOriginalFilename());
			book.setRenameFilename(saveFile(updateImgFile, request));
			}	
//		}catch(MaxUploadSizeExceededException e) {

//		}
		int result = service.updateBook(book);
		if(result > 0) {
			model.addAttribute("msg", "도서정보가 수정되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "도서 수정 중 에러가 발생했습니다 다시 시도해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("deleteBook.do")
	public String deleteBook(String bookNo, Model model) {
		int result = service.deleteBook(bookNo);
		if(result>0) {
			model.addAttribute("msg", "해당 도서가 삭제되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "도서가 삭제되지 않았습니다 다시 시도해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("updatePubJsp.do")
	public ModelAndView updatePubJsp(String pubNo, ModelAndView mav) {
		Publisher publisher = service.selectPub(pubNo);
		if(publisher == null) {
			mav.addObject("msg", "거래처 수정 중 에러가 발생했습니다 다시 시도해주세요").setViewName("common/error");
		}
		else {
			mav.addObject("publisher", publisher).setViewName("book/updatePub");
		}
		return mav;
	}
	@RequestMapping("updatePub.do")
	public String updatePub(Publisher publisher, Model model) {
		if(publisher.getDealYn() == null) {
			publisher.setDealYn("N");
		}
		int result = service.updatePub(publisher);
		if(result > 0) {
			model.addAttribute("msg", "거래처가 수정되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "거래처 수정중 에러가 발생했습니다 다시 시도해 주세요");
			return "common/error";
		}
	}
	@RequestMapping("deletePub.do")
	public String deletePub(int pubNo, Model model) {
		int result = service.deletePub(pubNo);
		if(result > 0) {
			model.addAttribute("msg", "거래처가 삭제되었습니다");
			return "redirect: home.do";}
		else {
			model.addAttribute("msg", "거래처가 삭제되지 않았습니다 다시 시도해 주세요");
			return "common/error";
		}
	}
	@ResponseBody
	@RequestMapping("searchBook.do")
	public String searchBook(String condition, String content) {
		Search search = new Search();
		if(condition.equals("book")) {search.setCondition("book");}
		else if(condition.equals("author")) {search.setCondition("author");}
		else if(condition.equals("publisher")) {search.setCondition("publisher");}
		search.setContent(content);
		ArrayList<Book> searchBookList = service.searchBookList(search);
		if(searchBookList.isEmpty()) {
			return "isEmpty";
		}
		else {
			return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(searchBookList);
		}
	}
	@RequestMapping("selectWishBookList.do")
	public String selectWishBookList(Model model) {
		model.addAttribute("wishBookList", new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(service.selectWishBookList()));
		return "book/selectWishBookList";
	}
	@RequestMapping("selectCatList.do")
	public ModelAndView selectCatList(ModelAndView mv) {
		mv.addObject("catList", service.selectCat()).setViewName("book/selectCatList");
		return mv;
	}
	@RequestMapping("insertCatJsp.do")
	public ModelAndView insertCatJsp(ModelAndView mv) {
		mv.addObject("catList", service.selectCat()).setViewName("book/insertCatForm");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="setCategories.do", produces="application/text;charset=utf-8")
	public String setCategories(String setCategoryLists,String delMainCategories, String delSubCategories) {
		Gson gson = new Gson();
		Type categoryType = new TypeToken<ArrayList<ArrayList<Category>>>(){}.getType();
		ArrayList<ArrayList<Category>> setLists = gson.fromJson(setCategoryLists, categoryType);
		ArrayList<Category> mainInputs = setLists.get(0);
		ArrayList<Category> subInputs = setLists.get(1);
		ArrayList<Category> updateMainList = setLists.get(2);
		ArrayList<Category> updateSubList = setLists.get(3);
		String[] delMainArray = gson.fromJson(delMainCategories, String[].class);
		String[] delSubArray = gson.fromJson(delSubCategories, String[].class);
		int count = 0; int resultCount = 0;
		if(!mainInputs.isEmpty()) {
			count++;
			int result = service.insertMainCatetories(mainInputs);
			if(result > 0) { resultCount++;}
		}
		if(!subInputs.isEmpty()) {
			count++;
			int result = service.insertSubCategories(subInputs);
			if(result>0) { resultCount++;}
		}
		if(!updateMainList.isEmpty()) {
			count++;
			int result = service.updateMainCategories(updateMainList);
			if(result>0) { resultCount++;}
		}
		if(!updateSubList.isEmpty()) {
			count++;
			int result = service.updateSubCategories(updateSubList);
			if(result>0) { resultCount++;}
		}
		if(delMainArray.length != 0) {
			count++;
			int result = service.delMainCategories(delMainArray);
			if(result>0) { resultCount++;}
		}
		if(delSubArray.length != 0) {
			count++;
			int result = service.delSubCategories(delSubArray);
			if(result>0) { resultCount++;}
		}
		if(count != resultCount) {
			return "일부가 누락되었습니다 확인해 주세요";
		}else {
			return "성공적으로 저장되었습니다";
		}
		

	}
}
