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
	private int hnum;
	private String city; // 도시
	private String gugun; // 구군
	private String hospitalName; // 병원 이름
	private String address; // 주소
	private String diagnosisType; // 진단 타입
	private String phone; // 전화번호

}