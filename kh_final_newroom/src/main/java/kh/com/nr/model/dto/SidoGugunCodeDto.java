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

	private String sidoCode;
	private String sidoName;
	private String gugunCode;
	private String gugunName;
}
