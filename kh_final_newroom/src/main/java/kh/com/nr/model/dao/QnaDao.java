package kh.com.nr.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.nr.model.dto.NoticeDto;
import kh.com.nr.model.dto.QnaDto;

@Repository
public class QnaDao {

	@Autowired
	private SqlSession sqlSession;

	public List<QnaDto> searchTitle(Map<String, Object> page) {
		return sqlSession.selectList("qna.searchTitle", page);
	}

	public List<QnaDto> searchContent(Map<String, Object> page) {
		return sqlSession.selectList("qna.searchContent", page);
	}

	public List<QnaDto> searchWriter(Map<String, Object> page) {
		return sqlSession.selectList("qna.searchWriter", page);
	}
	
	public List<QnaDto> searchFAQ(Map<String, Integer> page) {
		return sqlSession.selectList("qna.searchFAQ", page);
	}

	public int delete(int bnum) {
		return sqlSession.delete("qna.delete", bnum);
	}

	public void updateReadcnt(int bnum) {
		sqlSession.update("qna.updateReadcnt", bnum);
	}

	public QnaDto getBoard(int bnum) {
		return  sqlSession.selectOne("qna.getBoard", bnum);
		
	}

	public int update(QnaDto dto) {
		return sqlSession.update("qna.update", dto);
	}

	public int write(QnaDto dto) {
		return sqlSession.insert("qna.write", dto);
	}

	public List<QnaDto> getFAQList() {
		return sqlSession.selectList("qna.getFAQList");
	}

	public List<NoticeDto> selectPage(Map<String, Object> page) {
		return sqlSession.selectList("qna.selectPage", page);
	}

	public int selectTotalRowCount() {
		return sqlSession.selectOne("qna.selectTotalRowCount");
	}
	
	public int selectTotalRowCountT(String keyword) {
		return sqlSession.selectOne("qna.selectTotalRowCountT", keyword);
	}
	
	public int selectTotalRowCountC(String keyword) {
		return sqlSession.selectOne("qna.selectTotalRowCountC", keyword);
	}
	
	public int selectTotalRowCountU(String keyword) {
		return sqlSession.selectOne("qna.selectTotalRowCountU", keyword);
	}

	public int selectTotalRowCountF() {
		return sqlSession.selectOne("qna.selectTotalRowCountF");
	}
	
	
}
