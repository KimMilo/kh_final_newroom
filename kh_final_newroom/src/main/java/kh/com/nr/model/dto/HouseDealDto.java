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
	int dealId; // 거래 정보 아이디
	//int hdnum; // 주택 정보 아이디
	int no;
	String dong; // 동
	String aptName; // 아파트 이름
	String jibun; // 지번
	String lat; // 위도
	String lng; // 경도
	String dealAmount; // 가격
	String dealYear; // 거래 년도
	String dealMonth; // 거래 월
	String dealDay; // 거래 일
	String area; // 면적
	String floor; // 층
	String dtype; // 매매, 전월세
	String rentMoney; // 전월세
	String img; // 이미지 경로

}
