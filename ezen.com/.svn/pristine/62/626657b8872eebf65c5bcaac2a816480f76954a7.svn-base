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
<table border="1">
<c:forEach var="result" items="${resultList}" varStatus="status">
           <tr>
            	<td align="center" class="listtd">${result.deptno}&nbsp;</td>
            	<td align="center" class="listtd">
     <a href="deptDetail.do?deptno=${result.deptno}">${result.dname}</a>&nbsp;</td>
            	<td align="center" class="listtd">${result.loc}&nbsp;</td>
            </tr>
</c:forEach>
</table>
</body>
</html>