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
<style type="text/css">
.show {
	display: block !important;
}

.hidden {
	display: none !important;
	visibility: hidden !important;
}

.invisible {
	visibility: hidden;
}

//
Usage as mixins
.element { .show ();
	
}

.another-element { .hidden ();
	
}
</style>
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
	
		
		$("#fileUpload").click(function(){
		var filename = document.getElementById('file2').value;
		alert(filename);
			
			
			if (filename == ''){
				
				alert("파일을 선택해 주세요");
				
			}
			else{
				
				var param = new FormData(document.getElementById('dataFrm'));
				
				
				$.ajax({
					type: 'POST',
					data: param,
					url: "<c:url value='/dataBoardDetailUpdate.do' />",
					dataType: "json",
					processData: false,
					contentType: false,
					success: function (data) {
						if(data.update > 0) {
							alert("파일 업로드 처리 됬습니다.");
							location.reload();
						} else {
							alert("오류");
						}
					},
					error: function (error) {
						alert("error : " + error);
					}
				});
				
				}
		});
		
		
	$("#dataModBtn").click(function(){
		
			if($("#pwdNone").css("display")=="none"){
				$("#pwdNone").show();
				}
			//2번째 클릭했을 때
			$("#dataModBtn").click(function(){

			if($("#pwd").val() != null ){
				var loc = "<c:url value='/dataBoardUpdate.do' />";  
				var msg = "수정";
				fn_ajax(loc,msg);
			}
			
			});

	});
	
	$("#dataDelBtn").click(function(){
		if($("#pwdNone").css("display")=="none"){
			$("#pwdNone").show();
		}
		var loc = "<c:url value='/uploadFileDelete.do' />";
		var msg = "삭제";
		fn_ajax(loc,msg);
	});

/* 	$("#fileDelBtn_1").click(function(){
		var filename = $("#filename").val();
		if($("#pwdNone").css("display")=="none"){
			$("#pwdNone").show();
		}else if ($("#pwd").val() != null){
		var param = ""+
		
		
		$.ajax({
			type: 'POST',
			data: param,
			url: "<c:url value='/dataBoardDelete.do'/>",
			dataType: "json",
			processData: false,
			contentType: false,
			success: function (data) {
				if(data.cnt > 0) {
					alert("파일 삭제 처리 됬습니다.");
					location.reload();
				} else {
					document.dataFrm.pwd.focus();
					$("div#pwdText").text("비밀번호를 확인하시오.").css({
						color : "red"
					});
				}
			},
			error: function (error) {
				alert("error : " + error);
			}
		});
			
		}
	});
	
	$("#fileDelBtn_2").click(function(){
		if($("#pwdNone").css("display")=="none"){
			$("#pwdNone").show();
		}
		else if ($("#pwd").val() != null){
			
		var param = new FormData(document.getElementById('dataFrm'));
		
		
		$.ajax({
			type: 'POST',
			data: param,
			url: "<c:url value='/dataBoardDelete.do'/>",
			dataType: "json",
			processData: false,
			contentType: false,
			success: function (data) {
				if(data.cnt > 0) {
					alert("파일 삭제 처리 됬습니다.");
					location.reload();
				} else {
					document.dataFrm.pwd.focus();
					$("div#pwdText").text("비밀번호를 확인하시오.").css({
						color : "red"
					});
				}
			},
			error: function (error) {
				alert("error : " + error);
			}
		});
			
		}
	});
	 */
	
	
});


function fn_ajax(loc,msg) {
		/* var f = document.dataFrm;
		var unq = f.unq.value; */
		var param = new FormData(document.getElementById('dataFrm')); 
		/* var param = "unq="+ unq
			param += "&title="+$("#title").val()
			param += "&pwd="+$("#pwd").val()
			param += "&content="+$("#content").val(); */
	
	$.ajax({
		type: 'POST',
		data: param,
		url: loc,
		dataType: "json",
		processData: false,
		contentType: false,
		success: function (data) {
			if(data.cnt > 0) {
				alert(msg + " 처리 됬습니다.");
				location.href = "<c:url value='/dataBoardList.do'/>";
			} else {
				document.dataFrm.pwd.focus();
				$("div#pwdText").text("비밀번호를 확인하시오.").css({
					color : "red"
				});
			}
		},
		error: function (error) {
			alert("error : " + error);
		}
	});
}
function fn_delete(unq,filename){
	if($("#pwdNone").css("display")=="none"){
		$("#pwdNone").show();
		if($("#pwd").val() == "") {
			alert("본문에 패스워드를 입력해주세요.");
			return;
		}
	}
	if(confirm("삭제처리 하시겠습니까?")) {
	/* var param = "unq="+ unq
	param += "&filename="+ filename
	param += "&pwd="+$("#pwd").val();
	alert(param);
 */
	$.ajax({
	type: 'POST',
	data: 'unq='+unq+"&filename="+filename+"&pwd="+$("#pwd").val(),
	url: "<c:url value='/dataBoardDelete.do'/>", 
	dataType: "json",
	success: function (data) {
		
			alert(msg + " 처리 됬습니다.");
			location.reload();
		
	},
	error: function (error) {
		alert("error : " + error);
	}
	});
	}
	}
</script>
<body>
	<table class="table table-hover" align="center"
		style="margin-top: 50px; width: 700px; height: 50px;">
		<tr height="40">
			<td align="center" bgcolor="#ffffff"><br>
				<h1 align="center">
					<font color="RED"><strong>FILE UPLOAD</strong></font>
				</h1>
				<div class="txt_desc">RYU SEOKHYUN</div></td>
		</tr>
		<tr height="10">
			<td align="right">
				<button type="button" class="btn btn-link"
					onclick="location.href='dataBoardAWrite.do'">게시글 쓰기</button>
			</td>
		</tr>
	</table>
	<form id="dataFrm" name="dataFrm" method="post"
		enctype="multipart/form-data">

		<input type="hidden" id="unq" name="unq" value="${data.unq }" />
		<table class="table table-hover" align="center"
			style="margin-top: 10px; width: 700px; height: 700px;">
			<tr>
				<td align="right" colspan="2">
					<button type="button" class="btn btn-link"
						onclick="location.href='dataBoardList.do'">List</button>
				</td>
			</tr>
			<tr>
				<td colspan="2"><label for="title">Title</label> <input
					type="text" value="${data.title}" class="form-control" id="title"
					name="title" placeholder="제목을 입력하세요"></td>
			</tr>
			<tr>
				<td colspan="2"><label for="name">Name</label> <input
					type="text" value="${data.name}" class="form-control" id="name"
					name="name" placeholder="이름을 입력하세요"></td>
			</tr>
			<tr id="pwdNone" style="display: none;">
				<td colspan="2"><label for="pwd">password</label> <input
					type="password" class="form-control" id="pwd" name="pwd"
					placeholder="암호">
					<div id="pwdText"></div></td>
			</tr>
			<tr>
				<td height="400px" colspan="2"><label for="content">content</label>
					<textarea class="form-control" name="content" id="content"
						placeholder="내용을 입력하세요 " style="width: 99%; height: 95%;">${data.content}</textarea>
				</td>
			</tr>
			<tr>
				<td align="center"><c:set var="num" value="1" /> <c:set
						var="filename" value="${fn:split(data.filename, '／' )}" />
						 <c:forEach	var="down" items="${filename }" varStatus="a">
						
						<c:if test="${down != '' }">
							<label for="inputFile">FILE DOWNLOAD</label>


							<br>
						FILE NAME  : [   ${down }   ]<br>
							<a href="#"
								onclick="window.open(encodeURI('<c:url value='downloadFile.do?'/>requestedFile=${down }'))">download</a>

							<td>
								<button type="button"
									onclick="fn_delete('${data.unq }','${down }')"
									class="btn btn-link">
									<font color="red"><strong>삭제</strong></font>
								</button>
						</c:if>

						<c:if test="${a.count  == 1 }">
							<tr>
								<td align="center">
						</c:if>
						<c:if test="${data.filename == null }">
							<tr>
								<td align="center" colspan="2"><label for="inputFile">파일
										추가</label> <br> <input type="file" id="file2" name="file2"
									size="70">
									<button id="fileUpload" class="btn btn-link">
										<font color="red">파일 첨부</font>
									</button>
									<p class="help-block">파일선택 후 위의 버튼을 눌러주어야 업로드 됩니다.</p>
						</c:if>
						<c:set var="num" value="${num+1 }" />
					</c:forEach></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="button" class="btn btn-warning" id="dataModBtn">수정</button>
					<button type="button" class="btn btn-danger" id="dataDelBtn">삭제</button>
					<button type="button" class="btn btn-danger" id="test">test</button>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>