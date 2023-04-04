package kh.com.nr.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.nr.model.dto.MemberDto;


@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberDto idCheck(String userid) {
		return sqlSession.selectOne("member.idCheck", userid);
	}

	public MemberDto loginCheck(MemberDto data) {
		return sqlSession.selectOne("member.loginCheck", data);
	}

	public int join(MemberDto member) {
		return sqlSession.insert("member.join", member);
	}

//	public List<MemberDto> search() {
//		return sqlSession.selectList("member.search");
//	}

//	public List<MemberDto> searchName(String username) {
//		return sqlSession.selectList("member.searchName", username);
//	}

	public int update(MemberDto member) {
		return sqlSession.update("member.update", member);
	}

	public int updateById(MemberDto member) {
		return sqlSession.update("member.updateById", member);
	}

	public int delete(String userid) {
		return sqlSession.delete("member.delete", userid);
	}

	public MemberDto findUser(MemberDto data) {
		return sqlSession.selectOne("member.findUser", data);
	}

	public int modifyRole(MemberDto dto) {
		return sqlSession.update("member.modifyRole", dto);
	}


	public List<MemberDto> selectPage(Map<String, Object> page) {
		return sqlSession.selectList("member.selectPage", page);
	}

	public int selectTotalRowCount(String username) {
		return sqlSession.selectOne("member.selectTotalRowCount", username);
	}

//	public int selectTotalRowCountName(String username) {
//		return sqlSession.selectOne("member.selectTotalRowCountName", username);
//	}

	
	


	
}
