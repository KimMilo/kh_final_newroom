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
	public Paging searchTitle(int pageNumber, int pageListLimit, String keyword) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		page.put("keyword", keyword);
		
		List<QnaDto> data = dao.searchTitle(page);
		
		int totalRowCount = dao.selectTotalRowCountT(keyword); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);

		return paging;
	}

	@Override
	public Paging searchContent(int pageNumber, int pageListLimit, String keyword) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		page.put("keyword", keyword);
		
		List<QnaDto> data = dao.searchContent(page);
		
		int totalRowCount = dao.selectTotalRowCountT(keyword); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);

		return paging;
	}

	@Override
	public Paging searchWriter(int pageNumber, int pageListLimit, String keyword) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		page.put("keyword", keyword);
		
		List<QnaDto> data = dao.searchWriter(page);
		
		int totalRowCount = dao.selectTotalRowCountT(keyword); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);
		return paging;
	}
	
	@Override
	public Paging searchFAQ(int pageNumber, int pageListLimit) {
		Map<String, Integer> page = new HashMap<String, Integer>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		
		List<QnaDto> data = dao.searchFAQ(page);
		
		int totalRowCount = dao.selectTotalRowCountF(); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);
		return paging;
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
	public Paging getPage(int pageNumber, int pageListLimit) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		
		List<NoticeDto> data = dao.selectPage(page);
		
		int totalRowCount = dao.selectTotalRowCount(); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);

		return paging;
	}

	@Override
	public List<QnaDto> getFAQList() {
		return dao.getFAQList();
	}

	
	
}
