package kh.com.nr.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.nr.model.dto.InterestDto;

@Repository
public class InterestDao {
	
	@Autowired
	private SqlSession sqlSession;

	public void setInterest(InterestDto dto) {
		sqlSession.insert("interest.setInterest", dto);
	}

	public void deleteInterest(InterestDto dto) {
		sqlSession.delete("interest.deleteInterest", dto);
	}

	public List<InterestDto> getInterest(String userid) {
		return sqlSession.selectList("interest.getInterest", userid);
	}

	public InterestDto chkInterest(InterestDto dto) {
		return sqlSession.selectOne("interest.chkInterest", dto);
	}
	
	
}
