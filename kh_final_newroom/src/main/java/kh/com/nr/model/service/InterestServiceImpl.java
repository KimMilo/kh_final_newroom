package kh.com.nr.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.model.dao.InterestDao;
import kh.com.nr.model.dto.InterestDto;

@Service
public class InterestServiceImpl implements InterestService{
	@Autowired
	private InterestDao dao;
	
	@Override
	public boolean setInterest(InterestDto dto) {
		try {
			dao.setInterest(dto);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteInterest(InterestDto dto) {
		try {
			dao.deleteInterest(dto);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public List<InterestDto> getInterest(String userid) {
		return dao.getInterest(userid);
	}
	
	@Override
	public InterestDto chkInterest(InterestDto dto) {
		return dao.chkInterest(dto);
	}
}
