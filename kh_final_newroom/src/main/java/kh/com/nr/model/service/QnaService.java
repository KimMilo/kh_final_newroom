package kh.com.nr.model.service;

import java.util.List;

import kh.com.nr.common.Paging;
import kh.com.nr.model.dto.QnaDto;

public interface QnaService {

	//질문 검색
	public Paging searchTitle(int pageNumber, int pageListLimit, String keyword);
	public Paging searchContent(int pageNumber, int pageListLimit, String keyword);
	public Paging searchWriter(int pageNumber, int pageListLimit, String keyword);
	public Paging searchFAQ(int pageNumber, int pageListLimit);
	public int delete(int bnum); //질문 삭제
	public QnaDto getBoard(int bnum); //질문 상세
	public int update(QnaDto dto); //질문 수정
	public int write(QnaDto dto); //질문 작성

	public Paging getPage(int pageNumber, int pageListLimit);
	
}
