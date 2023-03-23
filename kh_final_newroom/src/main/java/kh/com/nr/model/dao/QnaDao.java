package kh.com.nr.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.nr.model.dto.QnaDto;

@Repository
public class QnaDao {

	@Autowired
	private SqlSession sqlSession;

	public List<QnaDto> searchTitle(String keyword) {
		return sqlSession.selectList("qna.searchTitle", keyword);
	}

	public List<QnaDto> searchContent(String keyword) {
		return sqlSession.selectList("qna.searchContent", keyword);
	}

	public List<QnaDto> searchWriter(String keyword) {
		return sqlSession.selectList("qna.searchWriter", keyword);
	}

	public List<QnaDto> getBoardList() {
		return sqlSession.selectList("qna.getBoardList");
	}

	public int delete(int bnum) {
		return sqlSession.delete("qna.delete", bnum);
	}

	public void updateReadcnt(int bnum) {
		sqlSession.update("qna.updateReadcnt", bnum);
	}

	public QnaDto getBoard(int bnum) {
		return sqlSession.selectOne("qna.getBoard", bnum);
	}

	public int update(QnaDto dto) {
		return sqlSession.update("qna.update", dto);
	}

	public int write(QnaDto dto) {
		return sqlSession.insert("qna.write", dto);
	}

	public int ansWrite(QnaDto dto) {
		return sqlSession.insert("qna.ansWrite", dto);
	}

	public int ansUpdate(QnaDto dto) {
		return sqlSession.update("qna.ansUpdate", dto);
	}

	public int ansDelete(int bnum) {
		return sqlSession.delete("qna.ansDelete", bnum);
	}

	public List<QnaDto> getAnsList(int questionnum) {
		return sqlSession.selectList("qna.getAnsList", questionnum);
	}

	public List<QnaDto> getFAQList() {
		return sqlSession.selectList("qna.getFAQList");
	}
	
	
}
