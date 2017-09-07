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
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="js/jquery-2.2.2.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">
	function fn_rshDetail(u) {
		var f=document.hiddenFrmList;
		f.unq.value = u;
		f.submit();
		
	}
</script>
</head>
<body>
	<table class="table table-hover" align="center"
		style="margin-top: 50px; width: 700px; height: 50px;">
		<tr height="40">
			<td align="center" bgcolor="#ffffff"><br>
				<h1 align="center">
					<font color="RED"><strong>RESEARH</strong></font>
				</h1>
				<div class="txt_desc">RYU SEOKHYUN</div></td>
		</tr>
		<tr height="10">
			<td align="right">
			<button type="button" class="btn btn-link"onclick="location.href='rshWrite.do'">설문 등록</button>
			</td>
		</tr>
	</table>
	<form id="listFrm" method="post">
				<table class="table table-hover" align="center"
		style="margin-top: 10px; width: 700px; height: 700px;">
					
					<tr>
						<th width="8%" height="10">번호</th>
						<td align="center"><strong>제목</strong></td>
						<td align="center"width="20%"><strong>기간</strong></td>
						<td align="center"width="10%"><strong>결과 보기</strong></td>
						<td align="center"><strong>노출 여부</strong></td>
					</tr>


						<c:set var="cc" value="0" />
						<c:forEach var="rsh" items="${rshList}" varStatus="status">
						
						<tr>   
							<td width="8%" align="center">
							${number}
							</td>


							<td align="left">
								<%-- <c:forEach var="i" begin="1"
									end="${fn:length(board.thread)-1 }">
					&nbsp;
				</c:forEach>  --%> <%-- <c:forEach	var="i" begin="1" end="${fn:length(board.thread)-1 }">
										<c:if test="${fn:length(board.thread) ne 1 }">
											<font color="red">+[RE]</font>
										</c:if>
				</c:forEach> --%> <a href="#" class="btn btn-link" onclick="fn_rshDetail('${rsh.unq}')">
									${rsh.title}</a>
							</td>
							<td align="center">${rsh.date}</td>
							<td align="center">
							<c:if test="${rsh.use == '노출'}">
							<button class="btn btn-link" onclick="fn_move22('${rsh.unq}')">[응모결과]</button>
							</c:if>   
							<c:if test="${rsh.use == '비노출'}">[응모결과]</c:if>
							</td>  

							<td align="center">
							<c:if test="${rsh.use == '노출'}"><font color="green">노출</font></c:if>
							<c:if test="${rsh.use == '비노출'}"><font color="red">비노출</font></c:if>
							
							</td>
						</tr>
						<c:set var="number" value="${number-1}" />
						<c:set var="cc" value="${cc+1}" />
					</c:forEach>
					<c:if test="${cc < recordCountPerPage}">
						<c:forEach begin="1" end="${recordCountPerPage-cc}">
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
								test="${searchVO.pageIndex == 1}">
								<img src="/images/egovframework/cmmn/btn_page_pre10.gif " />&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${searchVO.pageIndex != 1}">
								<a
									href="rshList.do?pageIndex=1&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img
									src="/images/egovframework/cmmn/btn_page_pre10.gif " />&nbsp;&nbsp;&nbsp;</a>
							</c:if> <c:if test="${before == 0}">
								<img src="/images/egovframework/cmmn/btn_page_pre1.gif " />
							</c:if> <c:if test="${before > 0}">
								<a href="boardList.do?pageIndex=${firstPage-1}"><img
									src="/images/egovframework/cmmn/btn_page_pre1.gif " /></a>
							</c:if> <c:forEach var="i" begin="${firstPage}" end="${lastPage}">
								<c:if test="${i <= totalPage}">

									<c:if test="${i !=searchVO.pageIndex}">
										<a
											href="rshList.do?pageIndex=${i}&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}">${i}</a>
									</c:if>

									<c:if test="${i ==searchVO.pageIndex}">
						${i }
					</c:if>

								</c:if>

							</c:forEach> <c:if test="${next == 0}">
								<img src="/images/egovframework/cmmn/btn_page_next1.gif" />
							</c:if> <c:if test="${next > 0}">
								<a
									href="rshList.do?pageIndex=${lastPage+1}&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img
									src="/images/egovframework/cmmn/btn_page_next1.gif" /></a>
							</c:if> <c:if test="${searchVO.pageIndex == totalPage}">&nbsp;&nbsp;&nbsp;<img
									src="/images/egovframework/cmmn/btn_page_next10.gif" />
							</c:if> <c:if test="${searchVO.pageIndex != totalPage}">
								<a
									href="rshList.do?pageIndex=${totalPage}&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}">&nbsp;&nbsp;&nbsp;<img
									src="/images/egovframework/cmmn/btn_page_next10.gif " /></a>
							</c:if></td>
					</tr>
				</table>
	</form>
				<form name="searchFrm" method="post" action="/rshList.do">

					<table border="0" align="center" width="700pt">
						<tr bgcolor="#ffffff" height="8%">
							<td align="left"><select name="searchCondition">
									<option value="title">제 목</option>
									<option value="sdate">내용</option>
									<option value="edate">내용</option>
									<option value="use">내용</option>
							</select> <input type="text" name="searchKeyword" /> <input type="submit"
								value="검색" /></td>
						</tr>
					</table>
				</form>
				<form name="hiddenFrmList" id="hiddenFrmList" method="post"  action="<c:url value='/rshDetail.do'/>">
					<input type="hidden" name="unq" id="unq" />
				</form>

</body>
</html>