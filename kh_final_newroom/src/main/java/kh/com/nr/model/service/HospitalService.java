package kh.com.nr.model.service;

import java.util.List;

import kh.com.nr.model.dto.CovidTestCenterDto;
import kh.com.nr.model.dto.SafetyHospitalDto;

public interface HospitalService {
	List<SafetyHospitalDto> getSafetyHospitalList(String houseinfoId);
	List<CovidTestCenterDto> getCovidTestCenterList(String houseinfoId);
}
