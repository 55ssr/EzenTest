package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.EmpService;
import egovframework.example.sample.service.EmpVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("empService")
public class EmpServiceImpl extends EgovAbstractServiceImpl  implements EmpService {

	@Resource(name = "empDAO")
	private EmpDAO empDAO;

	@Override
	public String insertEmp(EmpVO vo) throws Exception {
		return empDAO.insertEmp(vo);
	}

	@Override
	public List<?> selectEmpList(SampleDefaultVO searchVO) throws Exception {
		return empDAO.selectEmpList(searchVO);
	}

	@Override
	public EmpVO selectEmpDetail(EmpVO vo) throws Exception {
		return empDAO.selectEmpDetail(vo);
	}

	@Override
	public int updateEmp(EmpVO vo) throws Exception {
		return empDAO.updateEmp(vo);
	}

	@Override
	public int deleteEmp(EmpVO vo) throws Exception {
		return empDAO.deleteEmp(vo);
	}

	@Override
	public int selectEmpTotal(SampleDefaultVO searchVO) throws Exception {
		return empDAO.selectEmpTotal(searchVO);
	}

	@Override
	public List<?> selectEmpJob() throws Exception {
		return empDAO.selectEmpJob();
	}

	@Override
	public List<?> selectEmpNames() throws Exception {
		return empDAO.selectEmpNames();
	}


}
