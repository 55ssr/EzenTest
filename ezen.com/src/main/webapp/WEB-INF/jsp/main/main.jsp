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

function fn_vote(u){
	var f = document.hiddenFrm22;
	f.unq.value = u;
	var popUrl = "/rshEnter.do?mcd="+u;
	var popOption = "width=600, height=700, resizable=no, scrollbars=yes;";
	window.open(popUrl,"",popOption);
	/* f.submit(); */
}
//////////////////아래형태 강사님
function fn_result(u){
	var f = document.hiddenFrm22;
	
	url = "<c:url value='/rshVoteResult.do'/>";
	var popOption = "width=600, height=700, resizable=no, scrollbars=yes;";
	window.open("","poll_popup",popOption);
	
	
	f.unq.value = u;
	f.target="poll_popup";
	f.action=url;
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
		<table class="table table-hover" align="center"
			style="margin-top: 10px; width: 700px;">
			<tr>
				<td><strong>제목</strong></td>
				<td align="center" width="20%"><strong>기간</strong></td>
				<td align="center" width="20%"><strong>투표 OR 기간</strong></td>
			</tr>
			<c:forEach var="rsh" items="${list }" varStatus="status"> 
				<tr>
					<td align="left">
							${rsh.title }   
					</td>
					<td align="center"> 
					<c:if test="${rsh.available== 'end' }"><strong><font color="red">기간 종료</font></strong></c:if>
					<c:if test="${rsh.available!= 'end' }"><strong><font color="green">${rsh.available}</font></strong></c:if>
					
					</td>
					<td align="center">
						<c:if test="${rsh.available== 'end' }">
							<button class="btn btn-link small" onclick="fn_result('${rsh.mcd }')"><font color="red">[결과]</font></button>
						</c:if>
						<c:if test="${rsh.available!= 'end' }">
						<button class="btn btn-link" onclick="fn_vote('${rsh.mcd }')">[투표]</button>
						<button class="btn btn-link small" onclick="fn_result('${rsh.unq }')"><font color="red">[결과]</font></button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			
			<!-- 지워도됨 -->
			<tr>
			<td><td><td>
			</tr>
			<!-- 지워도됨 -->
			
		</table>
	<form name="hiddenFrm22" id="hiddenFrm22" method="post" action="<c:url value='/rshEnter.do' />">
		<input type="hidden" name="mcd" id="mcd" />
		<input type="hidden" name="unq" id="unq" />
	</form>

</body>
</html>