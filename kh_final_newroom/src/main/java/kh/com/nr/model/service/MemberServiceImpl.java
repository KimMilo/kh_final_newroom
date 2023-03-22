package kh.com.nr.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.model.dao.MemberDao;
import kh.com.nr.model.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;
	
	@Override
	public boolean idCheck(String userid) {
		if(dao.idCheck(userid) == null) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public MemberDto loginCheck(MemberDto data) {
		return dao.loginCheck(data);
	}

	@Override
	public int join(MemberDto member) {
		return dao.join(member);
	}

	@Override
	public List<MemberDto> search() {
		return dao.search();
	}
	
	@Override
	public List<MemberDto> searchName(String username) {
		return dao.searchName(username);
	}

	@Override
	public int update(MemberDto member) {
		return dao.update(member);
	}

	@Override
	public int updateById(MemberDto member) {
		return dao.updateById(member);
	}

	@Override
	public int delete(String userid) {
		return dao.delete(userid);
	}

	@Override
	public MemberDto findUser(MemberDto data) {
		return dao.findUser(data);
	}
	
	@Override
	public int modifyRole(MemberDto dto) {
		return dao.modifyRole(dto);
	}
}
