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
public class HouseDealDto {

// # HOUSEDEAL 테이블
//---------- -------- ------------- 
//DEALID     NOT NULL NUMBER        
//NO         NOT NULL NUMBER        
//DEALAMOUNT NOT NULL VARCHAR2(20)  
//DEALYEAR   NOT NULL VARCHAR2(10)  
//DEALMONTH  NOT NULL VARCHAR2(5)   
//DEALDAY    NOT NULL VARCHAR2(10)  
//AREA       NOT NULL VARCHAR2(20)  
//FLOOR      NOT NULL VARCHAR2(10)  
//DTYPE      NOT NULL VARCHAR2(20)  
//RENTMONEY           VARCHAR2(20)  
//SCATCHIMG  NOT NULL VARCHAR2(100)
	
	private int no;
	private int dealId; // 거래 정보순번
	private String dealAmount; // 가격
	private String dealYear; // 거래 년도
	private String dealMonth; // 거래 월
	private String dealDay; // 거래 일
	private String area; // 면적
	private String floor; // 층
	private String dtype; // 매매, 전월세
	private String rentMoney; // 전월세
	private String scatchImg; // 도면이미지 경로
	
	private String dong; // 동
	private String aptName; // 아파트 이름
	private String jibun; // 지번
	private String lat; // 위도
	private String lng; // 경도
	private String img; //집이미지 경로
	
	
	private String city;
	private String gugun;

}
