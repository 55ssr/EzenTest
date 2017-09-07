package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.impl.EmpDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ezen.service.BoardService;
import ezen.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		return boardDAO.insertBoard(vo);
	}

	@Override
	public List<?> selectBoardList(SampleDefaultVO searchVO) throws Exception {
		return boardDAO.selectBoardList(searchVO);
	}

	@Override
	public BoardVO selectBoardDetail(BoardVO vo) throws Exception {
		return boardDAO.selectBoardDetail(vo);
	}

	@Override
	public int updateBoardHit(int unq) throws Exception {
		return boardDAO.updateBoardHit(unq);
	}

	@Override
	public int selectBoardPwdCheck(BoardVO vo) throws Exception {
		return boardDAO.selectBoardPwdCheck(vo);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {
		return boardDAO.updateBoard(vo);
	}

	@Override
	public String selectBoardMaxThread(BoardVO vo) throws Exception {
		return boardDAO.selectBoardMaxThread(vo);
	}

	@Override
	public String insertBoardReply(BoardVO vo) throws Exception {
		return boardDAO.insertBoardReply(vo);
	}

	@Override
	public int selectBoardReCnt(BoardVO vo) throws Exception {
		return boardDAO.selectBoardReCnt(vo);
	}

	@Override
	public int updateBoardSpace(BoardVO vo) throws Exception {
		return boardDAO.updateBoardSpace(vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) throws Exception {
		return boardDAO.deleteBoard(vo);
	}

	@Override
	public int selectBoardTotal(SampleDefaultVO searchVO) throws Exception {
		return boardDAO.selectBoardTotal(searchVO);
	}

}



