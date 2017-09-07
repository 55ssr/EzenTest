package ezen.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.MemberVO;

@Repository("memberDAO")
public class MembmerDAO extends EgovAbstractDAO {

	public String insertMember(MemberVO vo) {

		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberIdCheck(MemberVO vo) {
		return (int) select("memberDAO.selectMemberIdCheck",vo);
	}

	public List<?> selectMemberList(SampleDefaultVO searchVO) {
		return list("memberDAO.selectMemberList",searchVO);
	}

	public List<?> selectPostList(String dong) {
		return list("memberDAO.selectPostList",dong);
	}

	public int selectMemberTotal(SampleDefaultVO searchVO) {
		return (int) select("memberDAO.selectMemberTotal",searchVO);
	}

	public int updateMember(MemberVO vo) {
		return (int) update("memberDAO.updateMember",vo);
	}

	public int deleteMember(MemberVO vo) {
		return (int) delete("memberDAO.deleteMember",vo);
	}

	public MemberVO selectMemberDetail(String userid) {
		return (MemberVO) select("memberDAO.selectMemberDetail",userid);
	}

	public int selectMemberIdPwdCheck(MemberVO vo) {
		return (int) select("memberDAO.selectMemberIdPwdCheck",vo);
	}
}
