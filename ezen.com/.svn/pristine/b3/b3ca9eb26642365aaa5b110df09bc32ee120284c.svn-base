<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<style>
text{ height:25px; }
</style>
<script>
function fn_list(a) {
	var f = document.hiddenFrm;
	f.pageIndex.value = a;
	f.submit();
}

function fn_detail(a) {
	var f = document.hiddenFrm2;
	f.empno.value = a;
	f.submit();
}

</script>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<div class="header" style="height:50px;">
	<jsp:include page="/include/header.jsp"></jsp:include>
</div>
	
	<table width="600" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
		<tr>
			<th>번호</th>
			<th>사원명</th>
			<th>업무</th>
			<th>입사일</th>
			<th>부서번호</th>
		</tr>
		<c:forEach var="result" items="${resultList}" varStatus="status">
           <tr align="center">
           		<td>${number}</td>
            	<td><a href="#" onClick="fn_detail('${result.empno}')">${result.ename}</a></td>
            	<td>${result.job}</td>
            	<td>
            	${fn:substring(result.hiredate,0,10)}
            	</td>
            	<td>${result.deptno}</td>
            </tr>
            <c:set var="number" value="${number-1}"/> 
		</c:forEach>
</table>
<table border="0" width="600">
	<tr>
		<td align="center">
		<c:forEach  var="i"  begin="1"  end="${totalPage}">
			<a href="#" onClick="fn_list('${i}')">${i}</a> &nbsp;
		</c:forEach>	
		</td>
	</tr>
</table>

<form name="hiddenFrm2" method="post" action="/empDetail.do">
	<input type="hidden" name="empno" id="empno"/>
</form>

<form name="hiddenFrm" method="post" action="/empList.do">
	<input type="hidden" name="pageIndex" id="pageIndex"/>
</form>
</body>
</html>



