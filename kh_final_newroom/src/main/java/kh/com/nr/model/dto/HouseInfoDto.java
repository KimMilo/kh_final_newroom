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
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class HouseInfoDto {

// # HOUSEINFO 테이블
//--------- -------- ------------- 
//NO        NOT NULL NUMBER        
//DONG      NOT NULL VARCHAR2(20)  
//APTNAME   NOT NULL VARCHAR2(50)  
//CODE      NOT NULL VARCHAR2(4)   
//BUILDYEAR NOT NULL VARCHAR2(20)  
//JIBUN     NOT NULL VARCHAR2(30)  
//LAT       NOT NULL VARCHAR2(30)  
//LNG       NOT NULL VARCHAR2(30)  
//IMG       NOT NULL VARCHAR2(100) 
	
	private int no;
	private String dong;
	private String aptName;
	private String code;
	private String buildYear;
	private String jibun;
	private String lat;
	private String lng;
	private String img;

}
