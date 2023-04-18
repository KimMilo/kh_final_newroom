package kh.com.nr.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConfigController {
	private static final Logger logger = 
			LoggerFactory.getLogger(HomeController.class);
	
	// 로그인 성공
	@GetMapping("/authRole")
    public ModelAndView authdivRole(ModelAndView mv, HttpServletRequest req) {
		if(req.isUserInRole("ROLE_MEMBER")) {
			mv.setViewName("redirect:interest");
		} else if(req.isUserInRole("ROLE_ADMIN")) {
			mv.setViewName("redirect:member/list");
		} 
		return mv;
    }
	
	// 로그인 실패
	@GetMapping("/loginForm")
    public String loginForm(@RequestParam(value = "exception", required = false) String exception, Model model) {
        model.addAttribute("exception", exception);
        logger.info("loginForm view resolve");
        return "index";
    }
	
	// 접근권한 없음
	@GetMapping("/access-denied")
	public ModelAndView denied(ModelAndView mv, Authentication auth, HttpServletRequest req){
	AccessDeniedException ade = (AccessDeniedException) req.getAttribute(WebAttributes.ACCESS_DENIED_403);
	logger.info("ex : {}",ade);
	 mv.addObject("auth", auth);
	 mv.addObject("errMsg", ade);
	 mv.setViewName("/error/access-denied");
	 return mv;
	} 
}
