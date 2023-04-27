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
public class SidoGugunCodeDto {

// # SIDOCODE 테이블
//--------- -------- ------------ 
//SIDO_CODE NOT NULL VARCHAR2(1)  
//SIDO_NAME NOT NULL VARCHAR2(20) 

// # GUGUNCODE 테이블
//---------- -------- ------------ 
//GUGUN_CODE NOT NULL VARCHAR2(4)  
//GUGUN_NAME NOT NULL VARCHAR2(20) 


	private String sidoCode;
	private String sidoName;
	private String gugunCode;
	private String gugunName;
}
