package kh.com.nr.model.dto;

import java.util.List;

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
public class NoticePageDto {
	private List<NoticeDto> noticeList;
	private int curPage;
	private int startPage;
	private int endPage;
	private int totalPage;
}
