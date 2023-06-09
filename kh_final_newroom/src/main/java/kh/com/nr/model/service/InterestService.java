package kh.com.nr.model.service;

import java.util.List;

import kh.com.nr.model.dto.InterestDto;

public interface InterestService {
	boolean setInterest(InterestDto dto); //찜하기 등록
	boolean deleteInterest(InterestDto dto); // 찜하기 삭제
	List<InterestDto> getInterest(String userid); //찜하기 리스트 가져오기
	public InterestDto chkInterest(InterestDto dto);
}
