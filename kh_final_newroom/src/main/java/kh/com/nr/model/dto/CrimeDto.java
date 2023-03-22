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
public class CrimeDto {
	private String gu; //구
	private int crime_rate; //범죄율
	private int murder; //살인
	private int robbery; //강도
	private int harassment; //추행
	private int theft; //절도
	private int violence; //폭력
	private int safety_level; //치안안전등급
}
