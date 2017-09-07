<!-- deptWrte.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function fn_onlyNumber() {
	var a = event.keyCode;
	if(a >= 48 && a <= 57) {
		return true;
	} else {
		return false;
	}
}
</script>
<body>
<form name="frm" method="post" action="/deptSave.do">
부서번호 
<input type="text" name="deptno" onkeypress="return fn_onlyNumber();" maxlength="2"> <br>
부서명 <input type="text" name="dname"> <br>
위치 <input type="text" name="loc"> <br>
<input type="button" value="전송" onclick="">
</form>
</body>
</html>