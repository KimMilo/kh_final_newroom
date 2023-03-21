package kh.com.nr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.com.nr.model.dto.CrimeDto;
import kh.com.nr.model.service.CrimeService;

@RequestMapping("/crime")
@RestController
public class CrimeController {
	@Autowired
	CrimeService cservice;
	
	@GetMapping("")
	public List<CrimeDto> crime(){
		List<CrimeDto> crimeList = null;
		try {
			crimeList = cservice.getCrimeList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return crimeList;
	}
}
