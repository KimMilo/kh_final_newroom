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
public class CommentDto {
	private int cnum;	// 코멘트 식별번호
	private int bnum; 	// 게시글 번호
	private String cwriter;	// 코멘트 작성자
	private String ccontent; // 코멘트 내용
	private String cwriteDate; // 작성일시

	public CommentDto(int bnum, String cwriter, String ccontent, String cwriteDate) {
		this.bnum = bnum;
		this.cwriter = cwriter;
		this.ccontent = ccontent;
		this.cwriteDate = cwriteDate;
	}
}
