package kh.com.nr.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.com.nr.model.dto.HospitalDto;
import kh.com.nr.model.service.HospitalService;

@Controller
@RequestMapping("/hospital")
@RestController
public class HospitalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private HospitalService hservice;
	
	@GetMapping("/safety/{hospitalNo}")
	public List<HospitalDto> safety(@PathVariable("hospitalNo") String no){
		List<HospitalDto> hList = null;
		try {
			hList = hservice.getSafetyHospitalList(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hList;
	}
	
}
