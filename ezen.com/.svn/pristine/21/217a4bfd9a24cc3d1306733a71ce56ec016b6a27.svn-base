<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<input type="button" value="목록" 
          onclick="location.href='/empList.do'"/>
<input type="button" value="삭제" 
          onclick="location.href='/empDelete.do?empno=${vo.empno}'"/>
		</td>
	</tr>
</table>
<form name="frm" method="post" action="/empUpdate.do">
<table border="1" cellpadding="0" cellspacing="0" width="600">
	<tr>
		<td width="20%">사원번호</td>
		<td width="*"><input type="text" name="empno" value="${vo.empno}" readonly>
		<input type="button" value="중복체크" class="btn" onclick="fn_check()">
		</td>
	</tr>
	<tr>
		<td>사원명</td>
		<td><input type="text" name="ename" value="${vo.ename}"></td>
	</tr>
	<tr>
		<td>업무</td>
		<td>
		<input type="text" name="job" value="${vo.job}">
		</td>
	</tr>
	<tr>
		<td>입사일</td>
		<td><input type="text" name="hiredate" id="hiredate" value="${vo.hiredate}"></td>
	</tr>
	<tr>
		<td>매니저</td>
		<td>
		<input type="text" name="mgr" value="${vo.mgr}">
		</td>
	</tr>
	<tr>
		<td>급여</td>
		<td><input type="text" name="sal" value="${vo.sal}"></td>
	</tr>
	<tr>
		<td>수수료</td>
		<td><input type="text" name="comm" id="comm" value="${vo.comm}"></td>
	</tr>
	<tr>
		<td>부서번호</td>
		<td><input type="text" name="deptno" value="${vo.deptno}"></td>
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