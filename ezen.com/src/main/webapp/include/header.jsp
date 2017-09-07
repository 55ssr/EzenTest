<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function fn_logout() {

	$.ajax({
		type: 'POST',
		data: '',
		url: "<c:url value='/logOut.do' />",
		dataType: "json",
		success: function (data) {
			if(data.result == "ok") {
				alert("로그아웃 처리 되었습니다.");
				location.href = "<c:url value='/main.do'/>";
			} 
		},
		error: function (error) {
			alert("error : " + error);
		}
	});
}
</script>
<body>
	<table border="0" width="600">
		<tr>
			<td>
			<a href="/main.do">홈</a> &nbsp;
			<a href="/noticeList.do">공지사항</a> &nbsp;
			<a href="/boardList.do">게시판</a> &nbsp;
			<a href="/empList.do">사원관리</a> &nbsp;

<c:if test="${sessionScope.loginCertification.userId != null}">
		<a href="#" onClick="document.forDetailform.submit();">회원정보1</a> &nbsp;
		<a href="#" onClick="$('#forDetailform').submit();">회원정보2</a> &nbsp;
		<a href="#" onClick="fn_logout()">로그아웃</a> &nbsp;
</c:if>
<c:if test="${sessionScope.loginCertification.userId == null}">
		<a href="/memberWrite.do">회원등록</a> &nbsp;
		<a href="/loginWrite.do">로그인</a> &nbsp;
</c:if>
			<a href="/researchList.do">설문조사</a>
			</td>
		</tr>
	</table>
<form name="forDetailform" id="forDetailform" method="post" action="/memberDetail.do">
	<input type="hidden" name="userid" value="${sessionScope.loginCertification.userId}">
</form>
</body>
</html>



