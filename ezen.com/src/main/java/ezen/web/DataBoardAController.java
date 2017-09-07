package ezen.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import ezen.service.DataBoardAService;
import ezen.service.DataBoardAVO;

@Controller
public class DataBoardAController {

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;

	@Resource(name = "dataBoardAService")
	private DataBoardAService dataBoardAService;

	/** MappingJackson2JsonView */
	@Resource(name = "jsonView")
	protected MappingJackson2JsonView jsonView;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@RequestMapping("/dataBoardAWrite.do")
	public String dataBoardAWrite() {
		return "/boardA/dataBoardAWrite";
	}

	@RequestMapping("/dataBoardDetail.do")
	public String dataBoardDetail(@RequestParam("unq") int unq, Model model) throws Exception {
		DataBoardAVO vo = new DataBoardAVO();
		vo.setUnq(unq);
		dataBoardAService.updateDataBoardHitUp(unq);
		vo = dataBoardAService.selectDataBoardDetail(vo);
		model.addAttribute("data", vo);
		return "boardA/dataBoardDetail";
	}

	@RequestMapping(value = "/dataBoardUpdate.do")
	@ResponseBody
	public Map<String, Object> dataBoardUpdate(DataBoardAVO vo) throws Exception {

		int cnt = 0;

		HashMap<String, Object> map = new HashMap<String, Object>();

		cnt = dataBoardAService.selectDataPwdChk(vo);
		if (cnt > 0) {
			cnt = dataBoardAService.updateDataBoard(vo);
		}
		map.put("cnt", cnt);

		return map;
	}

	@RequestMapping(value = "/dataBoardDelete.do")
	@ResponseBody
	public Map<String, Object> dataBoardDelete(HttpServletRequest request, HttpServletResponse response,
			DataBoardAVO vo) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		String uploadPath = "c:/upload";
		String fullPath = "";

		DataBoardAVO boardDetail = dataBoardAService.selectDataBoardDetail(vo);
		

		int cnt = 0;
		// 삭제전 비밀번호를 체크 
		cnt =dataBoardAService.selectDataPwdChk(vo);
		//비밀번호가 맞다면 1 아니면 0
		
		System.out.println("CNT +================="+cnt);
		
		/*cnt = */
		
		int fileCnt = -1; 
		fileCnt += dataBoardAService.selectDataFileChk(vo);
		System.out.println("fileCNT	============	"+fileCnt);
		
		
		

		if (cnt > 0) {
			
			String files = boardDetail.getFilename();
			
			// a.jpg;b.jpg
			if (files.length() > 0) {
					String[] f = files.split("／");
					for (int i = 0; i < f.length; i++) {
						fullPath = uploadPath + "/" + f[fileCnt];
						File file = new File(fullPath);
						file.delete();
				}
			}
			dataBoardAService.deleteOnlyFile(vo);
		}
		
		map.put("cnt", cnt);

		return map;
	}

	/*
	 * 자료실 게시판 저장 기능
	 */

	@RequestMapping(value = "/dataBoardWriteSave.do")
	@ResponseBody
	public Map<String, String> multipartProcess(final MultipartHttpServletRequest multiRequest,
			HttpServletResponse response, DataBoardAVO vo, Model model) throws Exception {
		MultipartFile file;
		String filePath = "";
		int cnt = 0;
		Map<String, String> map = new HashMap<String, String>();
		Map<String, MultipartFile> files = multiRequest.getFileMap();

		String uploadPath = "c:/upload";
		// String uploadPath = egovMessageSource.getMessage("file.upload.path");

		System.out.println("title : " + vo.getTitle());
		System.out.println("path : " + uploadPath);

		// 폴더의 존재 유무 및 생성

		File saveFolder = new File(uploadPath);
		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		/*
		 * 
		 * MultipartFile 의 주요 메소드는 String getName()파라미터 이름을 구한다. String
		 * getOriginalFilename()업로드 한 파일의 실제!! 이름을 구한다. boolean isEmpty()업로드 한
		 * 파일이 존재하지 않는 경우 true를 리턴 한다. long getSize()업로드한 파일의 크기를 구한다. byte[]
		 * getBytes() throws IOException업로드 한 파일 데이터를 구한다. --> 이걸로 파일 쓰면된다.
		 * InputStream getInputStream()InputStrem을 구한다. void transferTo(File
		 * dest)업로드 한 파일 데이터를 지정한 파일에 저장한다. --> 요고도 파일쓰는거다.
		 */
		String filename = "";
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if (!"".equals(file.getOriginalFilename())) {
				filePath = uploadPath + "/" + file.getOriginalFilename();
				file.transferTo(new File(filePath));
				filename += file.getOriginalFilename() + "／";
				cnt++;
			}
		}

		vo.setFilename(filename);
		System.out.println("Controller" + vo.getFilename());
		String result = "";
		result = dataBoardAService.insertDataBoard(vo);
		System.out.println(result);
		if (result == null) {
			result = "ok";
		} else {
			result = "no";
		}

		System.out.println("filePath : " + filePath);
		map.put("result", result);
		map.put("cnt", Integer.toString(cnt));
		System.out.println("cnt -> " + cnt);
		return map;
	}
	@RequestMapping(value = "/dataBoardDetailUpdate.do")
	@ResponseBody
	public Map<String, String> dataBoardDetailUpdate(final MultipartHttpServletRequest multiRequest,
			HttpServletResponse response, DataBoardAVO vo, Model model) throws Exception {
		MultipartFile file;
		String filePath = "";
		int cnt = 0;
		Map<String, String> map = new HashMap<String, String>();
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		String uploadPath = "c:/upload";
		// String uploadPath = egovMessageSource.getMessage("file.upload.path");
		
		System.out.println("title : " + vo.getTitle());
		System.out.println("path : " + uploadPath);
		
		// 폴더의 존재 유무 및 생성
		
		File saveFolder = new File(uploadPath);
		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}
		
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		/*
		 * 
		 * MultipartFile 의 주요 메소드는 String getName()파라미터 이름을 구한다. String
		 * getOriginalFilename()업로드 한 파일의 실제!! 이름을 구한다. boolean isEmpty()업로드 한
		 * 파일이 존재하지 않는 경우 true를 리턴 한다. long getSize()업로드한 파일의 크기를 구한다. byte[]
		 * getBytes() throws IOException업로드 한 파일 데이터를 구한다. --> 이걸로 파일 쓰면된다.
		 * InputStream getInputStream()InputStrem을 구한다. void transferTo(File
		 * dest)업로드 한 파일 데이터를 지정한 파일에 저장한다. --> 요고도 파일쓰는거다.
		 */
		String filename = "";
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if (!"".equals(file.getOriginalFilename())) {
				filePath = uploadPath + "/" + file.getOriginalFilename();
				file.transferTo(new File(filePath));
				filename += file.getOriginalFilename() + "／";
				cnt++;
			}
		}
		
		vo.setFilename(filename);
		System.out.println("Controller" + vo.getFilename());
		int update=0;
		
		update = dataBoardAService.updateDataBoard(vo);
		System.out.println(update);
		
		
		System.out.println("filePath : " + filePath);
		map.put("update", Integer.toString(update));
		map.put("cnt", Integer.toString(cnt));
		System.out.println("cnt -> " + cnt);
		return map;
	}

	@RequestMapping(value = "/downloadFile.do")
	public void downloadFile(@RequestParam(value = "requestedFile") String requestedFile, HttpServletResponse response)
			throws Exception {
		String uploadPath = "c:/upload";
		File uFile = new File(uploadPath, requestedFile);
		int fSize = (int) uFile.length();

		if (fSize > 0) {
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(uFile));
			// String mimetype = servletContext.getMimeType(requestedFile);
			String mimetype = "text/html";
			response.setBufferSize(fSize);
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + requestedFile + "\"");
			response.setContentLength(fSize);
			FileCopyUtils.copy(in, response.getOutputStream());
			in.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} else {
			// setContentType을 프로젝트 환경에 맞추어 변경
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + requestedFile + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascripｔ: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>© webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}

	@RequestMapping("/dataBoardList.do")
	public String dataBoardSelectList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model)
			throws Exception {

		int recordCountPerPage = 10;
		int pageSize = 5;
		int totalCount = dataBoardAService.selectBoardATotal(searchVO);
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

		int total = dataBoardAService.selectBoardATotal(searchVO);

		// 사용자가 1Page를 보고있으면 total 값, 2Pages를 보고있으면 total-10, 3Pages는 total-20
		int topNumber = total - (pageIndex - 1) * 10;

		// lastPage는 화면에 뿌려야 한다 그러므로 model 사용

		List<?> selectDataBoardList = dataBoardAService.selectDataBoard(searchVO);

		model.addAttribute("recordCountPerPage", recordCountPerPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("before", before);
		model.addAttribute("next", next);

		model.addAttribute("dataList", selectDataBoardList);
		model.addAttribute("number", topNumber);

		return "boardA/dataBoardList";
	}

	@RequestMapping(value = "/uploadFileDelete.do")
	@ResponseBody
	public Map<String, Object> deleteDataBoard(HttpServletRequest request, HttpServletResponse response,
			DataBoardAVO vo) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		String uploadPath = "c:/upload";
		String fullPath = "";

		DataBoardAVO boardDetail = dataBoardAService.selectDataBoardDetail(vo);

		int cnt = 0;
		cnt = dataBoardAService.selectDataPwdChk(vo);
		
		int fileChk =0;
		
		fileChk = dataBoardAService.selectDataFileChk(vo);
		
		
		
		if (cnt > 0) {
			String files = boardDetail.getFilename();
			// a.jpg,b.jpg
			if (fileChk > 0) {
				String[] f = files.split("／");
				System.out.println(f.length);
				for (int i = 0; i < f.length; i++) {
					fullPath = uploadPath + "/" + f[i];
					File file = new File(fullPath);
					file.delete();
					dataBoardAService.deleteDataBoard(vo);
				}
			}else if(fileChk == 0 && cnt >0){
				dataBoardAService.deleteDataBoard(vo);
			}
		}

		map.put("cnt", cnt);

		return map;

	}

}