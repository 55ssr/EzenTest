<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/include/link.jsp"></jsp:include>
</head>
<script>
function fn_next() {
	var f = document.popupFrm;
	var address = f.address.value;  // 123456 서울시 강남구 ~~
	var array = address.split(" ");
	var post = array[0];
	var addr = address.replace(post,"");
	
	opener.frm.postnum.value = post;
	opener.frm.addr1.value = addr;
	
	self.close();
}
</script>
<body>
<form name="popupFrm">
<table border="1" style="width:99%">
	<tr>
		<td height="50">
		
<select name="address">
	<c:forEach var="r" items="${resultList}" varStatus="status">
		
<c:set var="addr" value="${r.postnum} ${r.sido} ${r.sigun} ${r.dong} ${r.ri} ${r.others}"/>
	
		<option value="${addr}">${addr}</option>
	</c:forEach>
</select>
<br>
<input type="button" value="적용" onclick="fn_next()">

		</td>
	</tr>
</table>
</form>
</body>
</html>