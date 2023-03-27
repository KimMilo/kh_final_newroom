package kh.com.nr.model.service;

import java.util.List;

import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.dto.HouseInfoDto;
import kh.com.nr.model.dto.SidoGugunCodeDto;

public interface HouseMapService {
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseDealDto> getDealInfo() throws Exception;
	HouseDealDto getDealInfo(int no) throws Exception;
	List<HouseDealDto> getDealInfoByAptName(String aptName) throws Exception;
	List<HouseDealDto> getDealInfoByDong(String dong) throws Exception;
	List<HouseDealDto> sortDealInfo(List<HouseDealDto> data, String sortType) throws Exception;
}
