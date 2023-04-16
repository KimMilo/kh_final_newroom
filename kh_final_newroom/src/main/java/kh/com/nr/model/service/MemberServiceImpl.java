package kh.com.nr.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.common.Paging;
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
	public Paging getPage(int pageNumber, int pageListLimit, String username) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		page.put("username", username);
		
		List<MemberDto> data = dao.selectPage(page);
		
		int totalRowCount = dao.selectTotalRowCount(username); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);
				
		return paging;
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

	@Override
	public MemberDto getOne(String name) {
		return dao.getOne(name);
	}

}
