<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/egovframework/join_reform.css?">
<link rel="stylesheet" href="../css/egovframework/join_reform_font.css">
<script type="text/javascript">
	function fn_move(u) {
		var m = document.hiddenFrm;
		m.unq.value = u;
		m.submit();
	}
</script>
</head>
<body>

	<table class="table table-hover" align="center" style="margin-top: 50px; width: 700px; height: 50px;">
		<tr height="40">
			<td align="center" bgcolor="#ffffff"><br>
				<h1 align="center"><font color="RED"><strong>게시판 목록</strong></font></h1>
				<div class="txt_desc">RYU SEOKHYUN</div></td>
		</tr>
		<tr height="10">
		<td align="right">
		<button type="button" class="btn btn-link" onclick="location.href='dataBoardAWrite.do'">게시글 쓰기</button>
		</td>
	</tr>
	</table>


	<table class="table table-hover" align="center" style="margin-top: 10px; width: 700px; height: 700px;">
		<tr bgcolor="#ffffff">
			<th width="8%" height="10">번호</th>
			<th>제 목</th>
			<th width="10%">글쓴이</th>
			<th align="center" width="20%"  >날짜</th>
			<th align="center">조회수</th>
			<th align="center">첨부 파일</th>
		</tr>


		<c:set var="cc" value="0" />
		<c:forEach var="data" items="${dataList }" varStatus="status">
			<tr bgcolor="#ffffff">
				<td width="8%" align="center">${number }</td>
		
		

				<td align="left">
					<%-- <c:forEach var="i" begin="1"
									end="${fn:length(board.thread)-1 }">
					&nbsp;
				</c:forEach>  --%> <%-- <c:forEach	var="i" begin="1" end="${fn:length(board.thread)-1 }">
										<c:if test="${fn:length(board.thread) ne 1 }">
											<font color="red">+[RE]</font>
										</c:if>
				</c:forEach> --%> <a href="#" onclick="fn_move('${data.unq }')">
						${data.title }</a>
				</td>
				<td align="center">${data.name }</td>
				<td>${data.rdate }</td>
  
				<td>${data.hit }</td>
				<td>
				<c:set var="filename" value="${fn:split(data.filename,'／' )}" />
				<c:forEach var="down" items="${filename }" varStatus="a">
				
				<c:if test="${down != '' }">
				<a href ="#" onclick="window.open(encodeURI('<c:url value='downloadFile.do?'/>requestedFile=${down }'))">download &nbsp;</a>
			
				</c:if>
				      
				<c:if test="${data.filename == null }">
				 <h6 class="help-block">첨부 파일 없음</h6>
				</c:if>
				</c:forEach>
				</td>
			</tr>
			<c:set var="number" value="${number-1 }" />
			<c:set var="cc" value="${cc+1 }" />
		</c:forEach>
		<c:if test="${cc < recordCountPerPage }">
			<c:forEach begin="1" end="${recordCountPerPage-cc }">
				<tr bgcolor="#ffffff">
					<td width="8%" align="center"></td>
					<td></td>
					<td align="center"></td>
					<td></td>
					<td></td>
					<td></td> 
				</tr>
			</c:forEach>
		</c:if>
		<tr bgcolor="#ffffff" height="8%">
			<td colspan="6" align="center"><c:if
					test="${searchVO.pageIndex == 1 }">
					<img src="/images/egovframework/cmmn/btn_page_pre10.gif " />&nbsp;&nbsp;&nbsp;</c:if>
				<c:if test="${searchVO.pageIndex != 1 }">
					<a
						href="dataBoardList.do?pageIndex=1&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img
						src="/images/egovframework/cmmn/btn_page_pre10.gif " />&nbsp;&nbsp;&nbsp;</a>
				</c:if> <c:if test="${before == 0 }">
					<img src="/images/egovframework/cmmn/btn_page_pre1.gif " />
				</c:if> <c:if test="${before > 0 }">
					<a href="dataBoardList.do?pageIndex=${firstPage-1 }"><img
						src="/images/egovframework/cmmn/btn_page_pre1.gif " /></a>
				</c:if> <c:forEach var="i" begin="${firstPage }" end="${lastPage }">
					<c:if test="${i <= totalPage }">

						<c:if test="${i !=searchVO.pageIndex }">
							<a
								href="dataBoardList.do?pageIndex=${i }&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}">${i }</a>
						</c:if>

						<c:if test="${i ==searchVO.pageIndex }">
						${i }
					</c:if>

					</c:if>

				</c:forEach> <c:if test="${next == 0 }">
					<img src="/images/egovframework/cmmn/btn_page_next1.gif" />
				</c:if> <c:if test="${next > 0 }">
					<a
						href="dataBoardList.do?pageIndex=${lastPage+1 }&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img
						src="/images/egovframework/cmmn/btn_page_next1.gif" /></a>
				</c:if> <c:if test="${searchVO.pageIndex == totalPage }">&nbsp;&nbsp;&nbsp;<img
						src="/images/egovframework/cmmn/btn_page_next10.gif" />
				</c:if> <c:if test="${searchVO.pageIndex != totalPage }">
					<a
						href="dataBoardList.do?pageIndex=${totalPage }&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}">&nbsp;&nbsp;&nbsp;<img
						src="/images/egovframework/cmmn/btn_page_next10.gif " /></a>
				</c:if></td>
		</tr>
	</table>
	<form name="searchFrm" method="post" action="/dataBoardList.do">

		<table border="0" align="center" width="700pt">
			<tr bgcolor="#ffffff" height="8%">
				<td align="left"><select name="searchCondition">
						<option value="title">제 목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchKeyword" /> <input type="submit"
					value="검색" /></td>
			</tr>
		</table>
	</form>

	<form name="hiddenFrm" method="post"
		action="<c:url value='/dataBoardDetail.do'/>">
		<input type="hidden" name="unq" id="unq" />
	</form>

</body>
</html>