<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/include/link.jsp"></jsp:include>
</head>

  <script>
  $( function() {
    $( "#hiredate" ).datepicker();
  } );
  </script>

<script>
function fn_action() {
	var f = document.frm;
	if( f.empno.value == "" ) {
		alert("사원번호입력~");
		return;
	}
	f.submit();
}

</script>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<table border="0" width="600">
	<tr>
		<td align="center">[ 사원정보 등록 ]</td>
	</tr>
	<tr>
		<td align="right"> 
	<input type="button" value="목록" onclick="location.href='empList.jsp'"/>
		</td>
	</tr>
</table>
<form name="frm" method="post" action="empSave.do">
<table border="1" cellpadding="0" cellspacing="0" width="600">
	<tr>
		<td width="20%">사원번호</td>
		<td width="*"><input type="text" name="empno">
		<input type="button" value="중복체크" class="btn" onclick="fn_check()">
		</td>
	</tr>
	<tr>
		<td>사원명</td>
		<td><input type="text" name="ename" class="ins"></td>
	</tr>
	<tr>
		<td>업무</td>
		<td>
		<select name="job">
			<c:forEach var="result" items="${jobs}" varStatus="status">
				<c:if test="${result.job != 'PRESIDENT'}">
				<option value="${result.job}">${result.job}</option>
				</c:if>
			</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>입사일</td>
		<td><input type="text" name="hiredate" id="hiredate"></td>
	</tr>
	<tr>
		<td>매니저</td>
		<td>
		<select name="mgr">
		<c:forEach var="rs" items="${names}" varStatus="status">
			<c:if test="${rs.ename != 'KING' }">
			<option value="${rs.empno}">${rs.ename} / ${rs.empno}</option>
			</c:if>
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>급여</td>
		<td><input type="text" name="sal" class="ins"></td>
	</tr>
	<tr>
		<td>수수료</td>
		<td><input type="text" name="comm" class="ins"  id="comm"></td>
	</tr>
	<tr>
		<td>부서이름</td>
		<td>
		<select name="deptno">
		<c:forEach var="rs" items="${depts}">
			<option value="${rs.deptno}">${rs.dname}</option>
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr align="center">
		<td colspan="2">
		<input type="button" value="저장" class="btn" onClick="fn_action()">
		</td>
	</tr>
</table>
</form>    
   
</body>
</html>