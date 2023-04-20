package kh.com.nr.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.common.FileUtil;
import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.dto.HouseInfoDto;
import kh.com.nr.model.dto.SidoGugunCodeDto;
import kh.com.nr.model.service.HouseMapService;

@Controller
@RequestMapping("/map")
public class HouseMapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private HouseMapService hmservice;
	 
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	@Autowired
	HouseMapService hmService;

	@GetMapping("/sido")
	@ResponseBody
	public List<SidoGugunCodeDto> sido(){
		List<SidoGugunCodeDto> sidoList = null;
		try {
			sidoList = hmService.getSido();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(sidoList);
		return sidoList;
	}

	@GetMapping("/gugun/{sido}")
	@ResponseBody
	public List<SidoGugunCodeDto> gugun(@PathVariable("sido") String sido){
		List<SidoGugunCodeDto> gugunList = null;
		try {
			gugunList = hmService.getGugunInSido(sido);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gugunList;
	}
	
	@GetMapping("/dong/{gugun}")
	@ResponseBody
	public List<HouseInfoDto> dong(@PathVariable("gugun") String gugun){
		List<HouseInfoDto> dongList = null;
		try {
			dongList = hmService.getDongInGugun(gugun);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dongList;
	}
	
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
		mv.setViewName("search");
		return mv;
	}
	
	
}