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
		var loc = "<c:url value='/memberUpdate.do' />";
		var msg = "변경";
		fn_ajax(loc,msg);
	});
	$("#deleteBtn").click(function(){
		if(confirm("삭제하시겠습니까?")) {
			var loc = "<c:url value='/memberDelete.do' />";
			var msg = "삭제";
			
			fn_ajax(loc,msg);
		}
	});
	
});

function fn_ajax(loc,msg) {
	$.ajax({
		type: 'POST',
		data: $("#frm").serialize(),
		url: loc,
		dataType: "json",
		success: function (data) {
			if(data.cnt > 0) {
				alert(msg + " 처리 됬습니다.");
				location.href = "<c:url value='/memberList.do'/>";
			} else {
				alert(msg + " 처리 실패");
			}
		},
		error: function (error) {
			alert("error : " + error);
		}
	});
}


function postSearch() {
	var url = "/post1.do";
	window.open(url,"post_popup","width=400,height=300;");
}
</script>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<div class="header" style="height:50px;">
<jsp:include page="/include/header.jsp"></jsp:include>
</div>

<div class="middle">
<table border="0" width="600">
	<tr>
		<td align="right">
		<input type="button" value="목록" onclick="location.href='/memberList.do'">
		<input type="button" id="deleteBtn" value="삭제">
		</td>
	</tr>
</table>
<form name="frm" id="frm">
<table border="1" width="600">
	<tr>
		<th width="20%"><spring:message code="member.userid"/></th>
		<td align="left">
		<input type="text" name="userid" id="userid" value="${vo.userid}" style="width:50%;" readonly>
		</td>
	</tr>
	<tr>
		<th><spring:message code="member.name"/></th>
		<td align="left"><input type="text" name="name" id="name" value="${vo.name}" style="width:50%"></td>
	</tr>
	<tr>
		<th><spring:message code="member.birthday"/></th>
		<td align="left"> <input type="text" name="birthday" value="${vo.birthday}" id="birthday"> </td>
	</tr>
	<tr>
		<th><spring:message code="member.gender"/></th>
		<td align="left"><input type="radio" name="gender" id="gender" value="M" 
			<c:if test="${vo.gender =='M'}">checked</c:if>
		     >남
			<input type="radio" name="gender" id="gender" value="F"
			<c:if test="${vo.gender =='F'}">checked</c:if>
			>여
		</td>
	</tr>
	<tr>
		<th><spring:message code="member.phone"/></th>
		<td align="left"><input type="text" name="phone" id="phone" value="${vo.phone}" style="width:98%"></td>
	</tr>
	<tr>
		<th><spring:message code="member.addr1"/></th>
		<td align="left"><input type="text" name="postnum" id="postnum" value="${vo.postnum}" style="width:100px;">
		<input type="button" value="우편번호찾기" onclick="postSearch()">
		<br>
		<input type="text" name="addr1" id="addr1" value="${vo.addr1}" style="width:98%">
		<br>
		<input type="text" name="addr2" id="addr2" value="${vo.addr2}" style="width:98%">
		</td>
	</tr>
	<tr align="center">
		<th colspan="2" height="40">
		<input type="button" id="saveBtn" value="<spring:message code="button.create"/>" style="width:100px;">
		</th>
	</tr>
</table>
</form>

</div>

</body>
</html>