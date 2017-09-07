package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.BoardAVO;
import ezen.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	public String insertBoard(BoardVO vo) {
		return (String) insert("boardDAO.insertBoard",vo);
	}

	public List<?> selectBoardList(SampleDefaultVO searchVO) {
		return list("boardDAO.selectBoardList",searchVO);
	}

	public BoardVO selectBoardDetail(BoardVO vo) {
		return (BoardVO) select("boardDAO.selectBoardDetail",vo);
	}

	public int updateBoardHit(int unq) {
		return update("boardDAO.updateBoardHit",unq);
	}

	public int selectBoardPwdCheck(BoardVO vo) {
		return (int) select("boardDAO.selectBoardPwdCheck",vo);
	}

	public int updateBoard(BoardVO vo) {
		return update("boardDAO.updateBoard",vo);
	}

	public String selectBoardMaxThread(BoardVO vo) {
		return (String) select("boardDAO.selectBoardMaxThread",vo);
	}

	public String insertBoardReply(BoardVO vo) {
		return (String) insert("boardDAO.insertBoardReply",vo);
	}

	public int selectBoardReCnt(BoardVO vo) {
		return (int) select("boardDAO.selectBoardReCnt",vo);
	}

	public int updateBoardSpace(BoardVO vo) {
		return  update("boardDAO.updateBoardSpace",vo);
	}

	public int deleteBoard(BoardVO vo) {
		return delete("boardDAO.deleteBoard",vo);
	}

	public int selectBoardTotal(SampleDefaultVO searchVO) {
		return (int) select("boardDAO.selectBoardTotal",searchVO);
	}

	
}


