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

	public List<NoticeDto> searchTitle(String title) {
		return sqlSession.selectList("notice.searchTitle", title);
	}

	public int selectTotalCount() {
		return sqlSession.selectOne("notice.selectTotalCount");
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

	public List<NoticeDto> searchContent(String keyword) {
		return sqlSession.selectList("notice.searchContent", keyword);
	}

	public List<NoticeDto> searchWriter(String keyword) {
		return sqlSession.selectList("notice.searchWriter", keyword);
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
	
}
