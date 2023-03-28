package kh.com.nr.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NoticeDto {
	private int bnum; //글번호
	private String btitle; //제목
	private String userid; //작성자
	private int breadcnt; //조회수
	private String bwritedate; //작성 날짜
	private String bcontent; //내용
	private int cmtCnt; // 댓글 갯수
}
