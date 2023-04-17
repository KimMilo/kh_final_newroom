package kh.com.nr.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.dto.InterestDto;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.service.HouseMapService;
import kh.com.nr.model.service.InterestService;
import kh.com.nr.model.service.MemberService;

@RequestMapping("/interest")
@Controller
public class InterestController {
	
	@Autowired
	private InterestService iservice;
	
	@Autowired
	private HouseMapService hservice;
	
	@Autowired
	private MemberService mservice;	
	
	// 찜하기 페이지 이동
	@GetMapping("")
	private String gotoInterestList(Model model) {
		model.addAttribute("interList", getInterestList());
		return "interestList";
	}
	
	@GetMapping("/list")
	@ResponseBody
	private List<InterestDto> getInterestList(){
		List<InterestDto> interList = new ArrayList<>();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto dto = mservice.getOne(auth.getName());
		if(dto == null) return null;
		
		String userid = dto.getUserid();
		try {
			interList = iservice.getInterest(userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return interList;
	}

	// 찜하기 등록
	@GetMapping("/{dealId}")
	@ResponseBody
	private void setInterest(@PathVariable("dealId") int dealId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName());
		
		String userid = loginInfo.getUserid();

		iservice.setInterest(new InterestDto(userid, dealId));
	}
	
	// 찜하기 취소
	@DeleteMapping("/{dealId}")
	@ResponseBody
	private void deleteInterest(@PathVariable("dealId") int dealId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName());
		String userid = loginInfo.getUserid();

		iservice.deleteInterest(new InterestDto(userid, dealId));
	}
	
	// 찜한 매물인지 확인
	@GetMapping("/chk/{dealId}")
	@ResponseBody
	private String chkInterest(@PathVariable("dealId") int dealId) {
		InterestDto dto = new InterestDto();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDto loginInfo = mservice.getOne(auth.getName());
		String userid = loginInfo.getUserid();
		
		dto.setUserid(userid);
		dto.setDealId(dealId);
		if(iservice.chkInterest(dto) != null) {
			return "true";
		}
		return "false";
	}
	
	//매물 정보 디테일 가져오기
		@GetMapping("/detail/{dealId}")
		@ResponseBody
		private HouseDealDto detail(@PathVariable("dealId") int dealId) {
			HouseDealDto dto = null;
			try {
				dto = hservice.getDealInfo(dealId);
			}catch (Exception e) {
				e.printStackTrace();
			}
			return dto;
		}

}
