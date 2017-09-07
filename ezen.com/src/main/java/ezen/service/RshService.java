package ezen.service;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;

public interface RshService {
	
	String insertRshWriteSave(RshVO vo)throws Exception;
	List<?> selectRshList(SampleDefaultVO searchVO)throws Exception;
	int selectRshTotal(SampleDefaultVO searchVO);
	
	String insertRshSub(RshVO vo)throws Exception;
	RshVO selectRshTitle(RshVO vo)throws Exception;
	RshVO selectRshDetail(RshVO vo)throws Exception;
	
	List<?> selectVoteRsh(String mcd) throws Exception;
	List<?> selectRshMainList(RshVO vo)throws Exception;
	


	String insertRshVoteSave(RshVO vo) throws Exception;
	List<?> selectVoteResult(RshVO vo) throws Exception;
	
	
	List<?> selectRshGrp(RshVO vo) throws Exception;
	
	
}
