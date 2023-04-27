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
public class RoomDto {

// # CHAT_ROOM 테이블
//------ -------- ------------ 
//ROOMID NOT NULL NUMBER       
//USERID          VARCHAR2(20) 

	
	private int roomID; //방번호
	private String userID; //이 채팅방에서 대화하는 사용자 아이디
	
}
