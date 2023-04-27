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
public class HospitalDto {

// # HOSPITAL 테이블
//------------- -------- ------------- 
//NO            NOT NULL NUMBER        
//CITY          NOT NULL VARCHAR2(20)  
//GUGUN         NOT NULL VARCHAR2(20)  
//DONG          NOT NULL VARCHAR2(20)  
//HOSPITALNAME  NOT NULL VARCHAR2(30)  
//ADDRESS       NOT NULL VARCHAR2(200) 
//DIAGNOSISTYPE NOT NULL VARCHAR2(200) 
//PHONE                  VARCHAR2(30)  
	
	private int no;
	private String city; // 도시
	private String gugun; // 구군
	private String hospitalName; // 병원 이름
	private String address; // 주소
	private String diagnosisType; // 진단 타입
	private String phone; // 전화번호

}
