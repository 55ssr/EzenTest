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
</head>
<script>
$(function (){
	$("#selectBtn").click(function(){
		
		if($("#pollCheck").val() == "Y") {
			alert("이미 설문에 참여하셨습니다.");
			return false;
		}
		
		var scd = $(':input[id=comm]:radio:checked').val();
		//라디오 버튼이 체크되지 않았을 때 
		if(scd == null){
			alert("체크해주세요");
			return false;
		}
		
		
		if($('input:radio[id=comm]').is(':checked')==true){
			var param = "scd=" + scd;  
			$.ajax({
				type : 'POST',
				data : param,
				url : "<c:url value='/rshVoteSave.do'/>",
				dataType : 'json',

				success : function(data) {
					if (data.result == "ok") {
						alert("참여해 주셔서 감사합니다.");
						self.close();
					} else {
						alert("투표 실패");
					}
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
		}
	});
	$("#cancelBtn").click(function(){
		self.close();
	});
});
</script>
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
</table>
	<form id="enterFrm" method="post"> 
	<input type="hidden" name="pollCheck" id="pollCheck" value="N"/>

		<table class="table table-hover" align="center"
			style="margin-top: 10px; width: 500px;">
			
			<tr>
				<td><strong>제목</strong></td>
			</tr>
			<c:forEach var="vo" items="${vo}">
				<tr>
					<td align="left">
					<input type="radio" id="comm" name="comm" value="${vo.scd}" />
							${vo.comm}
					</td>
				</tr>
			</c:forEach>
			<tr>
			<td align="center">
			<button class="btn btn-link" id="selectBtn" name="selectBtn">[투표]</button>
			<button class="btn btn-link small" id="cancelBtn" name="cancelBtn"><font color="red">[닫기]</font></button>

			</td>
			</tr>
		</table>
	</form>
</body>
</html>