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
			alert("암호를 입력해주세요.");
			return false;
		}
		//var form = new FormData(document.getElementById('frm'));

		//var gender = $(":input:radio[id=gender]:checked").val();
/* 		
		var param = "userid="+$("#userid").val()
			param +="&name="+$("#name").val()
			param +="&pwd="+$("#pwd").val()
			param +="&birthday="+$("#birthday").val()
			param +="&phone="+$("#phone").val()
			param +="&postnum="+$("#postnum").val()
			param +="&addr1="+$("#addr1").val()
			param +="&gender="+gender;
		
		alert(param);
		 */
		$.ajax({
			type: 'POST',
			data: $("#frm").serialize(),
			url: "<c:url value='/memberSave.do' />",
			dataType: "json",
 
			success: function (data) {
				if(data.result == "ok") {
					alert("저장됬습니다.");
					location.href = "<c:url value='/memberList.do'/>";
				} else {
					alert("저장에 실패");
				}
			},
			error: function (error) {
				alert("error : " + error);
			}
		});
	});
});

function idCheck() {
	var userid = document.frm.userid.value;
	if(userid.length < 4 || userid.length > 12) {
		alert("아이디는 4 ~ 12자 사이로 입력 ~");
		return;
	}
	var param = "userid="+userid;
	$.ajax({
		type: 'POST',
		data: param,
		url: "<c:url value='/memberIdCheck.do' />",
		dataType: "json",
		success: function (data) {
			if(data.cnt > 0) {
				alert("사용중인 아이디입니다.");
			} else {
				alert("사용가능한 아이디입니다.");
			}
		},
		error: function (error) {  alert("error : " + error);  }
	});
}

function postSearch() {
	var url = "/post1.do";
	window.open(url,"post_popup","width=400,height=300;");
}
</script>
<style>
	input { height:22px; }
</style>
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
		<input type="button" value="아이디중복체크" onclick="idCheck()">
		</td>
	</tr>
	<tr>
		<th><spring:message code="member.pwd"/></th>
		<td align="left"><input type="password" name="pwd" id="pwd" style="width:50%"></td>
	</tr>
	<tr>
		<th><spring:message code="member.name"/></th>
		<td align="left"><input type="text" name="name" id="name" style="width:50%"></td>
	</tr>
	<tr>
		<th><spring:message code="member.birthday"/></th>
		<td align="left"> <input type="text" name="birthday" id="birthday"> </td>
	</tr>
	<tr>
		<th><spring:message code="member.gender"/></th>
		<td align="left"><input type="radio" name="gender" id="gender" value="M">남,
			<input type="radio" name="gender" id="gender" value="F">여
		</td>
	</tr>
	<tr>
		<th><spring:message code="member.phone"/></th>
		<td align="left"><input type="text" name="phone" id="phone" style="width:98%"></td>
	</tr>
	<tr>
		<th><spring:message code="member.addr1"/></th>
		<td align="left">
			<input type="text" name="postnum" id="postnum" style="width:100px;">
			<input type="button" value="우편번호찾기" onclick="postSearch()"><br>
			<input type="text" name="addr1" id="addr1" style="width:98%"><br>
			<input type="text" name="addr2" id="addr2" style="width:98%">
		</td>
	</tr>
	<tr align="center">
		<td colspan="2" height="40">
		<input type="button" id="saveBtn" value="<spring:message code="button.create"/>" style="width:100px;">
		</td>
	</tr>
</table>
</form>

</div>

</body>
</html>