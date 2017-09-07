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
<link rel="stylesheet" type="text/css" href="/css/iGraph.css"/>
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		self.close();
	});
});

</script>
</head>
<body>
<table class="table table-hover" align="center"
		style="margin-top: 50px; width: 500px; height: 50px;">
		<tr height="40">
			<td align="center" bgcolor="#ffffff"><br>
				<h1 align="center">
					<font color="BLUE"><strong>${title.title}</strong></font>
				</h1>
			</td>
		</tr>
		<tr>
			<td>
		
			</td>
		</tr>
</table>
	<form id="chartFrm" method="post">
		<table class="table table-hover" align="center"
			style="margin-top: 10px; width: 500px;">
			<tr>
				<td colspan="2"><strong>항목</strong></td>
			<c:forEach var="vo" items="${voteResult}">
				<tr>
					<td align="left">
					
							${vo.comm}
					</td> 
					<td>
						<ul>
							<li class="iGraph">
								<span class="gBar"><span class="gAction" style="width:${vo.per}%"></span></span>
								<span class="gPercent"><strong>${vo.per }</strong>%</span>
								<span class="gPercent">투표수 :<strong>${vo.cnt }</strong></span>
							</li>
						
						</ul>
					</td>
				</tr>
				
			</c:forEach>
			<tr>
			<td align="center" colspan="2">
			<button class="btn btn-link small" id="cancelBtn" name="cancelBtn"><font color="red">[닫기]</font></button>

			</td>
			</tr>
		</table>
	</form>
</body>
</html>