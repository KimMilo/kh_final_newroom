package kh.com.nr.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kh.com.nr.model.dto.CommentDto;
import kh.com.nr.model.dto.NoticeDto;

@Repository
public class NoticeDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int update(NoticeDto dto) {
		return sqlSession.update("notice.update", dto);
	}

	public int delete(int bnum) {
		return sqlSession.delete("notice.delete", bnum);
	}

	public List<NoticeDto> searchTitle(Map<String, Object> page) {
		return sqlSession.selectList("notice.searchTitle", page);
	}

	public List<NoticeDto> searchContent(Map<String, Object> page) {
		return sqlSession.selectList("notice.searchContent", page);
	}

	public List<NoticeDto> searchWriter(Map<String, Object> page) {
		return sqlSession.selectList("notice.searchWriter", page);
	}

	public int selectCommentCount(int bnum) {
		return sqlSession.selectOne("comment.selectCommentCount", bnum);
	}

	public void updateReadcnt(int bnum) {
		sqlSession.update("notice.updateReadcnt", bnum);
	}

	public NoticeDto selectBoard(int bnum) {
		return sqlSession.selectOne("notice.selectBoard", bnum);
	}

	public int write(NoticeDto dto) {
		return sqlSession.insert("notice.write", dto);
	}

	public List<CommentDto> selectCommentList(int bnum) {
		return sqlSession.selectList("comment.selectCommentList", bnum);
	}

	public int insertComment(CommentDto dto) {
		return sqlSession.insert("comment.insertComment", dto);
	}

	public void deleteComment(CommentDto dto) {
		sqlSession.delete("comment.deleteComment", dto);
	}

	public List<NoticeDto> selectPage(Map<String, Integer> page) {
		return sqlSession.selectList("notice.selectPage", page);
	}

	public int selectTotalRowCount() {
		return sqlSession.selectOne("notice.selectTotalRowCount");
	}
	
	public int selectTotalRowCountT(String keyword) {
		return sqlSession.selectOne("notice.selectTotalRowCountT", keyword);
	}
	
	public int selectTotalRowCountC(String keyword) {
		return sqlSession.selectOne("notice.selectTotalRowCountC", keyword);
	}
	
	public int selectTotalRowCountU(String keyword) {
		return sqlSession.selectOne("notice.selectTotalRowCountU", keyword);
	}
	
	
}
