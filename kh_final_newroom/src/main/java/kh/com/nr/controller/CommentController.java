package kh.com.nr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import kh.com.nr.model.dto.CommentDto;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.service.MemberService;
import kh.com.nr.model.service.NoticeService;
 
@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private NoticeService nservice;

	@Autowired
	private MemberService mservice;
	
	@GetMapping(value="", produces = "text/json; charset=utf8")
	public String getComment(int bnum) {
		List<CommentDto> commentList = nservice.getCommentList(bnum);
		Gson gs = new Gson();
		String result = gs.toJson(commentList);
		System.out.println(result.toString());
		return result;
	}
	
	@DeleteMapping("/{cnum}")
	public void commentDelete( @PathVariable("cnum") int cnum) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName());
		CommentDto dto = new CommentDto();
		dto.setCwriter(loginInfo.getUserid());
		dto.setCnum(cnum);
		nservice.deleteComment(dto);
	}
	
	@PostMapping("")
	public String postComment(int bnum, String content) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName());
		if(loginInfo!=null && nservice.writeComment(bnum, content, loginInfo)) { // 로그인된 사람만 글 쓸수 있음.
			return "success";
		}else {
			return "fail";
		}
	}
}
