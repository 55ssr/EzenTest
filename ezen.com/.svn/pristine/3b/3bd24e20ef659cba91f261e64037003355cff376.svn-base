package ezen.service;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;

public interface MemberService {
	
	String insertMember(MemberVO vo) throws Exception;
	int    updateMember(MemberVO vo) throws Exception;
	int    deleteMember(MemberVO vo) throws Exception;
	
	int    selectMemberIdCheck(MemberVO vo) throws Exception;
	int    selectMemberTotal(SampleDefaultVO searchVO) throws Exception;
	
	MemberVO selectMemberDetail(String userid) throws Exception;
	
	List<?> selectMemberList(SampleDefaultVO searchVO) throws Exception;
	List<?> selectPostList(String dong) throws Exception;
	int selectMemberIdPwdCheck(MemberVO vo);

	

}
