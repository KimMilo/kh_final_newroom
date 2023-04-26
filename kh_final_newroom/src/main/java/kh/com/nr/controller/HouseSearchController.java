package kh.com.nr.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.common.FileUtil;
import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.service.HouseMapService;

@Controller
@RequestMapping("/search")
public class HouseSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private HouseMapService hmservice;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
//	@GetMapping("")
//	public String search(Model model) {
//		List<HouseDealDto> dealList = new ArrayList<>();
//		try {
//			dealList = hmservice.getDealInfo();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		model.addAttribute("dealList", dealList);
//		return "search";
//	}
	
	@GetMapping("")
	public String search(String sido, String gugun, String dong, String aptName, 
			String houseType,String sortType, Model model) {

		List<HouseDealDto> dealList = new ArrayList<>();
		
		// 검색
		if(aptName != null && aptName.length() > 0) { // 아파트 이름으로 검색
			try {
				dealList = hmservice.getDealInfoByAptName(aptName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(dong != null && dong.length() > 0) { // 동으로 검색
			try {
				dealList = hmservice.getDealInfoByDong(dong);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				dealList = hmservice.getDealInfo();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 정렬
		if(dealList != null && dealList.size() > 0 && sortType != null && sortType.length() > 0) {
			try {
				hmservice.sortDealInfo(dealList, sortType);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("dealList", dealList);
		return "search";
	}	
	
	// 매물 등록
	@PostMapping("/insert")
	public ModelAndView insert(
			@RequestParam(name = "report", required = false) MultipartFile multi
			, HttpServletRequest request
			, HttpServletResponse response
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
		mv.setViewName("search");
		return mv;
	}
}
