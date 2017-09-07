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
	<div id="wrap">
		<div id="header">
			<jsp:include page="/include/header.jsp"></jsp:include>
		</div>

		<div id="middle">
			<div id="sidebar">
				<%-- <jsp:include page="/include/sidebar.jsp"></jsp:include> --%>
			</div>
			<div id="content">
				<table align="center" border="0" cellspacing="1" bgColor="#cccccc"
					width="700pt" height="150pt">
					<tr height="50">
						<td align="center" bgcolor="#ffffff"><br>
							<h3 class="tit_join">[ 게시글 목록 ]</h3> <br>
							<div class="txt_desc">게시판 목록입니다.</div></td>
					</tr>
				</table>


				<table align="center" bgcolor="#cccccc" width=700pt cellspacing="1"
					height="700pt">
					<tr bgcolor="#ffffff">
						<th width="8%" height="10">번호</th>
						<th>제 목</th>
						<th width="10%">글쓴이</th>
						<th width="20%">날짜</th>
						<th>업데이트 날짜</th>
						<th>조회수</th>
					</tr>


						<c:set var="cc" value="0" />
						<c:forEach var="board" items="${boardList }" varStatus="status">
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
				</c:forEach> --%> <a href="#" onclick="fn_move('${board.unq }')">
									${board.title }</a>
							</td>
							<td align="center">${board.name }</td>
							<td align="center">${board.rdate }</td>

							<td align="center">${board.udate }</td>
							<td align="center">${board.hit }</td>
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
									href="boardAList.do?pageIndex=1&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img
									src="/images/egovframework/cmmn/btn_page_pre10.gif " />&nbsp;&nbsp;&nbsp;</a>
							</c:if> <c:if test="${before == 0 }">
								<img src="/images/egovframework/cmmn/btn_page_pre1.gif " />
							</c:if> <c:if test="${before > 0 }">
								<a href="boardList.do?pageIndex=${firstPage-1 }"><img
									src="/images/egovframework/cmmn/btn_page_pre1.gif " /></a>
							</c:if> <c:forEach var="i" begin="${firstPage }" end="${lastPage }">
								<c:if test="${i <= totalPage }">

									<c:if test="${i !=searchVO.pageIndex }">
										<a
											href="boardAList.do?pageIndex=${i }&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}">${i }</a>
									</c:if>

									<c:if test="${i ==searchVO.pageIndex }">
						${i }
					</c:if>

								</c:if>

							</c:forEach> <c:if test="${next == 0 }">
								<img src="/images/egovframework/cmmn/btn_page_next1.gif" />
							</c:if> <c:if test="${next > 0 }">
								<a
									href="boardAList.do?pageIndex=${lastPage+1 }&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img
									src="/images/egovframework/cmmn/btn_page_next1.gif" /></a>
							</c:if> <c:if test="${searchVO.pageIndex == totalPage }">&nbsp;&nbsp;&nbsp;<img
									src="/images/egovframework/cmmn/btn_page_next10.gif" />
							</c:if> <c:if test="${searchVO.pageIndex != totalPage }">
								<a
									href="boardAList.do?pageIndex=${totalPage }&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}">&nbsp;&nbsp;&nbsp;<img
									src="/images/egovframework/cmmn/btn_page_next10.gif " /></a>
							</c:if></td>
					</tr>
				</table>
				<form name="searchFrm" method="post" action="/boardAList.do">

					<table border="0" align="center" width="700pt">
						<tr bgcolor="#ffffff" height="8%">
							<td align="left"><select name="searchCondition">
									<option value="title">제 목</option>
									<option value="content">내용</option>
							</select> <input type="text" name="searchKeyword" /> <input type="submit"
								value="검색" /></td>
							<td align="right">
								<button type="button" onclick="location.href='boardAWrite.do'">게시물
									등록</button>
							</td>
						</tr>
					</table>
				</form>

				<form name="hiddenFrm" method="post"
					action="<c:url value='/boardADetail.do'/>">
					<input type="hidden" name="unq" id="unq" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>