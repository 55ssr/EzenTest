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
	<link rel="stylesheet" type="text/css" href="//fonts/font.css"/>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/rb-switcher.css'/>"/> --%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
<script src="js/jquery-2.2.2.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		$("#modBtn").click(function() {
			if ($("#title").val() == "") {
				alert("설문 제목을 입력해주세요.");
				return false;
			}
			if ($("#comm").val() == "") {
				alert("설문 내용을 입력해주세요.");
				return false;
			}
			var param = new FormData(document.getElementById('modFrm'));

			$.ajax({
				type : 'POST',
				data : param,
				url : "<c:url value='/rshWriteModify.do'/>",
				dataType : 'json',
				
				processData : false,
				contentType : false,

				success : function(data) {
					
					if (data.result == "ok") {
						location.href = "<c:url value='/rshList.do'/>";
						alert("저장 성공.");
					} else {
						alert("저장 실패");
					}
				},
				error : function(error) {
					alert("error : " + error);
				}
			});

		});
	});

	</script>
<body>
	<table class="table table-hover" align="center"
		style="margin-top: 50px; width: 700px; height: 50px;">
		<tr height="40">
			<td align="center" bgcolor="#ffffff"><br>
				<h1 align="center">
					<font color="RED"><strong>RESEARH</strong></font>
				</h1>
				<div class="txt_desc">RYU SEOKHYUN</div></td>
		</tr>
		<tr height="10">
			<td align="right">
				<button type="button" class="btn btn-link"
					onclick="location.href='rshList.do'">List</button>
			</td>
		</tr>
	</table>
	<form id="modFrm" method="post">
		<table class="table table-hover" align="center" style=" width: 700px;">
			<tr height="50px">
				<td><label for="title">설문 제목</label></td>
				<td><input type="text" class="form-control" id="title"
					name="title" value="${rsh.title }" /></td>
			</tr>



			<tr>

				<c:set var="num" value="1" />
				<c:set var="end" value="10" />
			<tr>
				<td rowspan="2">
				<label for="rshList">항 목</label>
				</td>
			</tr>
			<tr>
			<td>
			<!-- 항목 자동 생성 end가 항목 갯수 위의 c:set value 변경 -->
			<table class="table table-hover" style="width: 600px;">
			<c:forEach var="commList" items="${list }">
				


					<tr>
						<td>${num}.
						<input type="text" class="form-control"	id="comm" name="comm" value="${commList.comm }"/>
						</td>
					</tr>

					<c:set var="num" value="${num+1}" />
					<c:set var="del" value="${10-num}" />
					<c:set var="end" value="${end-del}" />
					
				</c:forEach>
			</table>
			</td>
			</tr>
			</table>
			<!-- List e -->
			<table class="table table-hover" align="center" style="width: 700px;">
			<tr height="50px" style="margin-bottom: 50px;">
				<td rowspan="2"><label for="title">기 간</label></td>

				<td>설문 시작 <input type="date" class="form-control" id="sdate"
					name="sdate" readonly="readonly"> <!-- 오늘 날짜  --> <script>
						document.getElementById('sdate').valueAsDate = new Date();
					</script>

				</td>
			</tr>

			<tr>
				<td>설문 종료 <input type="date" class="form-control" id="edate"
					name="edate" onchange="fn_test()"> <script>
						document.getElementById('edate').valueAsDate = new Date();
						function fn_test() {
							var sdate = $("#sdate").val();
							var edate = $("#edate").val();
							if (edate < sdate) {
								alert("종료기간이 현재 날짜보다 전입니다.");
								document.getElementById('edate').valueAsDate = new Date();
							}

						}
					</script>
				</td> 
			</tr>
			<tr>
				<td><label for="use">설문 공개 여부</label></td>
				<td align="center">
				<label class="radio-inline">
				<input type="radio" id="use" name="use" value="Y" checked />공개
				</label>
				<label class="radio-inline">
				<input type="radio" id="use" name="use"	value="N" />비공개
				</label>
				
 
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button class="btn" id="modBtn" name="modBtn">수정</button>
					<button class="btn" id="delBtn" name="delBtn">삭제</button>
				</td>
			</tr>
		</table>

	</form>

</body>
</html>