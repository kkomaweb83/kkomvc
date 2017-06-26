<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>베틀 admin 리스트</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>
<body>
	<header id="top_header">
	<%-- 상단 헤더 include 처리 --%>
	<jsp:include page="../top/top_menu.jsp" flush="false" />
	
	</header>
	
	<div id="admin_content">
	
	<aside id="admin_aside">
	<%-- 관리자 외편 메뉴 include 처리 --%>
	<jsp:include page="../left/admin_left.jsp" flush="false" />
	
	</aside>
	
	<section id="admin_section">
	
	<div class="title_div1">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 베틀 상세</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
	</div>
	
	<table class="lngTable2">
		<colgroup>
			<col width="15%;" />
			<col width="40%;" />
			<col width="10%;" />
			<col width="35%;" />
		</colgroup>
		<tr>
			<th>배틀 명</th>
			<td colspan="3">${btl.btl_title}</td>
		</tr>
		<tr>
			<th>배틀 시작일</th>
			<td>${btl.btl_sdate }</td>
			<th>배틀 마감일</th>
			<td>${btl.btl_cdate }</td>
		</tr>
		<tr>
			<th>배틀 내용</th>
			<td colspan="3"><pre>${btl.btl_content }</pre></td>
		</tr>
	</table>
	
	<table class="lngTable2">
		<tr>
			<th style="width:15%;">참가번호</th>
			<th style="width:40%;">견적서 이름</th>
			<th style="width:10%;">점수</th>
			<th style="width:35%;">작성자</th>
		</tr>
		<c:if test="${empty btlDetList}">
		<tr>
			<td colspan="4">
			<div style="font-weight: bolder; font-size: 20pt; text-align: center;">[${btl.btl_title}]<br />에 해당하는 배틀참가견적이 없습니다.</div>
			</td>
		</tr>
		</c:if>
		<c:forEach var="btlContent" items="${btlDetList}">
		<tr>
			<td>${btlContent.vbj_no }</td>
			<td>${btlContent.vbj_title }</td>
			<td>${btlContent.vbj_grade }</td>
			<td>${btlContent.mem_id }</td>
		</tr>	
		</c:forEach>
	</table>
	
	
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>