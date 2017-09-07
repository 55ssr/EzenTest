package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.EmpService;
import egovframework.example.sample.service.EmpVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Controller
public class EmpController {

	@Resource(name = "empService")
	private EmpService empService;
	
	@Resource(name = "sampleService")
	private EgovSampleService deptService;
	
	@RequestMapping("/empWrite.do")
	public String empWrite(Model model,SampleDefaultVO searchVO) throws Exception {
		
		List<?> list = empService.selectEmpJob();
		List<?> list2 = empService.selectEmpNames();
		List<?> list3 = deptService.selectDeptList(searchVO);
		
		model.addAttribute("jobs",list);
		model.addAttribute("names",list2);
		model.addAttribute("depts",list3);
		return "emp/empWrite";
	}
	
	@RequestMapping("/empSave.do")
	public String insertEmp(EmpVO empVO) throws Exception {
		
		empService.insertEmp(empVO);
		
		return "redirect:/empList.do";
	}
	
	@RequestMapping("/empList.do")
	public String selectEmpList(SampleDefaultVO searchVO,Model model) 
			                                 throws Exception {
		// @RequestParam(value="pageNo", required="false")
		// 1. pageNo 이용
		/*int pageNo = 1;
		if(request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}*/
		
		// 2.  SampleDefalutVO 이용
		int pageNo = searchVO.getPageIndex();

		int recordCountPerPage = 10;
		int total = empService.selectEmpTotal(searchVO);
		
		// 1 => 1,10 .. 2=> 11,20 .. 3 => 21,30
		int firstIndex = (pageNo-1) * recordCountPerPage + 1;
		int lastIndex = firstIndex + (recordCountPerPage - 1);
		// 1 -> total - 0 , 2 -> total-10, 3 -> total - 20;
		int number = total - ((pageNo-1) * recordCountPerPage);
		
		searchVO.setFirstIndex(firstIndex);
		searchVO.setLastIndex(lastIndex);
		
		List<?> list = empService.selectEmpList(searchVO);
		
		int totalPage = (int) Math.ceil((double)total/10);

		model.addAttribute("totalPage",totalPage);
		model.addAttribute("number",number);
		model.addAttribute("resultList",list);
		return "emp/empList";
	}

	@RequestMapping("/empDetail.do")
	public String selectEmpDetail(EmpVO vo,Model model) 
			                                 throws Exception {
		vo = empService.selectEmpDetail(vo);
		model.addAttribute("vo",vo);
		return "emp/empDetail";
	}
	
	@RequestMapping("/empUpdate.do")
	public String updateEmp(EmpVO vo) throws Exception {
		int cnt = empService.updateEmp(vo);
		return "redirect:/empList.do";
	}
	
	@RequestMapping("/empDelete.do")
	public String deleteEmp(EmpVO vo) throws Exception {
		int cnt = empService.deleteEmp(vo);
		return "redirect:/empList.do";
	}
	
}





