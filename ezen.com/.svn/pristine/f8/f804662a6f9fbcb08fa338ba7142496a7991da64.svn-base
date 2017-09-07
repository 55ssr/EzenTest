<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/include/link.jsp"></jsp:include>
</head>
<script>
function fn_next() {
	var f = document.popupFrm;
	if(f.dong.value == "") {
		alert("동을 입력해주세요.");
		return;
	}
	f.submit();
}
</script>
<body>
<form name="popupFrm" method="post" action="/post2.do">
<table border="1" style="width:99%">
	<tr>
		<td height="50">
		동(면/리) 입력 : <input type="text" name="dong" style="width:50%;"> 
		<input type="submit" value="검색" onclick="fn_next();return false;">
		</td>
	</tr>
</table>
</form>
</body>
</html>