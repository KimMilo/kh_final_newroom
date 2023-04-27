package kh.com.nr.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.common.Paging;
import kh.com.nr.model.dao.NoticeDao;
import kh.com.nr.model.dto.CommentDto;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao dao;

	@Override
	public int update(NoticeDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int bnum) {
		return dao.delete(bnum);
	}

	@Override
	public Paging searchTitle(int pageNumber, int pageListLimit, String keyword) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		page.put("keyword", keyword);
		
		List<NoticeDto> data = dao.searchTitle(page);
		System.out.println(data);
		for(NoticeDto dto: data) {
			int cmtCnt = dao.selectCommentCount(dto.getBnum()); // 해당 게시글에 댓글이 몇개 달렸나 조회
			dto.setCmtCnt(cmtCnt); 
		}
		
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
		
		List<NoticeDto> data = dao.searchContent(page);
		for(NoticeDto dto: data) {
			int cmtCnt = dao.selectCommentCount(dto.getBnum()); // 해당 게시글에 댓글이 몇개 달렸나 조회
			dto.setCmtCnt(cmtCnt); 
		}
		
		int totalRowCount = dao.selectTotalRowCountC(keyword); 
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
		
		List<NoticeDto> data = dao.searchWriter(page);
		for(NoticeDto dto: data) {
			int cmtCnt = dao.selectCommentCount(dto.getBnum()); // 해당 게시글에 댓글이 몇개 달렸나 조회
			dto.setCmtCnt(cmtCnt); 
		}
		
		int totalRowCount = dao.selectTotalRowCountU(keyword); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);

		return paging;
	}

	@Override
	public NoticeDto getBoard(int bnum) {
		dao.updateReadcnt(bnum); // 읽기전에 조회수부터 증가 시키고
		return dao.selectBoard(bnum); // 글 꺼내기
	}
	
	@Override
	public int write(NoticeDto dto) {
		return dao.write(dto);
	}

	@Override
	public List<CommentDto> getCommentList(int bnum) { // bnum번 게시글에 달린 댓글 목록 가져오기.
		return dao.selectCommentList(bnum);
	}
	
	@Override
	public boolean writeComment(int bnum, String content, MemberDto loginInfo) {
		CommentDto dto = new CommentDto(bnum, loginInfo.getUserid(), content, null);
		if(dao.insertComment(dto)==1) {
			return true;
		}
		return false;
	}
	
	@Override
	public void deleteComment(CommentDto dto) {
		dao.deleteComment(dto);
	}

	@Override
	public Paging getPage(int pageNumber, int pageListLimit) {
		Map<String, Integer> page = new HashMap<String, Integer>();
		page.put("start", (pageNumber - 1) * pageListLimit + 1);
		page.put("end", pageNumber * pageListLimit);
		
		List<NoticeDto> data = dao.selectPage(page);
		for(NoticeDto dto: data) {
			int cmtCnt = dao.selectCommentCount(dto.getBnum()); // 해당 게시글에 댓글이 몇개 달렸나 조회
			dto.setCmtCnt(cmtCnt); 
		}
		
		int totalRowCount = dao.selectTotalRowCount(); 
		int mod = totalRowCount % pageListLimit == 0 ? 0 : 1;
		int pageCount = (totalRowCount / pageListLimit) + mod;
		
		Paging paging = new Paging(data, pageNumber, pageCount, pageListLimit, 5);

		return paging;
	}
}
