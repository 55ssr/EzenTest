<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" method="post" action="/deptDetailSave.do">
부서번호 <input type="text" name="deptno" value="${vo.deptno}"> <br>
부서명 <input type="text" name="dname" value="${vo.dname}"> <br>
위치 <input type="text" name="loc" value="${vo.loc}"> <br>
<input type="submit" value="전송">

<input type="button" value="삭제" onclick="location.href='deptDelete.do?deptno=${vo.deptno}'">

</form>
</body>
</html>