<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
function fn_detail(a) {
	var f = document.hiddenFrm2;
	f.unq.value = a;
	f.submit();
}
</script>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<div>
	<div class="header" style="height:50px;">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</div>

<div class="middle">
	<form name="frm" method="post" action="/boardList.do">
	<table border="0" width="600">
		<tr>
			<td width="100%" align="left">
				<select name="searchCondition">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchKeyword"/>
				<input type="submit" value="검색"/>
			</td>
		</tr>
		<tr>
			<td align="right">
			<input type="button" value="글쓰기" onclick="location.href='/boardWrite.do'"/>
			</td>
		</tr>
	</table>
	</form>

	<table width="600" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">이름</th>
			<th width="15%">날짜</th>
			<th width="10%">조회</th>
		</tr>
		<c:forEach var="result" items="${resultList}" varStatus="status">
           <tr align="center">
           		<td>${number}</td>
            	<td align="left">
          
       <c:forEach var="i" begin="1" end="${fn:length(result.thread)}">
       		&nbsp;
       </c:forEach>          
       <a href="#" onclick="fn_detail('${result.unq}')">${result.title}</a>
          
          		</td>
          
            	<td>${result.name}</td>
            	<td>
            	${fn:substring(result.rdate,0,10)}
            	</td>
            	<td>${result.hit}</td>
            </tr>
            <c:set var="number" value="${number-1}"/> 
		</c:forEach>
</table>
<table border="0" width="600">
	<tr>
		<td align="center">

	<c:if test="${before == 0}"><img src="/images/egovframework/cmmn/btn_page_pre1.gif"/></c:if>
	<c:if test="${before > 0}"><a href="boardList.do?pageIndex=${firstPage-1}&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img src="/images/egovframework/cmmn/btn_page_pre1.gif"/></a> </c:if>

		<c:forEach  var="i"  begin="${firstPage}"  end="${lastPage}">
		    <c:if test="${i <= totalPage }">
		    	<c:if test="${i == searchVO.pageIndex}">${i} &nbsp;</c:if>
		    	<c:if test="${i != searchVO.pageIndex}">
			<a href="boardList.do?pageIndex=${i}&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}">${i}</a> &nbsp;
				</c:if>
			</c:if>
		</c:forEach>	
		
	<c:if test="${next == 0}"><img src="/images/egovframework/cmmn/btn_page_next1.gif"/></c:if>
	<c:if test="${next > 0}"><a href="boardList.do?pageIndex=${lastPage+1}&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img src="/images/egovframework/cmmn/btn_page_next1.gif"/></a> </c:if>
			
		<a href="boardList.do?pageIndex=${totalPage}&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"><img src="/images/egovframework/cmmn/btn_page_next10.gif"/></a>
			
		</td>	
	</tr>
</table>

<form name="hiddenFrm2" method="post" action="/boardDetail.do">
	<input type="hidden" name="unq" id="unq"/>
</form>

</div>
</div>
</body>
</html>



