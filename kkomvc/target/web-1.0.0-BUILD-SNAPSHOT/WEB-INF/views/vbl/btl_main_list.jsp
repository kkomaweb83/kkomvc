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
	
	function doList(page){
		location.href = "${ct_path}/VblController?dana=btl_main_list&cPage="+page;
	}
</script>
</head>
<body>
	<header id="top_header">
	<%-- 상단 헤더 include 처리 --%>
	<jsp:include page="../top/top_menu.jsp" flush="false" />
	
	</header>
	
	<div id="admin_content">
	
	<aside id="admin_aside">
	<%-- 견적서 외편 메뉴 include 처리 --%>
	<jsp:include page="../left/vbl_left.jsp" flush="false" />
	
	</aside>
	
	<section id="admin_section">
	
	<div class="title_div1">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 베틀 리스트</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
	</div>
	
	<!-- pro_admin_list -->
	<div style="width: 800px;">
	
	<div style="text-align: left; height: 30px;">
	전체 갯수<span style="color: red;">${total_cnt}</span> 개
	</div>
	
	<table style="width: 800px;" class="lngTable">
	<tr>
		<th style="width:7%;">번호</th>
		<th style="width:57%;">배틀명</th>
		<th style="width:11%;">배틀 시작일</th>
		<th style="width:11%;">배틀 마감일</th>
	</tr>
	<c:forEach var="btl" items="${btlList}">
	<tr>
		<td>${btl.btl_no}</td>
		<td><a href="${ct_path}/btlDetPrejoin.da?dana=btlDetPrejoin&btl_no=${btl.btl_no}&reurl=main">${btl.btl_title}</a></td>
		<td>${btl.btl_sdate}</td>
		<td>${btl.btl_cdate}</td>
	</tr>
	</c:forEach>
	</table>
	
	<p:page p_totalPage="${p_totalPage}" p_nowPage="${p_nowPage}" p_list="${p_list}" p_pagePerBlock="${p_pagePerBlock}" />
	 
	</div>
	
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>