package ezen.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.BoardAVO;
import oracle.net.aso.b;

@Repository("boardADAO")
public class BoardADAO extends EgovAbstractDAO{

	public String insertBoardA(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (String) insert("boardADAO.insertBoardA",boardAVO);
	}
	
	public String insertCommBoardA(BoardAVO boardAVO) {
		// TODO Auto-generated method stub

		System.out.println("=====DAO COMM====" + boardAVO.getComm());
		System.out.println("=====DAO UNQ====" + boardAVO.getUnq());
		System.out.println("=====DAO PWD====" + boardAVO.getPwd());
		System.out.println("=====DAO FID====" + boardAVO.getFid());
		System.out.println("=====DAO WRITER====" + boardAVO.getWriter());
		
		return (String) insert("boardADAO.insertCommBoardA",boardAVO);
	}


	public List<?> selectBoardAList(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return list("boardADAO.selectBoardAList",searchVO);
	}

	public int selectBoardATotal(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return (int) select("boardADAO.selectBoardATotal",searchVO);
	}

	public BoardAVO selectBoardADetail(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (BoardAVO) select("boardADAO.selectBoardADetail",boardAVO);
	}


	public List<?> selectBoardACommList(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return list("boardADAO.selectBoardACommList",boardAVO);
	}

	public int updateBoardA(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (int) update("boardADAO.updateBoardA", boardAVO);
	}

	public BoardAVO selectBoardADetail2(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (BoardAVO) select("boardADAO.selectBoardADetail2",boardAVO);
	}

	public int deleteBoardA(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (int) delete("boardADAO.deleteBoardA",boardAVO);
	}

	public int updateBoardAHit(int unq) {
		// TODO Auto-generated method stub
		return (int) update("boardADAO.updateBoardAHit",unq);
	}

	public int selectPwdCheck(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (int) select("boardADAO.selectPwdCheck",boardAVO);
	}

	public BoardAVO selectCommBoardADetail2(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (BoardAVO) select("boardADAO.selectCommBoardADetail2",boardAVO);
	}

	public int updateCommBoardA(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (int) update("boardADAO.updateCommBoardA",boardAVO);
	}

	public int deleteCommBoardA(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (int) delete("boardADAO.deleteCommBoardA",boardAVO);
	}

	public int selectCommPwdCheck(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (int) select("boardADAO.selectCommPwdCheck",boardAVO);
	}

	public BoardAVO selectboardADetailPwdChk(BoardAVO boardAVO) {
		// TODO Auto-generated method stub
		return (BoardAVO) select("boardADAO.selectboardADetailPwdChk",boardAVO);
	}

	
}
