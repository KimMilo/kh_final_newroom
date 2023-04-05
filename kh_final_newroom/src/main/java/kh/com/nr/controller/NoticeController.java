package kh.com.nr.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.common.Paging;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.dto.NoticeDto;
import kh.com.nr.model.service.NoticeService;


@Controller
public class NoticeController{
	@Autowired
	private NoticeService nservice;

	//글 검색하기
	@GetMapping("noticeSearch") 
	private ModelAndView search(
			  ModelAndView mv
			, String search_type
			, String keyword
			, @RequestParam(name = "p", required = false, defaultValue = "1") String p
			) {
		
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(p);
		} catch (Exception e) {
			mv.addObject("msg","요청하신 URL 오류가 발생하였습니다. 메인페이지로 이동합니다.");
			mv.setViewName("error");
			return mv;
		}
		int pageListLimit = 10;
		
		String typeName = null;
		Paging paging = null;
		if(search_type.equals("btitle")){ //이름으로 검색
			typeName = "btitle";
			paging = nservice.searchTitle(pageNumber, pageListLimit, keyword);
		}else if(search_type.equals("bcontent")){ //내용으로 검색
			typeName = "bcontent";
			paging = nservice.searchContent(pageNumber, pageListLimit, keyword);
		}else if(search_type.equals("userid")){//작성자로 검색
			typeName = "userid";
			paging = nservice.searchWriter(pageNumber, pageListLimit, keyword);
		}
				
		mv.addObject("paging", paging);		
		mv.addObject("typeName", typeName);
		mv.addObject("keyword", keyword);
		mv.setViewName("noticeSearch");
		return mv;
	}

	// 글삭제하기
	@GetMapping("noticeDelete") 
	private ModelAndView delete(ModelAndView mv, int bnum) {
		nservice.delete(bnum);
		mv.setViewName("redirect:noticeList");
		return mv;
	}
	
	//글 수정페이지 이동
	@GetMapping("noticeUpdate") 
	private String noticeUpdate(int bnum, Model model) throws IOException {
		NoticeDto dto = nservice.getBoard(bnum);
		model.addAttribute("dto", dto);	
		return "noticeUpdate";
	}

	//글 수정하기
	@PostMapping("noticeUpdate") 
	private String noticeUpdate(NoticeDto dto, HttpSession session, HttpServletResponse resp, Model model) throws IOException {
		nservice.update(dto);
		return read(dto.getBnum(), model);
	}

	//글 상세보기
	@GetMapping("noticeRead") 
	private String read(int bnum, Model model) {
		NoticeDto dto = nservice.getBoard(bnum);
		model.addAttribute("dto", dto);	
		return "noticeRead";
	}

	//글작성 페이지 이동
	@GetMapping("noticeWrite") 
	private String noticeWritePage() {
		return "noticeWrite";
	}
		
	//글작성하기
	@PostMapping("noticeWrite") 
	private ModelAndView write(
			ModelAndView mv
			, NoticeDto dto, HttpSession session) {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		dto.setUserid(loginInfo.getUserid());
		nservice.write(dto);
		mv.setViewName("redirect:noticeList");
		return mv;
	}

	//전체 목록 보기
	@GetMapping("noticeList") 
	private ModelAndView noticeList(
			  ModelAndView mv
			, @RequestParam(name = "p", required = false, defaultValue = "1") String p
			, String keyword) {
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(p);
		} catch (Exception e) {
			mv.addObject("msg","요청하신 URL 오류가 발생하였습니다. 메인페이지로 이동합니다.");
			mv.setViewName("error");
			return mv;
		}
		int pageListLimit = 10;
		Paging paging = nservice.getPage(pageNumber, pageListLimit); 		
				
		mv.addObject("paging", paging);
		mv.setViewName("noticeList");
		return mv;
	}
}
