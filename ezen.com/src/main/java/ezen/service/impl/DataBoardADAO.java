package ezen.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.DataBoardAVO;

@Repository("dataBoardADAO")
public class DataBoardADAO extends EgovAbstractDAO {

	public String insertDataBoard(DataBoardAVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("dataBoardADAO.insertDataBoard",vo);
	}

	public List<?> selectDataBoard(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return list("dataBoardADAO.selectDataBoard",searchVO);
	}

	public int selectBoardATotal(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return (int) select("dataBoardADAO.selectBoardATotal",searchVO);
	}

	public DataBoardAVO selectDataBoardDetail(DataBoardAVO vo) {
		// TODO Auto-generated method stub
		return (DataBoardAVO) select("dataBoardADAO.selectDataBoardDetail",vo);
	}

	public int updateDataBoardHitUp(int unq) {
		// TODO Auto-generated method stub
		return (int) update("dataBoardADAO.updateDataBoardHitUp",unq);
	}

	public int selectDataPwdChk(DataBoardAVO vo) {
		// TODO Auto-generated method stub
		return (int) select("dataBoardADAO.selectDataPwdChk",vo);
	}


	public int deleteDataBoard(DataBoardAVO vo) {
		// TODO Auto-generated method stub
		return (int) delete("dataBoardADAO.deleteDataBoard",vo);
	}

	public int deleteOnlyFile(DataBoardAVO vo) {
		// TODO Auto-generated method stub
		return (int) update("dataBoardADAO.deleteOnlyFile",vo);
	}

	public int updateDataBoard(DataBoardAVO vo) {
		// TODO Auto-generated method stub
		return (int) update("dataBoardADAO.updateDataBoard",vo);
	}

	public int selectDataFileChk(DataBoardAVO vo) {
		// TODO Auto-generated method stub
		return (int) select("dataBoardADAO.selectDataFileChk",vo);
	}

}
