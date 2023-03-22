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
	private String userid;
	private String userpw;
	private String username;
	private String useremail;
	private String userphone;
	private int role; //회원0 관리자1
	private String img; //프로필이미지
}
