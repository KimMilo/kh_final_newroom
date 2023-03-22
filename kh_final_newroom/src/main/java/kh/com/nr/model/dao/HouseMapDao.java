package kh.com.nr.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.nr.model.dto.HouseDealDto;
import kh.com.nr.model.dto.HouseInfoDto;
import kh.com.nr.model.dto.SidoGugunCodeDto;

@Repository
public class HouseMapDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<SidoGugunCodeDto> getSido() {
		return sqlSession.selectList("houseMap.getSido");
	}

	public List<SidoGugunCodeDto> getGugunInSido(String sido) {
		return sqlSession.selectList("houseMap.getGugunInSido", sido);
	}

	public List<HouseInfoDto> getDongInGugun(String gugun) {
		return sqlSession.selectList("houseMap.getDongInGugun", gugun);
	}

	public List<HouseInfoDto> getAptInDong(String dong) {
		return sqlSession.selectList("houseMap.getAptInDong", dong);
	}

	public List<HouseDealDto> getDealInfo() {
		return sqlSession.selectList("houseMap.getDealInfo");
	}

	public HouseDealDto getDealInfoOne(int no) {
		return sqlSession.selectOne("houseMap.getDealInfoOne", no);
	}

	public List<HouseDealDto> getDealInfoByAptName(String aptName) {
		return sqlSession.selectList("houseMap.getDealInfoByAptName", aptName);
	}

	public List<HouseDealDto> getDealInfoByDong(String dong) {
		return sqlSession.selectList("houseMap.getDealInfoByDong", dong);
	}

}
