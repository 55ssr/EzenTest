package ezen.service;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;

public interface BoardService {

	String insertBoard(BoardVO vo) throws Exception;
	List<?> selectBoardList(SampleDefaultVO searchVO) throws Exception;
	BoardVO selectBoardDetail(BoardVO vo) throws Exception;
	int updateBoardHit(int unq) throws Exception; 
	
	int selectBoardPwdCheck(BoardVO vo) throws Exception;
	int updateBoard(BoardVO vo) throws Exception;
	
	String selectBoardMaxThread(BoardVO vo) throws Exception;
	
	String insertBoardReply(BoardVO vo) throws Exception;
	
	int selectBoardReCnt(BoardVO vo) throws Exception;
	int updateBoardSpace(BoardVO vo) throws Exception;
	int deleteBoard(BoardVO vo) throws Exception;
	
	int selectBoardTotal(SampleDefaultVO searchVO) throws Exception;

}








