package kh.com.nr.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class HomeController {
	
	// 회사 소개페이지 
	@GetMapping("introduction")
	public ModelAndView getComment(ModelAndView mv) {
		return mv;
	}
		
	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session, ModelAndView mv) {
		//MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		mv.setViewName("index");
		return mv;
	}
}
