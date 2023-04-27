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
public class ChatDto {

// # CHAT 테이블
//----------- -------- -------------- 
//CHATID      NOT NULL NUMBER         
//FROMID      NOT NULL VARCHAR2(20)   
//TOID        NOT NULL VARCHAR2(20)   
//CHATCONTENT NOT NULL VARCHAR2(2000) 
//CHATTIME             TIMESTAMP(6)  
	
	private int chatID; //채팅번호
	private String fromID; //나
	private String toID; //상대방
	private String chatContent; //채팅 내용
	private String chatTime; //전송 시간
	
	private String img;

}
