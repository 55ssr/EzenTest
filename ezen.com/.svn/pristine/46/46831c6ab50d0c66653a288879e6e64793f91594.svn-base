package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ezen.service.MemberService;
import ezen.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {

	@Resource(name = "memberDAO")
	private MembmerDAO memberDAO;
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {

		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberIdCheck(MemberVO vo) {
		return memberDAO.selectMemberIdCheck(vo);
	}

	@Override
	public List<?> selectMemberList(SampleDefaultVO searchVO) throws Exception {
		return memberDAO.selectMemberList(searchVO);
	}

	@Override
	public List<?> selectPostList(String dong) throws Exception {
		return memberDAO.selectPostList(dong);
	}

	@Override
	public int selectMemberTotal(SampleDefaultVO searchVO) throws Exception {
		return memberDAO.selectMemberTotal(searchVO);
	}

	@Override
	public int updateMember(MemberVO vo) throws Exception {
		return memberDAO.updateMember(vo);
	}

	@Override
	public int deleteMember(MemberVO vo) throws Exception {
		return memberDAO.deleteMember(vo);
	}

	@Override
	public MemberVO selectMemberDetail(String userid) throws Exception {
		return memberDAO.selectMemberDetail(userid);
	}

	@Override
	public int selectMemberIdPwdCheck(MemberVO vo) {
		return memberDAO.selectMemberIdPwdCheck(vo);
	}
}



