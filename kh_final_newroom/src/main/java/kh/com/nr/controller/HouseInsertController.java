package kh.com.nr.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.common.FileUtil;
import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.service.HouseMapService;
import kh.com.nr.model.service.MemberService;

@Controller
public class HouseInsertController {
	
	@Autowired
	private HouseMapService hmservice;
	
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	@PostMapping("/insert")
	public ModelAndView doInsertBoard(
			MultipartHttpServletRequest multiReq,
			@RequestParam(name = "report", required = false) MultipartFile multi
			, HttpServletRequest request
			,ModelAndView mv
			, HouseDealDto hdto
			) {
		Map<String, String> filePath;
		try {
			//fileListPath = fileUtil.saveFileList(multiReq, request, null);
			filePath = fileUtil.saveFile(multi, request, null);
			hdto.setImg(filePath.get("original"));
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		hdto.setNo(hdto.getNo());
		hdto.setDealAmount(hdto.getDealAmount());
		hdto.setDealYear(hdto.getDealYear());
		hdto.setDealMonth(hdto.getDealMonth());
		hdto.setDealDay(hdto.getDealDay());
		hdto.setArea(hdto.getArea());
		hdto.setFloor(hdto.getFloor());
		hdto.setDtype(hdto.getDtype());
		hdto.setRentMoney(hdto.getRentMoney());
		
		int result = hmservice.insert(hdto);
		if(result == 1) {
			mv.addObject("insertR", "매물 등록 완료!");
		} else {
			mv.addObject("insertR", "매물 등록 실패! 다시 확인 바람.");
		}
		mv.setViewName("search");
		return mv;
	}
}
