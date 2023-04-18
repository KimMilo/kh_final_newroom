package kh.com.nr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.common.Paging;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.dto.QnaDto;
import kh.com.nr.model.service.MemberService;
import kh.com.nr.model.service.QnaService;

@Controller
@RequestMapping("/qna")
@CrossOrigin(origins = "*")
public class QnaController {
	@Autowired
	QnaService qService;
	
	@Autowired
	MemberService mservice;

	//뷰 페이지 보여주기
	@GetMapping("")
	public ModelAndView qnaView(
			ModelAndView mv
		  , @RequestParam(name = "p", required = false, defaultValue = "1") String p) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName());
		
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(p);
		} catch (Exception e) {
			mv.addObject("msg","요청하신 URL 주소 오류가 발생하였습니다. 메인페이지로 이동합니다.");
			mv.setViewName("error/error404");
			return mv;
		}
		int pageListLimit = 10;
		
		Paging paging = qService.getPage(pageNumber, pageListLimit);
		mv.addObject("loginInfo", loginInfo);
		mv.addObject("paging", paging);		
		mv.setViewName("qna");
		return mv;
	}
	
	// 질문 상세보기
	@GetMapping("/{bnum}")
	@ResponseBody
	public QnaDto read(@PathVariable("bnum") int bnum) {
		QnaDto dto = null;
		try {
			dto = qService.getBoard(bnum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	// 질문 작성
	@PostMapping("")
	@ResponseBody
   	public int qnaAdd(@RequestBody QnaDto dto) {
		return qService.write(dto);
	}

	// 질문 수정
	@PutMapping("")
	@ResponseBody
	public int qnaUpdate(@RequestBody QnaDto dto){
		return qService.update(dto);
	}
	
	// 질문 삭제
	@DeleteMapping("/{bnum}")
	@ResponseBody
	public int delete(@PathVariable("bnum") int bnum) {
		return qService.delete(bnum);
	}
	
	// 질문 검색
	@GetMapping("/search")
	public ModelAndView search(
			  ModelAndView mv
			, String search_type
			, String keyword
			, @RequestParam(name = "p", required = false, defaultValue = "1") String p
			) {	
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName());
		
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
		if (search_type.equals("btitle")) { // 이름으로 검색
			typeName = "btitle";
			paging = qService.searchTitle(pageNumber, pageListLimit, keyword);
		} else if (search_type.equals("bcontent")) { // 내용으로 검색
			typeName = "bcontent";
			paging = qService.searchContent(pageNumber, pageListLimit, keyword);
		} else if (search_type.equals("userid")) {// 작성자로 검색
			typeName = "userid";
			paging = qService.searchWriter(pageNumber, pageListLimit, keyword);
		} else if (search_type.equals("FAQ")) {
			typeName = "FAQ";
			paging = qService.searchFAQ(pageNumber, pageListLimit);
		}
	 
		mv.addObject("paging", paging);
		mv.addObject("typeName", typeName);
		mv.addObject("keyword", keyword);
		mv.addObject("loginInfo", loginInfo);
		mv.setViewName("qnaSearch");
		return mv;
	}
	
	// 질문 목록
	@GetMapping("/faq")
	@ResponseBody
	public List<QnaDto> getFAQList() {
		return qService.getFAQList();
	}
}
