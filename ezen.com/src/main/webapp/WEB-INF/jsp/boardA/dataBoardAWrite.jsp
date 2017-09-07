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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
$(function() {
	$("#dataWriteBtn").click(function(){
		if($("#pwd").val() == "") {
			$("div#pwdText").text("비밀번호를 확인하시오.").css({
				color : "red"
			});
			document.dataFrm.pwd.focus();
		}
		var loc = "<c:url value='/dataBoardWriteSave.do' />";
		var msg = "저장";
		fn_ajax(loc,msg);
	});
	
});

function fn_ajax(loc,msg) {
	
	var param = new FormData(document.getElementById('dataFrm'));
	
	
	$.ajax({
		type: 'POST',
		data: param,
		url: loc,
		dataType: "json",
		processData: false,
		contentType: false,
		success: function (data) {
			if(data.cnt > 0) {
				alert(msg + " 완료.");
				location.href = "<c:url value='/dataBoardList.do'/>";
			}else if(data.result=="ok"){
				alert(msg + " 완료.");
				location.href = "<c:url value='/dataBoardList.do'/>";
			}
			else {
				if ($("#pwd").val() != $("#pwd2").val()) {
				$("div#pwdText").text("비밀번호를 확인하시오.").css({
					color : "red"
				});
				document.dataFrm.pwd.focus();
				}
				else{
				alert(msg+" 실패");					
				}
			}
		},
		error: function (error) {
			alert("error : " + error);
		}
	});
}
function pwdCheck() {
	
	if ($("#pwd").val() == $("#pwd2").val()) {
		$("div#pwdChkText").text("위의 암호와 같습니다.").css({
			color : "green"
		});
	} else {
		$("div#pwdChkText").text("암호가 다릅니다.").css({
			color : "red"
		});
	}
}
</script>
<body>
<table class="table table-hover" align="center" style="margin-top: 50px; width: 700px; height: 50px;">
		<tr height="40">
			<td align="center" bgcolor="#ffffff"><br>
				<h1 align="center"><font color="RED"><strong>FILE UPLOAD</strong></font></h1>
				<div class="txt_desc">RYU SEOKHYUN</div></td>
		</tr>
		<tr height="10">
		<td align="right">
			<button type="button" class="btn btn-link" onclick="location.href='dataBoardList.do'">List</button>
		<!-- <button type="button" class="btn btn-link" onclick="location.href='dataBoardAWrite.do'">게시글 쓰기</button> -->
		</td>
	</tr>
	</table>
	<form id="dataFrm" method="post" enctype="multipart/form-data">
	
	<table class="table table-hover" align="center" style="margin-top: 10px; width: 700px; height: 700px;">
	<!-- <tr>
		<td align="right">
		
		</td>
	</tr> -->
		<tr>
		<td>
			<label for="title">Title</label> <input type="text"
				class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
		</td>
		</tr>
		<tr>
		<td>
		<label for="name">Name</label> <input type="text"
				class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
		</td>
		</tr>
		<tr>
		<td>
		<label for="pwd">Password</label> 
		<input type="password" class="form-control" id="pwd" name="pwd" placeholder="암호">
				<div id="pwdText"></div>
		</td>
		</tr>
		<tr>
			<td>
			<label for="pwd2">Password Check</label>
		<input class ="form-control" type="password" name="pwd2" id="pwd2" style="width: 99%" value="" onkeyup="pwdCheck()" placeholder="중복검사">
			<div id="pwdChkText"></div>
			</td>
		</tr>
		<tr>
		<td height="400px">
		<label for="content">content</label>
			 <textarea class="form-control" name="content" id="content" placeholder="내용을 입력하세요 "style="width: 99%; height: 95%;"></textarea>
		</td>
		</tr>
		<tr>
		<td align="center">
		<label for="inputFile">file upload -1-</label>
		 <input type="file" name="file1" size="70">
		 <p class="help-block">파일은 1GB를 초과할 수 없습니다.</p>
		 </td>
		</tr>
		<tr>
		 <td align="center">
		 <label for="inputFile">file upload -2-</label> 
		 <br>
		 <input type="file" name="file2" size="70">
		 <p class="help-block">파일은 1GB를 초과할 수 없습니다.</p>
		</td>
		</tr>
		<tr>
		<td align="center">
		<button type="button" class="btn btn-success" id="dataWriteBtn">전송</button>
		</td>
		</tr>
	</table>

	</form>
</body>
</html>