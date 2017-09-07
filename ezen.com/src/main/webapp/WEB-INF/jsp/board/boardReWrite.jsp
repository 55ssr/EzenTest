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
function fn_action() {
	var f = document.frm;

	if(f.title.value == ""){
		alert("제목을 입력해주세요.");
		return;
	}
	if(f.pwd.value == ""){
		alert("암호를 입력해주세요.");
		return;
	}

	f.submit();
}
</script>
<body>
<div class="header" style="height:50px;">
<jsp:include page="/include/header.jsp"></jsp:include>
</div>

<div class="middle">

<form name="frm" method="post" action="boardReSave.do">
<input type="hidden" name="unq" id="unq" value="${vo.unq}"/>
<input type="hidden" name="fid" id="fid" value="${vo.fid}"/>
<input type="hidden" name="thread" id="thread" value="${vo.thread}"/>
<table border="0" width="600">
	<tr>
		<th style="width:20%;">제목</th>
		<td>
	<input type="text" name="title" id="title" style="width:98%;" value="[Re] ${vo.title}">
		</td>
	</tr>
	<tr>
		<th>암호</th>
		<td>
	<input type="password" name="pwd" id="pwd" style="width:98%;">
		</td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td>
	<input type="text" name="name" id="name" style="width:98%;">
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" id="content" style="width:98%;height:100px;">

----------------------------------------
${vo.content}
			
			</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" id="saveBtn" value="저장" onclick="fn_action()">
		</td>
	</tr>
</table>
</form> 
</div>
</body>
</html>