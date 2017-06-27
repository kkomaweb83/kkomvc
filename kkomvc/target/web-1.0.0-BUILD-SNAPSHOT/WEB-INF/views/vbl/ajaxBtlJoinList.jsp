<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title></title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

</head>
<body>
<table class="lngTable2" style="width: 100%;">
	<tr>
		<th style="width:10%;">참가번호</th>
		<th style="width:40%;">견적서 이름</th>
		<th style="width:10%;">점수</th>
		<th style="width:30%;">작성자</th>
		<th style="width:10%;">삭제</th>
	</tr>
	<c:if test="${empty btlDetList}">
	<tr>
		<td colspan="5">
		<div style="font-weight: bolder; font-size: 17pt; text-align: center;">해당하는 배틀 참가 견적서가 없습니다.</div>
		</td>
	</tr>
	</c:if>
	<c:forEach var="btlContent" items="${btlDetList}">
	<tr>
		<td style="text-align: center;">${btlContent.vbj_no }</td>
		<td><a href="javascript:ajaxBtlJoinDetList(${btlContent.vbj_no})">${btlContent.vbj_title }</a></td>
		<td style="text-align: center;">${btlContent.vbj_grade }</td>
		<td style="text-align: center;">${btlContent.mem_id }</td>
		<td style="text-align: center;"><a href="javascript:ajaxBtlDetUnjoin(${btlContent.vbj_no});"><img src="${ct_path}/img/cpdelete.jpg" border=0 /></a></td>
	</tr>	
	</c:forEach>
</table>
</body>
</html>