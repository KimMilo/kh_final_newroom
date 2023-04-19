package kh.com.nr.model.service;

import java.util.List;

import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.dto.HouseInfoDto;
import kh.com.nr.model.dto.SidoGugunCodeDto;

public interface HouseMapService {
	List<SidoGugunCodeDto> getSido();
	List<SidoGugunCodeDto> getGugunInSido(String sido);
	List<HouseInfoDto> getDongInGugun(String gugun);
	List<HouseInfoDto> getAptInDong(String dong);
	List<HouseDealDto> getDealInfo();
	HouseDealDto getDealInfo(int no);
	List<HouseDealDto> getDealInfoByAptName(String aptName);
	List<HouseDealDto> getDealInfoByDong(String dong);
	List<HouseDealDto> sortDealInfo(List<HouseDealDto> data, String sortType);
	int insert(HouseDealDto hdto);
}
