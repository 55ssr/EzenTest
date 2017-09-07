<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/egovframework/join_reform.css">
<link rel="stylesheet" href="../css/egovframework/join_reform_font.css">
</head>
<script src="js/jquery-2.2.2.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$("#saveBtn").click(function() {
			var f = document.boardFrm;
			if (f.title.value == "") {

				$("div#titleText").text("제목을 입력하시오.").css({
					color : "red"
				});
				f.title.focus();
				return;
			}
			if (f.content.value == "") {
				$("div#contentText").text("내용을 입력하시오.").css({
					color : "red"
				});
				f.content.focus();
				return;
			}
			if (f.name.value == "") {
				$("div#nameText").text("이름을 입력하시오.").css({
					color : "red"
				});
				f.name.focus();
				return;
			}

			var param = "title=" + $("#title").val()
			param += "&pwd=" + $("#pwd").val()
			param += "&name=" + $("#name").val()
			param += "&content=" + $("#content").val();


			$.ajax({
				type : 'POST',
				data : param,
				url : "<c:url value='/boardASave.do' />",
				dataType : "json",

				success : function(data) {
					
					if (data.result == "ok") {
						alert("글쓰기 완료");
						location.href = "<c:url value='/boardAList.do'/>";
					} else {
						alert("글쓰기 실패");
					}
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
		});

	});
function pwdCheck() {
	var f = document.boardFrm;
	var pwdC1 = f.pwd.value;
	var pwdC2 = f.pwd2.value;
	if (pwdC1 == pwdC2) {
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
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="middle">

		<table align="center" border="0" cellspacing="1" bgColor="#cccccc"
			width="700pt" height="150">
			<tr height="50">
				<td align="center" bgcolor="#ffffff"><br>
					<h3 class="tit_join">[ 게 시 팔 ]</h3> <br>
					<div class="txt_desc">게 시 팔 입 니 다.</div></td>
			</tr>
		</table>
		<form name="boardFrm" method="post" action="/boardASave.do">
			<table align="center" bgcolor="#cccccc" width=700pt cellspacing="1"
				height="700pt">
				<tr bgcolor="#ffffff">
					<th width="20%" height="10">제목</th>
					<td><input type="text" name="title" id="title"
						style="width: 99%" placeholder="제목을 입력하세요.">
						<div id="titleText"></div></td>
				</tr>
				<tr bgcolor="#ffffff">
					<th height="10">비밀번호</th>
					<td><input type="password" name="pwd" id="pwd"
						style="width: 99%" placeholder="비밀번호를 입력하세요.">
				</tr>
				<tr bgcolor="#ffffff">
				<th height="5pt">비밀번호 확인</th>
				<td><input type="password" name="pwd2" id="pwd2" style="width: 99%"
					value="" onkeyup="pwdCheck()" placeholder="비밀번호를 위와 같이 쓰세요. 확인합니다.">
					<div id="pwdChkText"></div></td>
				</tr>
				<tr bgcolor="#ffffff">
					<th height="10">이름</th>
					<td><input type="text" name="name" id="name"
						style="width: 99%" value="" placeholder="이름을 입력하세요." /> 
						<!-- <input type="text" name="name" id="name" style="width: 99%"> -->
						<div id="nameText"></div></td>
				</tr>

				<tr bgcolor="#ffffff">
					<th>내용</th>
					<td><textarea name="content" id="content" placeholder="내용을 입력하세요."
							style="width: 99%; height: 99%"></textarea></td>
				</tr>
				<tr bgcolor="#ffffff" height="10">
					<td colspan="2" align="center"><input type="button" value="저장"
						name="saveBtn" id="saveBtn" /></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>