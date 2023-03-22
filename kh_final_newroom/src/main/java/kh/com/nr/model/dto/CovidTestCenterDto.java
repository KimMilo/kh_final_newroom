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
public class CovidTestCenterDto {
	private int no;
	private String validDate; // 유효 날짜
	private String city; // 도시
	private String gugun; // 구군
	private String hospitalName; // 병원 이름
	private String address; // 주소
	private String phone; // 전화번호
	private String weekTime; // 주중 운영 시간
	private String saturdayTime; // 토요일 운영 시간
	private String holidayTime; // 주말 운영 시간

}
