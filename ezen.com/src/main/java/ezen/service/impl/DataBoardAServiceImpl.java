package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ezen.service.DataBoardAService;
import ezen.service.DataBoardAVO;
@Service("dataBoardAService")
public class DataBoardAServiceImpl extends EgovAbstractServiceImpl implements DataBoardAService {
	@Resource(name="dataBoardADAO")
	private DataBoardADAO dataBoardADAO;

	@Override
	public String insertDataBoard(DataBoardAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.insertDataBoard(vo);
	}

	@Override
	public List<?> selectDataBoard(SampleDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.selectDataBoard(searchVO);
	}

	@Override
	public int selectBoardATotal(SampleDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return dataBoardADAO.selectBoardATotal(searchVO);
	}

	@Override
	public DataBoardAVO selectDataBoardDetail(DataBoardAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.selectDataBoardDetail(vo);
	}

	@Override
	public int updateDataBoardHitUp(int unq) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.updateDataBoardHitUp(unq);
	}

	@Override
	public int selectDataPwdChk(DataBoardAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.selectDataPwdChk(vo);
	}


	@Override
	public int deleteDataBoard(DataBoardAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.deleteDataBoard(vo);
	}

	@Override
	public int deleteOnlyFile(DataBoardAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.deleteOnlyFile(vo);
	}

	@Override
	public int updateDataBoard(DataBoardAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.updateDataBoard(vo);
	}

	@Override
	public int selectDataFileChk(DataBoardAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataBoardADAO.selectDataFileChk(vo);
	}

}
