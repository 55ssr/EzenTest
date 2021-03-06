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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>

<script type="text/javascript">
$(function() {
	
	$("#listBtn").click(function(){
		location.href = "<c:url value='/boardAList.do'/>";
	});
	$("#commModBtn").click(function(){
		var pop_title ="popupOpener"
		
		window.open('/commPwdChk.do',pop_title,'width=500, height=600'); 
		
		var frmData = document.commPopupFrm;
		frmData.target = pop_title;
		frmData.action = "/commPwdChk.do";
		frmData.submit();
		
	});
	
	$("#modifyBtn").click(function(){
		if($("#pwd").val() == "") {
			alert("암호를 입력해주세요.");
			return false;
		}
		var loc = "<c:url value='/boardAupdate.do' />";
		var msg = "변경";
		fn_ajax(loc,msg);
	});
	$("#delBtn").click(function(){
		if(confirm("삭제하시겠습니까?")) {
			var loc = "<c:url value='/boardAdelete.do' />";
			var msg = "삭제";
			
			fn_ajax(loc,msg);
		}
	});
	
});

function fn_ajax(loc,msg) {
	
	$.ajax({
		type: 'POST',
		data: $("#board2Frm").serialize(),
		url: loc,
		dataType: "json",
		success: function (data) {
			if(data.cnt > 0) {
				alert(msg + " 처리 됬습니다.");
				location.href = "<c:url value='/boardAList.do'/>";
			} else {
				alert(msg + " : 비밀번호를 확인하세요.");
				$("div#pwdText").text("비밀번호를 확인하시오.").css({
					color : "red"
				});
				document.board2Frm.pwd.focus();
			}
		},
		error: function (error) {
			alert("error : " + error);
		}
	});
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
					<div class="txt_desc">수정 화면 입 니 다.</div></td>
			</tr>
		</table>
		<form name="board2Frm" id= "board2Frm" method="post">
			<table align="center" bgcolor="#cccccc" width=700pt cellspacing="1"
				height="700pt">
				<tr bgcolor="#ffffff">
					<td colspan="2" align="right" style="height: 4%">
				
					 <input type="button" name="listBtn"	id="listBtn" value="글 목록"/></td>
				</tr>
				<tr bgcolor="#ffffff">
					<th width="20%" height="10">제목</th>
					<td><input type="text" name="title" id="title"
						style="width: 99%"value="${boardVO.title }"></td>
				</tr>
				<tr bgcolor="#ffffff">
				<th height="10">비밀번호</th>
				<td><input type="password" name="pwd" id="pwd"
					style="width: 99%" value="">
					<div id ="pwdText"></div>
				</td>
				</tr>
				<tr bgcolor="#ffffff">
					<th height="10">이름</th>
					<td><input type="text" name="name" id="name"
						style="width: 99%" value="${boardVO.name }"></td>
				</tr>
				<tr bgcolor="#ffffff">
					<th>내용</th>
					<td><textarea name="content" id="content"
							style="width: 99%; height: 99%">${boardVO.content }</textarea></td>
				</tr>
				<tr bgcolor="#ffffff" height="10">
					<td colspan="2" align="center"><input type="hidden" name="unq"
						id="unq" value="${boardVO.unq }">
						<input type="button" name="modifyBtn" id="modifyBtn" value="수정">
						<input type="button" name="delBtn" id="delBtn" value="삭제">
						</td>
				</tr>
			</table>
		</form>
		<form id="commPopupFrm" name="commPopupFrm" method="post">
			<c:forEach var="comm" items="${commList }" varStatus="status">
				<table align="center" bgcolor="#cccccc" width=700pt cellspacing="1">
					<tr bgcolor="#ffffff">
						<td width="20pt"><font color="red">+[RE]</font></td>
						<td width="20%" height="50pt">이름 : ${comm.writer }</td>
						<td width="20pt">답</td>
						<td>${comm.comm } 
						<input type="hidden" name="unq" id="unq" value="${comm.unq }"/></td>
						
					</tr>
					<tr bgcolor="#ffffff">
						<td colspan="4">
						<input type="button" name="commModBtn" id="commModBtn" value="답글 수정 OR 삭제 " style="width: 99%">
						</td>
					</tr>

				</table>
			</c:forEach>
			
		</form>
	</div>
</body>
</html>