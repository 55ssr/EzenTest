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
<script src="js/jquery-2.2.2.js"></script>
<script src="js/jquery-ui.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$("#pwdBtn").click(function() {
			var loc = "<c:url value='/pwdCheck.do'/>";
			var msg = "MSG";
			fn_ajax(loc, msg);
		});
	});
	function fn_ajax(loc, msg) {
		
		$.ajax({
			type : 'POST',
			data : $("#pwdChkFrm").serialize(),
			url : loc,
			dataType : "json",
			success : function(data) {
				if (data.cnt > 0) {
					alert(msg + " 처리 됬습니다.");
					opener.parent.location.href = "<c:url value='/boardADetail2.do'/>";
					self.close();
				} else {
					alert(msg + " : 비밀번호를 확인하세요.");

				}
			},
			error : function(error) {
				alert("error : " + error);
			}
			});
	}
	function pwdCheck() {
		var f = document.pwdChkFrm;
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
	<form id="pwdChkFrm" name="pwdChkFrm">
		<table align="center" border="0" cellspacing="1" bgColor="#cccccc"
			width="400pt" height="150">
			<tr height="50">
				<td align="center" bgcolor="#ffffff"><br>
					<h3 class="tit_join">[ 비밀번호확인 ]</h3> <br>
					<div class="txt_desc">비밀번호확인.</div></td>
			</tr>
		</table>
		<input type="hidden" id="unq" name="unq" value="${boardVO.unq }" />
		<table align="center" border="0" cellspacing="1" bgColor="#cccccc"
			width="400pt" height="80">

			<tr bgcolor="#ffffff">

				<th height="5pt">비밀번호</th>

				<td colspan="4" align="center"><input type="password"
					name="pwd" id="pwd" value="" /></td>

			</tr>
			<tr bgcolor="#ffffff">
				<th height="5pt">비밀번호 확인</th>
				<td align="center"><input type="password" name="pwd2" id="pwd2"
					value="" onkeyup="pwdCheck()">
					<div id="pwdChkText"></div></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td colspan="4" align="center"><input type="button"
					name="pwdBtn" id="pwdBtn" value="확인"></td>
			</tr>
		</table>
	</form>

</body>
</html>