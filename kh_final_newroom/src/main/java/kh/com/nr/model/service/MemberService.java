package kh.com.nr.model.service;



import org.springframework.stereotype.Service;

import kh.com.nr.common.Paging;
import kh.com.nr.model.dto.MemberDto;

@Service
public interface MemberService {
	public boolean idCheck(String userid); // id 중복체크
	public MemberDto loginCheck(MemberDto data); //로그인 체크
	public int join(MemberDto member); //회원가입
	public int update(MemberDto member); //회원정보 수정
	public int updateById(MemberDto member); //아이디로 회원정보 수정
	public int delete(String userid); //회원정보 삭제
	public MemberDto findPw(MemberDto data); //비밀번호 찾기
	public MemberDto findId(MemberDto data); //ID 찾기
	public int modifyRole(MemberDto dto); //회원 관리자 정보 수정

	public Paging getPage(int pageNumber, int pageListLimit, String name);//회원조회
	public MemberDto getOne(String name);
}
