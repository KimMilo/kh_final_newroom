package kh.com.nr.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.service.MemberService;

@RequestMapping("/member")
@Controller
@CrossOrigin(origins = "*")
public class MemberController {
	@Autowired
	private MemberService mservice;
	
	//id 중복체크
	@ResponseBody
	@GetMapping("/idCheck/{userid}")
	public String idCheck(@PathVariable("userid") String userid) {
		if(mservice.idCheck(userid))
			return "true";
		return "false";
	}
	
	//로그인
	@ResponseBody
	@PostMapping("/login") 
    public String login(MemberDto dto, HttpSession session) throws IOException {
		MemberDto data = new MemberDto();
		data.setUserid(dto.getUserid());
		data.setUserpw(dto.getUserpw());
		MemberDto member = mservice.loginCheck(data);
		
		if(member != null) { //로그인 성공
			session.setAttribute("loginInfo", member);
			return "true";
		}
		return "false";
    }
	
	//로그아웃
	@ResponseBody
	@GetMapping("/logout") 
	public void logout(HttpSession session, HttpServletResponse resp, HttpServletRequest req) throws IOException{
		session.invalidate();
	}
	
	/**
	 * TODO 이름, 전화번호, 이메일 인증을 통해서 인증번호 받기를 클릭하여 인증번호를 발송하는것까지만 구현하기
	 * @return
	 */
//	//아이디 찾기 페이지 이동
//	@GetMapping("/findId") 
//	public String findIdGet() {
//		return "findId";
//	}
//		
//	//아이디 찾기
//	@PostMapping("/findId") 
//	public String findId(String username, String userphone, String useremail, Model model) {
//		MemberDto data = new MemberDto();
//		data.setUsername(username);
//		data.setUseremail(useremail);
//		data.setUserphone(userphone);
//		
//		MemberDto member = mservice.findUser(data);
//		if(member == null) { //회원 찾기 실패
//			model.addAttribute("findResult", "fail");
//		}
//		model.addAttribute("user", member);
//		model.addAttribute("findResult", "success");
//		return "findId";
//	}
	
	//비밀번호 찾기 페이지 이동
	@GetMapping("/findpw") 
	public String findPwGet() {
		return "findPw";
	}
	
	//비밀번호 찾기
	@PostMapping("/findpw") 
	public String findPw(String username, String userid, String userphone, Model model) {
		MemberDto data = new MemberDto();
		data.setUsername(username);
		data.setUserid(userid);
		data.setUserphone(userphone);
		
		MemberDto member = mservice.findUser(data);
		if(member == null) { //회원 찾기 실패
			model.addAttribute("findResult", "fail");
		}
		model.addAttribute("user", member);
		model.addAttribute("findResult", "success");
		return "findPw";
	}
	
	//비밀번호 수정
	@PostMapping("/modifyPw") 
	public String modifyPw(MemberDto dto) {
		mservice.updateById(dto);
		return "index";
	}
	
	//마이페이지 이동
	@GetMapping("/mypage") 
	public String myPage() {
		return "mypage";
	}
	
	//회원 리스트 이동
	@GetMapping("/list") 
	public String gotoMemberList() {
		return "memberList";
	}
	
	//회원 이름 검색
	@PostMapping("/search") 
	@ResponseBody
	public List<MemberDto> memberNameSearchList(String name) {
		return mservice.searchName(name);
	}
	// TODO 시간 가능하면 회원 이름 말고 전화번호나 이메일주소도 추가하기
	
	//회원가입
	@ResponseBody
	@PostMapping("/join") 
	public void join(MemberDto dto) {
		mservice.join(dto);
	}
	
	//회원정보 수정
	@ResponseBody
	@PutMapping("") 
	public String memberUpdate(@RequestBody MemberDto dto, HttpSession session) {
		if(mservice.update(dto) == 1) {
			session.setAttribute("loginInfo", dto);
			return "success";
		}
		return "fail";
	}
	
	//회원정보 탈퇴
	@ResponseBody
	@DeleteMapping("/{userid}") 
	public String memberDelete(@PathVariable("userid") String userid, HttpSession session) {
		if(mservice.delete(userid) == 1) {
			session.invalidate();
			return "success";
		}
		return "fail";
	}
	
	//현재 로그인 되어있으면 아이디와 관리자 여부 리턴
	@ResponseBody
	@GetMapping("/getUserId")
	public Map<String, String> getUserId(HttpSession session) {
		Map <String, String> user = new HashMap<>();
		user.put("userId", "");
		user.put("admin", "false");
		user.put("name", "");
		
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		if(loginInfo != null) {
			user.put("userId", loginInfo.getUserid());
			user.put("name", loginInfo.getUsername());
			if(loginInfo.getMrole() == 1) user.put("admin", "true");
		}
		return user;
	}
	
	//회원들 관리자 또는 일반회원으로 변경하기
	@ResponseBody
	@PutMapping("/change")
	public void changeMemberRole(@RequestBody MemberDto dto) {
		mservice.modifyRole(dto);
	}

}
