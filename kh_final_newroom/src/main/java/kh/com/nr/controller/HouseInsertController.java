package kh.com.nr.controller;
 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.common.FileUtil;
import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.service.HouseMapService;

@Controller
public class HouseInsertController {
	
	@Autowired
	private HouseMapService hmservice;
	 
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	@PostMapping("/insert")
	public ModelAndView insert(
			@RequestParam(name = "report", required = false) MultipartFile multi
			, HttpServletRequest request
			,ModelAndView mv
			, HouseDealDto hdto
			) {
		Map<String, String> filePath;
		try {
			filePath = fileUtil.saveFile(multi, request, null);
			hdto.setScatchImg(filePath.get("original"));
		} catch (Exception e) {
			e.printStackTrace();
		}		
				
		int result = hmservice.insert(hdto);
		if(result == 1) {
			mv.addObject("insertR", "매물 등록 완료!");
		} else {
			mv.addObject("insertR", "매물 등록 실패! 다시 확인 바람.");
		}
		mv.setViewName("redirect:search");
		return mv;
	}
}
