package kh.com.nr.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.model.dao.HospitalDao;
import kh.com.nr.model.dto.HospitalDto;

@Service
public class HospitalServiceImpl implements HospitalService {
	@Autowired
	private HospitalDao dao;
	
	@Override
	public List<HospitalDto> getSafetyHospitalList(String houseinfoId) {
		return dao.getSafetyHospitalList(houseinfoId);
	}

}
