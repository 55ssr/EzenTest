package ezen.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.service.EmpService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ezen.service.BoardService;
import ezen.service.BoardVO;

@Controller
public class BoardController {

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardSave.do")
	public String insertBoard(BoardVO vo) throws Exception {
		
		String result = boardService.insertBoard(vo);
		
		return "redirect:/boardList.do";
	} // 
	
	@RequestMapping("/boardReSave.do")
	public String insertBoardReply(BoardVO vo) throws Exception {
		
		String maxThread = boardService.selectBoardMaxThread(vo);
		System.out.println("maxThread ========= " + maxThread);
		
		//  maxThread -> ab -> ac   ,  aab -> aac , null 경우  a -> aa ,  aac -> aaca
		//char zz = 'a';
		
		String myThread = "";
		if(maxThread != null) {
			char zz = maxThread.charAt(maxThread.length()-1);
			char t2 =  (char) ((int)zz+1);
			String t1 = maxThread.substring(0,maxThread.length()-1);
			
			myThread = t1 + t2;
		} else {
			myThread = vo.getThread() + "a";
		}
		System.out.println( " myThread ========== "  + myThread );
		vo.setThread(myThread);
		
		String result = boardService.insertBoardReply(vo);

		return "redirect:/boardList.do";
	}

	@RequestMapping("/boardList.do")
	public String selectBoardList(@ModelAttribute("searchVO") SampleDefaultVO searchVO,Model model) throws Exception {
	
		/*1. 한 화면에 출력할 행 개수 , 한 화면에 출력할 페이지 개수 */ 
			int recordCountPerPage = 10;
			int pageSize = 5;
		/*2. 총 데이터 개수 */
			int totalCount = boardService.selectBoardTotal(searchVO);
		/*3. 화면 출력할 페이지 번호 */
			int pageIndex = searchVO.getPageIndex();		
		/*4. 화면 출력할 페이징의 시작 번호 , 끝 번호 */
			//  1,2,3,4,5  -> 1 / 6,7,8,9,10 -> 6 / 11,12,13,14,15 -> 11
			int firstPage = ((int) Math.floor((pageIndex-1)/pageSize)*pageSize) + 1 ;
			int lastPage = (firstPage + pageSize) - 1;
		/*5. 화면 출력할 행(데이터)의 시작 번호, 끝 번호 */
			int firstIndex = (pageIndex - 1) * 10 + 1;
			int lastIndex = (firstIndex + recordCountPerPage) - 1;
		/*6. 총 페이지 개수 */
			int totalPage = (int) Math.ceil((double)totalCount / recordCountPerPage);
		
			/*7. [이전] / [다음] 처리할 변수 지정 */
			int before = 0;    // 링크 없음
			if(firstPage > 1) before = 1;
			
			int next = 0;      // 링크 없음
			if(lastPage <= totalPage) next = 1;
		/*7. 행번호 */
			int number = totalCount - ((pageIndex-1) * recordCountPerPage);

		searchVO.setFirstIndex(firstIndex);
		searchVO.setLastIndex(lastIndex);
			
		List<?> list = boardService.selectBoardList(searchVO);	

		model.addAttribute("totalCount", totalCount);  // 총 데이터 수량
		model.addAttribute("firstPage", firstPage);	  
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("totalPage", totalPage);   // 총 페이지 개수
		model.addAttribute("before", before);		  // before 버튼 활성화 유무
		model.addAttribute("next", next);			  // next 버튼 활성화 유무
		model.addAttribute("number", number);		  // 출력 페이지 row 번호

		model.addAttribute("resultList",list);
		return "board/boardList";
	}
	
	@RequestMapping("/boardDetail.do")
	public String selectBoardDetail(BoardVO vo,Model model) throws Exception {

		int unq = vo.getUnq();
		
		vo = boardService.selectBoardDetail(vo);	                                 
		model.addAttribute("vo",vo);
		
		boardService.updateBoardHit(unq);
		
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardReWrite.do")
	public String selectBoardReWrite(BoardVO vo,Model model) throws Exception {

		vo = boardService.selectBoardDetail(vo);	                                 
		model.addAttribute("vo",vo);

		return "board/boardReWrite";
	}
	
	@RequestMapping("/boardUpdate.do")
	public String updateBoard(BoardVO vo) throws Exception {
		 int  result = 0;
		 int  count =  boardService.selectBoardPwdCheck(vo);
		 if( count > 0 ) {
	             result = boardService.updateBoard(vo);
		 } else {
			 System.out.println("패스워드오류");
		 }
		 return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardDelete.do")
	public String deleteBoard(BoardVO vo) throws Exception {
	
		int cnt = boardService.selectBoardReCnt(vo);
		
		System.out.println("cnt ======= : " + cnt);
		
		if(cnt == 0) {
			boardService.deleteBoard(vo);
		} else if(cnt > 0){
			boardService.updateBoardSpace(vo);
		}
		return "redirect:/boardList.do";
	}
	
	@RequestMapping(value = "/boardList2.do")
	public String selectBoardList2(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));  //10
		searchVO.setPageSize(propertiesService.getInt("pageSize"));  //10

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> sampleList = boardService.selectBoardList(searchVO);
		model.addAttribute("resultList", sampleList);

		int totCnt = boardService.selectBoardTotal(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("paginationInfo", paginationInfo);

		return "board/boardList2";
	}
	
	
}










