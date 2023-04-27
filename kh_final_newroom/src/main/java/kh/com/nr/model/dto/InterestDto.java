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
public class InterestDto {

// # INTEREST 테이블
//------ -------- ------------ 
//USERID NOT NULL VARCHAR2(20) 
//DEALID NOT NULL NUMBER    
	
	
	private String userid; //사용자 아이디
	private int dealId; //매물번호
	
	private String area; //면적
	private String floor; //층
	private String dealAmount; //거래금액
	private String aptName; //아파트이름
	private String img; //이미지
	
	public InterestDto(String userid, int dealId) {
		this.userid = userid;
		this.dealId = dealId;
	}
}
