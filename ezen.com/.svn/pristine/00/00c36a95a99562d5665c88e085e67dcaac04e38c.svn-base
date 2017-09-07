package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.example.sample.service.EmpVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("empDAO")
public class EmpDAO extends EgovAbstractDAO {

	public String insertEmp(EmpVO vo) {
		return (String) insert("empDAO.insertEmp", vo);
	}

	public List<?> selectEmpList(SampleDefaultVO searchVO) {
		return list("empDAO.selectEmpList",searchVO);
	}

	public EmpVO selectEmpDetail(EmpVO vo) {
		return (EmpVO) select("empDAO.selectEmpDetail",vo);
	}

	public int updateEmp(EmpVO vo) {
		return update("empDAO.updateEmp",vo);
	}

	public int deleteEmp(EmpVO vo) {
		return delete("empDAO.deleteEmp",vo);
	}

	public int selectEmpTotal(SampleDefaultVO searchVO) {
		return (int) select("empDAO.selectEmpTotal",searchVO);
	}

	public List<?> selectEmpJob() {
		return list("empDAO.selectEmpJob");
	}

	public List<?> selectEmpNames() {
		return list("empDAO.selectEmpNames");
	}                                                                            
}
