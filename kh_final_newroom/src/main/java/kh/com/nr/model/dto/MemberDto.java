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
public class MemberDto {
 
// # USERINFO 테이블
//--------- -------- ------------- 
//NO        NOT NULL NUMBER        
//USERID    NOT NULL VARCHAR2(20)  
//USERPW    NOT NULL VARCHAR2(150) 
//USERNAME  NOT NULL VARCHAR2(15)  
//USEREMAIL NOT NULL VARCHAR2(30)  
//USERPHONE NOT NULL VARCHAR2(30)  
//MROLE              VARCHAR2(20)  
//ENABLED            NUMBER        
//IMG       NOT NULL VARCHAR2(100) 
	
	private int no;
	private String userid;
	private String userpw;
	private String username;
	private String useremail;
	private String userphone;
	private String mrole; //회원0 관리자1
	private String img; //프로필이미지
}
