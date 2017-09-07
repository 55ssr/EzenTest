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
	$(function (){
		$("#modBtn").click(function(){
			var f = document.boardFrm;
			f.action="/boardADetail2.do";
			f.submit();
			
			
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#listBtn").click(function(){
			location.href = "<c:url value='/boardAList.do'/>";
		});

		$("#commBtn").click(function() {
			var f = document.commFrm;
			if (f.writer.value == "") {

				$("div#writerText").text("답글 본인의 이름을 입력하시오.").css({
					color : "red"
				});
				f.title.focus();
				return false;
			}
			if (f.comm.value == "") {
				$("div#commText").text("내용을 입력하시오.").css({
					color : "red"
				});
				f.content.focus();
				return false;
			}
			if (f.pwd.value == "") {
				$("div#pwdText").text("이름을 입력하시오.").css({
					color : "red"
				});
				f.name.focus();
				return false;
			} else {
				var params = "writer=" + $("#writer").val()
				params += "&pwd=" + $("#pwd").val()
				params += "&comm=" + $("#comm").val()
				params += "&fid=" + $("#unq").val();


				$.ajax({
					type : 'POST',
					data : params,
					url : "<c:url value='/boardACommSave.do' />",
					dataType : "json",
					success : function(data) {
						if (data.result == "ok") {
							alert("답글 완료");
							location.reload();
						} else {
							alert("답글 실패");
						}
					},
					error : function(error) {
						alert("에러ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ" + error);
					}
				});
			}
		});
	});
</script>
<body>

	<jsp:include page="/include/header.jsp"></jsp:include>


	<div class="middle">
		<table align="center" border="0" cellspacing="1" bgColor="#cccccc"
			width="700pt" height="150">
			<tr height="50">
				<td align="center" bgcolor="#ffffff"><br>
					<h3 class="tit_join">[ 게 시 판 ]</h3> <br>
					<div class="txt_desc">게 시 판 입 니 다.</div></td>
			</tr>
		</table>
		<form name="boardFrm" id="boardFrm" method="post">
			<table align="center" bgcolor="#cccccc" width=700pt cellspacing="1"
				height="700pt">
				<tr bgcolor="#ffffff">
					<td colspan="2" align="right" style="height: 4%">
					<font color="red">댓글 수정 또한 ----></font>
					<input type="button" value="수정" id="modBtn" name="modBtn" />
					 <input type="button" id="listBtn" name="listBtn" value="글 목록" /></td>
				</tr>
				<tr bgcolor="#ffffff">
					<th width="20%" height="10">제목</th>
					<td>${boardVO.title }</td>
				</tr>
				<!-- <tr bgcolor="#ffffff">
				<th height="10">비밀번호</th>
				<td><input type="password" name="pwd" id="pwd"
					style="width: 99%" value=""></td>
			</tr> -->
				<tr bgcolor="#ffffff">
					<th height="10">이름</th>
					<td>${boardVO.name }</td>
				</tr>
				<tr bgcolor="#ffffff">
					<th>내용</th>
					<td><textarea name="content" id="content" disabled="disabled"
							style="width: 99%; height: 99%">${boardVO.content }</textarea></td>
				</tr>
				<tr bgcolor="#ffffff" height="10">
					<td colspan="2" align="center"><input type="hidden" name="unq"
						id="unq" value="${boardVO.unq }"></td>
				</tr>
			</table>
		</form>
		<form id="commFrm" name="commFrm" action="/commSave.do">
			<c:forEach var="comm" items="${commList }" varStatus="status">
				<table align="center" bgcolor="#cccccc" width=700pt cellspacing="1">
					<tr bgcolor="#ffffff">
						<td width="20pt"><font color="red">+[RE]</font></td>
						<td width="20%" height="50pt">이름 : ${comm.writer }</td>
						<td width="20pt">답</td>
						<td>${comm.comm }</td>
					</tr>

				</table>
			</c:forEach>
			<table align="center" bgcolor="#cccccc" width=700pt cellspacing="1"
				style="margin-top: 50px;" height="200pt">
				<tr bgcolor="#ffffff">
					<td colspan="2"><font color="red">=== [RE] ===</font></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="50%">이름<br> <input type="text" name="writer"
						id="writer" />
						<div id="writerText"></div>
					</td>
					<td width="50%">비밀번호<input type="password" name="pwd" id="pwd" />
						<div id="pwdText"></div>
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="2">REPLY
						<div id="commText"></div>
					</td>
				</tr>
				<tr bgcolor="#ffffff" height="100pt">
					<td colspan="2"><textarea name="comm" id="comm"style="width: 99%; height: 99%"placeholder="댓글을 입력하세요."></textarea>
					</td>
				</tr>

				<tr bgcolor="#ffffff">
					<td colspan="2"><input type="button" name="commBtn"
						id="commBtn" value="답글달기" style="width: 99%; height: 99%"
						onclick="fn_test()" /></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>