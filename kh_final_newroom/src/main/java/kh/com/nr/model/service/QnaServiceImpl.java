package kh.com.nr.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.common.Paging;
import kh.com.nr.model.dao.QnaDao;
import kh.com.nr.model.dto.NoticeDto;
import kh.com.nr.model.dto.QnaDto;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDao dao;

	@Override
	public List<QnaDto> searchTitle(String keyword) {
		return dao.searchTitle(keyword);
	}

	@Override
	public List<QnaDto> searchContent(String keyword) {
		return dao.searchContent(keyword);
	}

	@Override
	public List<QnaDto> searchWriter(String keyword) {
		return dao.searchWriter(keyword);
	}

	@Override
	public int delete(int bnum) {
		return dao.delete(bnum);
	}

	@Override
	public QnaDto getBoard(int bnum) { //질문 상세보기
		dao.updateReadcnt(bnum); // 읽기전에 조회수부터 증가 시키고
		return dao.getBoard(bnum);
	}

	@Override
	public int update(QnaDto dto) {
		return dao.update(dto);
	}

	@Override
	public int write(QnaDto dto) {
		return dao.write(dto);
	}

	@Override
	public int ansWrite(QnaDto dto) { //답변 작성 
		return dao.ansWrite(dto);
	}

	@Override
	public int ansUpdate(QnaDto dto) { //답변 수정
		return dao.ansUpdate(dto);
	}

	@Override
	public int ansDelete(int bnum) { //답변 삭제
		return dao.ansDelete(bnum);
	}

	@Override
	public List<QnaDto> getAnsList(int questionnum) { //답변 목록
		return dao.getAnsList(questionnum);
	}

	@Override
	public List<QnaDto> getFAQList() { //FAQ 목록
		return dao.getFAQList();

	}

	@Override
	public Paging getPage(int pageNumber, int pageListLimit, String keyword) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		page.put("keyword", keyword)
		
		List<NoticeDto> data = dao.selectPage(page);
		
		int totalRowCount = dao.selectTotalRowCount(keyword); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);

		return paging;
	}
	
	
}
