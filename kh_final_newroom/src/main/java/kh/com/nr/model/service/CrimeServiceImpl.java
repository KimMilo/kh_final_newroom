package kh.com.nr.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.model.dao.CrimeDaoImpl;
import kh.com.nr.model.dto.CrimeDto;

@Service
public class CrimeServiceImpl implements CrimeService{
	@Autowired
	CrimeDaoImpl cdao;
	
	public List<CrimeDto> getCrimeList(){
		return cdao.getCrimeList();
	}
}
