package ezen.service.impl;

import java.beans.Statement;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.RshVO;

@Repository("rshDAO")
public class RshDAO extends EgovAbstractDAO{

	public String insertRshWriteSave(RshVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("rshDAO.insertRshWriteSave",vo);
	}

	public List<?> selectRshList(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return list("rshDAO.selectRshList",searchVO);
	}

	public int selectRshTotal(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return (int) select("rshDAO.selectRshTotal",searchVO);
	}

	public String insertRshSub(RshVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("rshDAO.insertRshSub",vo);
	}

	public List<?> selectVoteRsh(String mcd) {
		// TODO Auto-generated method stub
		return list("rshDAO.selectVoteRsh",mcd);
	}

	public List<?> selectRshMainList(RshVO vo) {
		// TODO Auto-generated method stub
		return list("rshDAO.selectRshMainList",vo);
	}

	public RshVO selectRshTitle(RshVO vo) {
		// TODO Auto-generated method stub
		return (RshVO) select("rshDAO.selectRshTitle",vo);
	}

	public String insertRshVoteSave(RshVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("rshDAO.insertRshVoteSave",vo);
	}

	public List<?> selectVoteResult(RshVO vo) {
		// TODO Auto-generated method stub
		return list("rshDAO.selectVoteResult",vo);
	}

	public List<?> selectRshGrp(RshVO vo) {
		// TODO Auto-generated method stub
		return list("rshDAO.selectRshGrp",vo);
	}

	public RshVO selectRshDetail(RshVO vo) {
		// TODO Auto-generated method stub
		return (RshVO) select("rshDAO.selectRshDetail",vo);
	}
	

}
