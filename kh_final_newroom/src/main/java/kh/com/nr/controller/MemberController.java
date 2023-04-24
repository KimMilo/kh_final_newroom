package kh.com.nr.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.common.FileUtil;
import kh.com.nr.common.Paging;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.service.MemberService;

@RequestMapping("/member")
@Controller
@CrossOrigin(origins = "*")
public class MemberController {
	@Autowired
	private MemberService mservice;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;
		
	// id 중복체크
	@ResponseBody
	@GetMapping("/idCheck/{userid}")
	public String idCheck(@PathVariable("userid") String userid) {
		if (mservice.idCheck(userid))
			return "true";
		return "false";
	}

	/**
	 * TODO 이름, 전화번호, 이메일 인증을 통해서 인증번호 받기를 클릭하여 인증번호를 발송하는것까지만 구현하기
	 * 
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

	// 비밀번호 찾기 페이지 이동
	@GetMapping("/findpw")
	public String findPwGet() {
		return "findPw";
	}

	// 비밀번호 찾기
	@PostMapping("/findpw")
	public String findPw(String username, String userid, String userphone, Model model) {
		MemberDto data = new MemberDto();
		data.setUsername(username);
		data.setUserid(userid);
		data.setUserphone(userphone);

		MemberDto member = mservice.findUser(data);
		if (member == null) { // 회원 찾기 실패
			model.addAttribute("findResult", "fail");
		} else {
			model.addAttribute("user", member);
			model.addAttribute("findResult", "success");
		}
		return "findPw";
	}
	
	// 비밀번호 수정
	@PostMapping("/modifypw")
	public String modifyPw(MemberDto dto) {
		dto.setUserpw(pwEncoder.encode(dto.getUserpw()));
		mservice.updateById(dto);
		return "index";
	}

	// 마이페이지 이동
	@GetMapping("/mypage")
	public ModelAndView myPage(ModelAndView mv, String userpw) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto mdto = mservice.getOne(auth.getName()); 
		mv.addObject("loginInfo", mdto);
		mv.setViewName("mypage");
		return mv;
	}

	// 회원 리스트 이동
	@GetMapping("/list")
	public ModelAndView gotoMemberList(ModelAndView mv,
			@RequestParam(name = "p", required = false, defaultValue = "1") String p,
			@RequestParam(name = "name", required = false) String username) {
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(p);
		} catch (Exception e) {
			mv.addObject("msg", "요청하신 URL 주소 오류가 발생하였습니다. 메인페이지로 이동합니다.");
			mv.setViewName("error/error404");
			return mv;
		}

		int pageListLimit = 10;
		Paging paging = mservice.getPage(pageNumber, pageListLimit, username);

		String keyword = username;

		mv.addObject("keyword", keyword);
		mv.addObject("paging", paging);

		mv.setViewName("memberList");
		return mv;
	}

	// 회원가입
	@PostMapping("/join")
	public void join(
			@RequestParam(name = "report", required = false) MultipartFile multi
		  , HttpServletRequest request
		  , HttpServletResponse response
		  , MemberDto dto) {
		Map<String, String> filePath;
		
		try {
			filePath = fileUtil.saveJoin(multi, request, null);
			dto.setImg(filePath.get("original"));
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		String encPw = pwEncoder.encode(dto.getUserpw());
	    dto.setUserpw(encPw);
		
	    mservice.join(dto);
	}

	// 회원정보 수정
	@ResponseBody
	@PostMapping("/mypage")
	public String memberUpdate(
			@RequestParam(name = "report", required = false) MultipartFile multi
			  , HttpServletRequest request
			  , HttpServletResponse response
			  , MemberDto dto) {
		
		Map<String, String> filePath;
		
		try {
			filePath = fileUtil.saveJoin(multi, request, null);
			dto.setImg(filePath.get("original"));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto mdto = mservice.getOne(auth.getName());
		int result = 0;
		if(pwEncoder.matches(dto.getUserpw(), mdto.getUserpw())) {
			result = mservice.update(dto); 
		}
			
		if(result == 1) {
			return "success";
		}else {
			return "fail";
		}
	}

	// 회원정보 탈퇴
	@ResponseBody
	@DeleteMapping("/{userid}")
	public String memberDelete(@PathVariable("userid") String userid) {
		if (mservice.delete(userid) == 1) {
			SecurityContextHolder.clearContext();
			return "success";
		}
		return "fail";
	}

	// 현재 로그인 되어있으면 아이디와 관리자 여부 리턴
	@ResponseBody
	@GetMapping("/getUserId")
	public Map<String, String> getUserId() {
		Map<String, String> user = new HashMap<>();
		user.put("userId", "");
		user.put("admin", "false");
		user.put("name", "");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName()); 
		if (loginInfo != null) {
			user.put("userId", loginInfo.getUserid());
			user.put("name", loginInfo.getUsername());
			user.put("img", loginInfo.getImg());
			if (loginInfo.getMrole().contains("ADMIN")) {
				user.put("admin", "true");
			}
		}
		return user;
	}

	// 회원들 관리자 또는 일반회원으로 변경하기
	@ResponseBody
	@PutMapping("/change")
	public void changeMemberRole(@RequestBody MemberDto dto) {
		mservice.modifyRole(dto);
	}

}
