package ezen.service;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;

public interface DataBoardAService {
	
	String insertDataBoard(DataBoardAVO vo) throws Exception;
	
	List<?> selectDataBoard(SampleDefaultVO searchVO) throws Exception;

	int selectBoardATotal(SampleDefaultVO searchVO);
	
	DataBoardAVO selectDataBoardDetail(DataBoardAVO vo) throws Exception;
	
	int updateDataBoardHitUp(int unq) throws Exception;
	
	int selectDataPwdChk(DataBoardAVO vo) throws Exception;
	
	int selectDataFileChk(DataBoardAVO vo) throws Exception;
	
	int updateDataBoard(DataBoardAVO vo) throws Exception;
	
	int deleteDataBoard(DataBoardAVO vo) throws Exception;
	
	int deleteOnlyFile(DataBoardAVO vo) throws Exception;
	
}
