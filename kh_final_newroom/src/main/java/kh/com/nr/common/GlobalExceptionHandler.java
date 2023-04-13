package kh.com.nr.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {
	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handleError404(HttpServletRequest request, Exception e) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error404");
		//mv.addObject("message", "URL 오류 :D");
		mv.addObject("url", request.getRequestURL());
		return mv;
	}
	
	/* common 메소드는 Exception 타입으로 처리하는 모든 예외를 처리하도록 설정*/
	@ExceptionHandler(Exception.class)
	public ModelAndView common(Exception e, HttpServletRequest request) {
		logger.info(e.toString());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/common");
		//mv.addObject("exception", e);  //예외를 뷰에 넘깁니다.
		mv.addObject("url", request.getRequestURL());
		return mv;
	}
}