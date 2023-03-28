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
public class QnaDto {
	private int bnum; //글번호
	private String btitle; //글제목
	private String userid; //작성자
	private int breadcnt; //조회수
	private String bwritedate; //작성날짜
	private String bcontent; //글내용
	private int questionnum;
	//private boolean isFAQ; //자주 묻는 질문(공지)인지
}
