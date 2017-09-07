package ezen.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import ezen.service.RshService;
import ezen.service.RshVO;

@Controller
public class RshController {

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;

	@Resource(name = "rshService")
	private RshService rshService;

	/** MappingJackson2JsonView */
	@Resource(name = "jsonView")
	protected MappingJackson2JsonView jsonView;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@RequestMapping("/rshWrite.do")
	public String rshWrite() {
		return "/research/rshWrite";
	}
	
	@RequestMapping("/rshDetail.do")
	public String rshDetail(RshVO vo,Model model) throws Exception{

		vo=rshService.selectRshDetail(vo);
		List<?> list = rshService.selectRshGrp(vo); 
		
		model.addAttribute("rsh", vo);
		model.addAttribute("list", list);
		return "/research/rshDetail";
	}
	
	@RequestMapping("/rshEnter.do")
	public String rshEnter(@RequestParam("mcd")String mcd, Model model) throws Exception{
		
		RshVO vo = new RshVO();
		vo.setMcd(mcd);
		
		
		List<?> list = rshService.selectVoteRsh(mcd); 
		
		vo=rshService.selectRshTitle(vo);
		
		model.addAttribute("vo", list);
		model.addAttribute("title",vo);
		
		return "/research/rshEnter";
	}
	
	
	@RequestMapping("/main.do")
	public String rshMain(@ModelAttribute("vo")RshVO vo,Model model)throws Exception{
		
		List<?> list = rshService.selectRshMainList(vo);
		
		model.addAttribute("list",list);
		
		return "main/main";
	}
	@RequestMapping("/rshVoteResult.do")
	public String rshVoteResult(RshVO vo,Model model)throws Exception{
		
		vo = rshService.selectRshDetail(vo);
		System.out.println("mcd:::::::::::"+vo.getMcd());
		List<?> result = rshService.selectRshGrp(vo);
		
		
		model.addAttribute("title", vo);
		model.addAttribute("voteResult", result);
		
		return "research/rshResult";
	}
	
	@RequestMapping("/rshVoteSave.do")
	@ResponseBody
	public Map<String,String> insertRshVoteSave(@RequestParam("scd")String scd,RshVO vo) throws Exception{
		String result = "";
		int cnt = 0;
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		result=rshService.insertRshVoteSave(vo);
		
		if(result==null){
			result="ok";
		}
		map.put("cnt", Integer.toString(cnt));
		map.put("result", result);
		
		return map;
	}

	@RequestMapping("/rshWriteSave.do")
	@ResponseBody
	public Map<String, String> insertRshWrite(RshVO vo) throws Exception {

		String result = "";
		int cnt =0;
		
		HashMap<String, String> map = new HashMap<String, String>();

		
		System.out.println("comm_size" + vo.getComm().size());
		System.out.println("comm1" + vo.getComm().get(0));
		
		
		System.out.println("comm2" + vo.getComm().get(1));
		System.out.println("comm3" + vo.getComm().get(2));
		System.out.println("comm4" + vo.getComm().get(3));
		//rshMain Table Save s
		result = rshService.insertRshWriteSave(vo);
		//rshMain Table Save e
		
		if(result==null){
			//rshSub Table Save s
			
			for(int i=0; i<10; i++){
				if(!vo.getComm().get(i).equals("")){
					vo.setComm1((String)vo.getComm().get(i));
					rshService.insertRshSub(vo);
					System.out.println("=======" + i);
					cnt++;
				}
			}
			result="ok";
		}
		map.put("cnt", Integer.toString(cnt));
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("/rshList.do")
	public String rshList(@ModelAttribute("searchVO") SampleDefaultVO searchVO,Model model)throws Exception{
		int recordCountPerPage = 10;
		int pageSize = 5;
		int totalCount = rshService.selectRshTotal(searchVO);
		System.out.println("-----control-----");
		int pageIndex = searchVO.getPageIndex(); // 사용자가 누른 페이지 값을 가져와야한다.

		int firstPage = ((int) Math.floor((pageIndex - 1) / pageSize) * pageSize) + 1;
		int lastPage = (firstPage + pageSize) - 1;

		// 사용자가 1Page를 누른경우 1 , 2Pages 를 누른경우 11, 3Pages를 누른경우 31
		// 5. 화면 출력할 행(데이터)의 시작 번호
		int firstIndex = (pageIndex - 1) * 10 + 1;
		// firstIndex가 1이면 10, 11이면 20, 21이면 30
		// 5. 끝번호 (데이터베이스) recordCountPerPage 데이터 갯수
		int lastIndex = (firstIndex + recordCountPerPage) - 1;

		// 6. 총 페이지 개수
		int totalPage = (int) Math.ceil((double) totalCount / recordCountPerPage);
		// 7. [이전] / [다음] 처리할 변수 지정
		int before = 0; // 링크 없음
		if (firstPage > 1)
			before = 1;
		int next = 0; // 링크 없음
		if (lastPage <= totalPage)
			next = 1;

		// 8. 행번호
		searchVO.setFirstIndex(firstIndex);
		searchVO.setLastIndex(lastIndex); // 계산한값을 VO에 태워 새로 셋팅을 해준다.

		int total = rshService.selectRshTotal(searchVO);

		// 사용자가 1Page를 보고있으면 total 값, 2Pages를 보고있으면 total-10, 3Pages는 total-20
		int topNumber = total - (pageIndex - 1) * 10;

		// lastPage는 화면에 뿌려야 한다 그러므로 model 사용

		List<?> selectRshList = rshService.selectRshList(searchVO);

		model.addAttribute("recordCountPerPage", recordCountPerPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("before", before);
		model.addAttribute("next", next);

		model.addAttribute("rshList", selectRshList);
		model.addAttribute("number", topNumber);
		return "/research/rshList";
	}
}
