package kh.com.nr.model.service;

import java.util.List;

import kh.com.nr.model.dto.CovidTestCenterDto;
import kh.com.nr.model.dto.HospitalDto;

public interface HospitalService {
	List<HospitalDto> getSafetyHospitalList(String houseinfoId);
	List<CovidTestCenterDto> getCovidTestCenterList(String houseinfoId);
}
