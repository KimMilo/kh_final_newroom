package kh.com.nr.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.model.dao.HouseMapDao;
import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.dto.HouseInfoDto;
import kh.com.nr.model.dto.SidoGugunCodeDto;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	@Autowired
	private HouseMapDao dao;
	
	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return dao.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return dao.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return dao.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return dao.getAptInDong(dong);
	}
	
	@Override
	public List<HouseDealDto> getDealInfo() throws Exception{
		return dao.getDealInfo();
	}
	
	@Override
	public HouseDealDto getDealInfo(int no) throws Exception{
		return dao.getDealInfoOne(no);
	}

	@Override
	public List<HouseDealDto> getDealInfoByAptName(String aptName) throws Exception {
		// 아파트 이름으로 거래 정보 가져오기
		return dao.getDealInfoByAptName(aptName);
	}

	@Override
	public List<HouseDealDto> getDealInfoByDong(String dong) throws Exception {
		// 동 이름으로 거래 정보 가져오기
		return dao.getDealInfoByDong(dong);
	}

	@Override
	public List<HouseDealDto> sortDealInfo(List<HouseDealDto> data, String sortType) throws Exception {
		// sort type에 따라 데이터 정렬 
		if(sortType.equals("price")) { // 가격 기준으로 정렬
			data.sort((HouseDealDto d1, HouseDealDto d2) -> d1.getDealAmount().compareTo(d2.getDealAmount()));
		} else if(sortType.equals("area")) { // 면적 기준으로 정렬
			data.sort((HouseDealDto d1, HouseDealDto d2) -> Float.compare(Float.parseFloat(d1.getArea()), Float.parseFloat(d2.getArea())));
		} else if(sortType.equals("floor")) { // 층을 기준으로 정렬
			data.sort((HouseDealDto d1, HouseDealDto d2) -> Integer.compare(Integer.parseInt(d1.getFloor()), Integer.parseInt(d2.getFloor())));
		}
		return data;
	}
	
	
}
