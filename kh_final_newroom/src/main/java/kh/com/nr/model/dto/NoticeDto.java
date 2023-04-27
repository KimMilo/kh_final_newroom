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

// # NOTICE 테이블
//---------- -------- -------------- 
//BNUM       NOT NULL NUMBER         
//BTITLE              VARCHAR2(100)  
//USERID     NOT NULL VARCHAR2(20)   
//BREADCNT            NUMBER         
//BWRITEDATE          TIMESTAMP(6)   
//BCONTENT   NOT NULL VARCHAR2(2000) 
//CMTCNT              NUMBER  
	
	private int bnum; //글번호
	private String btitle; //제목
	private String userid; //작성자
	private int breadcnt; //조회수
	private String bwritedate; //작성 날짜
	private String bcontent; //내용
	private int cmtCnt; // 댓글 갯수
}
