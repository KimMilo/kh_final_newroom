package kh.com.nr.controller;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.common.Paging;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.dto.NoticeDto;
import kh.com.nr.model.service.MemberService;
import kh.com.nr.model.service.NoticeService;


@Controller
@RequestMapping("notice")
public class NoticeController{
	@Autowired
	private NoticeService nservice;
	
	@Autowired
	MemberService mservice;

	//글 검색하기
	@GetMapping("/search") 
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
			mv.addObject("msg","요청하신 URL 주소 오류가 발생하였습니다. 메인페이지로 이동합니다.");
			mv.setViewName("error/error404");
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
	@GetMapping("/delete") 
	private ModelAndView delete(ModelAndView mv, int bnum) {
		nservice.delete(bnum);
		mv.setViewName("redirect:notice/list");
		return mv;
	}
	
	//글 수정페이지 이동
	@GetMapping("/update") 
	private String noticeUpdate(int bnum, Model model) {
		NoticeDto dto = nservice.getBoard(bnum);
		model.addAttribute("dto", dto);	
		return "noticeUpdate";
	}

	//글 수정하기
	@PostMapping("/update") 
	private String noticeUpdate(NoticeDto dto, HttpSession session, HttpServletResponse resp, Model model) {
		nservice.update(dto);
		return read(dto.getBnum(), model);
	}

	//글 상세보기
	@GetMapping("/read") 
	private String read(int bnum, Model model) {
		NoticeDto dto = nservice.getBoard(bnum);
		model.addAttribute("dto", dto);	
		return "noticeRead";
	}

	//글작성 페이지 이동
	@GetMapping("/write") 
	private String noticeWritePage() {
		return "noticeWrite";
	}
		
	//글작성하기
	@PostMapping("/write") 
	private ModelAndView write(
			ModelAndView mv
			, NoticeDto dto) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName());
		dto.setUserid(loginInfo.getUserid());
		nservice.write(dto);
		mv.setViewName("noticeList");
		return mv;
	}

	//전체 목록 보기
	@GetMapping("list") 
	private ModelAndView noticeList(
			  ModelAndView mv
			, @RequestParam(name = "p", required = false, defaultValue = "1") String p
			) {
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(p);
		} catch (Exception e) {
			mv.addObject("msg","요청하신 URL 주소 오류가 발생하였습니다. 메인페이지로 이동합니다.");
			mv.setViewName("error/error404");
			return mv;
		}
		int pageListLimit = 10;
		Paging paging = nservice.getPage(pageNumber, pageListLimit); 		
				
		mv.addObject("paging", paging);
		mv.setViewName("noticeList");
		return mv;
	}
}
