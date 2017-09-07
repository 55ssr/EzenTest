<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/include/link.jsp"></jsp:include>
</head>

<script>
$( function() {
  $( "#birthday" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
} );
</script>

<script>
$(function() {
	
	$("#saveBtn").click(function(){
		
		if($("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if($("#pwd").val() == "") {
			alert("암호를 입력해주세요요요요.");
			return false;
		}
		$.ajax({
			type: 'POST',
			data: $("#frm").serialize(),
			url: "<c:url value='/login.do' />",
			dataType: "json",
 
			success: function (data) {
				if(data.cnt > 0) {
					alert("로그인 되었습니다.");
					location.href = "<c:url value='/main.do'/>";
				} else if(data.cnt == 0) {
					alert("아이디와 패스워드를 다시 체크해 주세요.");
				} else {
					alert("관리자에게 연락주세요.");
				}
			},
			error: function (error) {
				alert("error : " + error);
			}
		});
	});
});

</script>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<div class="header" style="height:50px;">
<jsp:include page="/include/header.jsp"></jsp:include>
</div>

<div class="middle">

<form name="frm" id="frm">
<table border="0" width="600">
	<tr>
		<td align="right">
		<input type="button" value="목록" onClick="location.href='/memberList.do'">
		</td>
	</tr>
</table>
<table width="600" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
	<tr>
		<th width="20%"><spring:message code="member.userid"/></th>
		<td align="left">
		<input type="text" name="userid" id="userid" style="width:50%;">
		</td>
	</tr>
	<tr>
		<th><spring:message code="member.pwd"/></th>
		<td align="left"><input type="password" name="pwd" id="pwd" style="width:50%"></td>
	</tr>
	<tr align="center">
		<td colspan="2" height="40">
		<input type="button" id="saveBtn" value="로그인" style="width:100px;">
		</td>
	</tr>
</table>
</form>

</div>

</body>
</html>