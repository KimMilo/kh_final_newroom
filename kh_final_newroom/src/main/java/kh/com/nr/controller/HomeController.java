package kh.com.nr.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	@GetMapping("/authRole")
	public ModelAndView authdiv(ModelAndView mv, HttpServletRequest req) {
		
		if(req.isUserInRole("ROLE_MEMBER")) {
			mv.setViewName("redirect:/interest");
		} else if(req.isUserInRole("ROLE_ADMIN")) {
			mv.setViewName("redirect:/member/list");
		} 
		return mv;
	}
	
	@GetMapping("introduction")
	public ModelAndView getComment(ModelAndView mv) {
		return mv;
	}
		
	//홈으로
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session, ModelAndView mv) {
		//MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		mv.setViewName("index");
		return mv;
	}
}
