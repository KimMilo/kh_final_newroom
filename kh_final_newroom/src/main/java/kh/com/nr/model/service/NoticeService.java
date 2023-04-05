package kh.com.nr.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.com.nr.common.Paging;
import kh.com.nr.model.dto.CommentDto;
import kh.com.nr.model.dto.MemberDto;
import kh.com.nr.model.dto.NoticeDto;
import kh.com.nr.model.dto.NoticePageDto;

@Service
public interface NoticeService {
	public int update(NoticeDto board); //공지 수정
	public int delete(int bnum); //공지 삭제
	public Paging searchTitle(int pageNumber, int pageListLimit, String keyword); //제목으로 검색
	public Paging searchContent(int pageNumber, int pageListLimit, String keyword); //내용으로 검색
	public Paging searchWriter(int pageNumber, int pageListLimit, String keyword); //글쓴이로 검색
	public NoticeDto getBoard(int bnum);//상세페이지 가져오기
	public int write(NoticeDto dto); //글쓰기
	public List<CommentDto> getCommentList(int bnum); //댓글 전체 목록
	boolean writeComment(int bnum, String content, MemberDto loginInfo); //댓글 작성
	void deleteComment(CommentDto dto);
	public Paging getPage(int pageNumber, int pageListLimit);//페이징처리 및 목록 조회
}
