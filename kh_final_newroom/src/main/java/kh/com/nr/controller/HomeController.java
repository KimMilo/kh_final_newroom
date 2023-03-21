package kh.com.nr.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.model.dto.InterestDto;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.service.InterestService;

@Controller
public class HomeController {
	@Autowired
	private InterestService iservice;
	
	@GetMapping("introduction")
	public ModelAndView getComment(ModelAndView mv) {
		return mv;
	}
	
	//홈으로
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session, ModelAndView mv) {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		if(loginInfo != null) {
			String userid = loginInfo.getUserid();
			List<InterestDto> interList = iservice.getInterest(userid);
			mv.addObject("interList", interList);
		}
		mv.setViewName("index");
		return mv;
	}
}
