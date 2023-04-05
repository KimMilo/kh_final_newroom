package kh.com.nr.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.dto.QnaDto;
import kh.com.nr.model.service.QnaService;

@Controller
@RequestMapping("/qna")
@CrossOrigin(origins = "*")
public class QnaController {
	@Autowired
	QnaService qService;

	//뷰 페이지 보여주기
	@GetMapping("")
	public ModelAndView qnaView(
			ModelAndView mv
		  , String keyword
		  , @RequestParam(name = "p", required = false, defaultValue = "1") String p) {
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(p);
		} catch (Exception e) {
			mv.addObject("msg","요청하신 URL 오류가 발생하였습니다. 메인페이지로 이동합니다.");
			mv.setViewName("error");
			return mv;
		}
		int pageListLimit = 10;
		
		Paging paging = qService.getPage(pageNumber, pageListLimit, keyword);
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
   	public int addEmployee(@RequestBody QnaDto dto, HttpSession session) throws Exception {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		dto.setUserid(loginInfo.getUserid());
		return qService.write(dto);
	}
	
	// 질문 수정
	@PutMapping("")
	@ResponseBody
	public int qnaUpdate(@RequestBody QnaDto dto)
			throws IOException {
		return qService.update(dto);
	}
	
	// 질문 삭제
	@DeleteMapping("/{bnum}")
	@ResponseBody
	public int delete(@PathVariable("bnum") int bnum) {
		return qService.delete(bnum);
	}
	
	// 질문 검색
	@GetMapping("{type}/{word}")
	@ResponseBody
	public List<QnaDto> search(@PathVariable("type") String type,
			@PathVariable("word") String keyword) {	
		List<QnaDto> resultList = null;
		if (type.equals("btitle")) { // 이름으로 검색
			resultList = qService.searchTitle("%" + keyword + "%");
		} else if (type.equals("bcontent")) { // 내용으로 검색
			resultList = qService.searchContent("%" + keyword + "%");
		} else if (type.equals("userid")) {// 작성자로 검색
			resultList = qService.searchWriter("%" + keyword + "%");
		}
	
		return resultList;
	}

	//TODO 답변 COMMENT 테이블 새로 시작
//	//답변 작성
//	@PostMapping("/ans")
//	@ResponseBody
//   	public int addAnswer(@RequestBody QnaDto dto, HttpSession session) throws Exception {
//		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
//		dto.setBtitle("reply");
//		dto.setUserid(loginInfo.getUserid());
//		return qService.ansWrite(dto);
//	}
//	
//	//답변 수정
//	@PutMapping("/ans")
//	@ResponseBody
//	public int ansUpdate(@RequestBody QnaDto dto)
//			throws IOException {
//		return qService.ansUpdate(dto);
//	}
//	
//	//답변 삭제
//	@DeleteMapping("/ans/{bnum}")
//	@ResponseBody
//	public int ansDelete(@PathVariable("bnum") int bnum) {
//		return qService.ansDelete(bnum);
//	}
//	
//	//답변 목록
//	@GetMapping("/ans/{qnum}")
//	@ResponseBody
//	public List<QnaDto> ansList(@PathVariable("qnum") int questionnum) {
//		return qService.getAnsList(questionnum);
//	}
//	
//	// 질문 목록
//	@GetMapping("/faq")
//	@ResponseBody
//	public List<QnaDto> getFAQList() {
//		return qService.getFAQList();
//	}
}
