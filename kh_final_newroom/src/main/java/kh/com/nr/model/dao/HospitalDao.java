package kh.com.nr.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.nr.model.dto.HospitalDto;

@Repository
public class HospitalDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<HospitalDto> getSafetyHospitalList(String houseinfoId) {
		return sqlSession.selectList("hospital.getSafetyHospitalList", houseinfoId);
	}
	
}
