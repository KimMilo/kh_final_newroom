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

// # QNA 테이블
//----------- -------- -------------- 
//BNUM        NOT NULL NUMBER         
//BTITLE      NOT NULL VARCHAR2(100)  
//USERID      NOT NULL VARCHAR2(20)   
//BREADCNT             NUMBER         
//BWRITEDATE           TIMESTAMP(6)   
//BCONTENT    NOT NULL VARCHAR2(2000) 
//BLEVEL      NOT NULL NUMBER         
//QUESTIONNUM          NUMBER         
//ISFAQ                CHAR(1)        

	
	private int bnum; //글번호
	private String btitle; //글제목
	private String userid; //작성자
	private int breadcnt; //조회수
	private String bwritedate; //작성날짜
	private String bcontent; //글내용
	private int blevel;
	private int questionnum;
	private String isFAQ; //자주 묻는 질문(공지)인지
}
