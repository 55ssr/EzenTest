package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ezen.service.RshService;
import ezen.service.RshVO;

@Service("rshService")
public class RshServiceImpl extends EgovAbstractServiceImpl implements RshService {

	@Resource(name="rshDAO")
	private RshDAO rshDAO; 
	@Override
	public String insertRshWriteSave(RshVO vo) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.insertRshWriteSave(vo);
	}
	@Override
	public List<?> selectRshList(SampleDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.selectRshList(searchVO);
	}
	@Override
	public int selectRshTotal(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return rshDAO.selectRshTotal(searchVO);
	}
	@Override
	public String insertRshSub(RshVO vo) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.insertRshSub(vo);
	}
	@Override
	public List<?> selectVoteRsh(String mcd) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.selectVoteRsh(mcd);
	}
	@Override
	public List<?> selectRshMainList(RshVO vo) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.selectRshMainList(vo);
	}
	@Override
	public RshVO selectRshTitle(RshVO vo) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.selectRshTitle(vo);
	}
	@Override
	public String insertRshVoteSave(RshVO vo) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.insertRshVoteSave(vo);
	}
	@Override
	public List<?> selectVoteResult(RshVO vo) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.selectVoteResult(vo);
	}
	@Override
	public List<?> selectRshGrp(RshVO vo) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.selectRshGrp(vo);
	}
	@Override
	public RshVO selectRshDetail(RshVO vo) throws Exception {
		// TODO Auto-generated method stub
		return rshDAO.selectRshDetail(vo);
	}

}
