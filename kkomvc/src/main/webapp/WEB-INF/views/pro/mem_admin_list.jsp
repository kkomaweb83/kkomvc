<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>회원 admin 리스트</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {

	});
	function doList(page){
		location.href = "${ct_path}/mem_admin_list.do?dana=mem_admin_list&cPage="+page;
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
	<%-- 관리자 외편 메뉴 include 처리 --%>
	<jsp:include page="../left/admin_left.jsp" flush="false" />
	
	</aside>
	
	<section id="admin_section">
	
	<div class="title_div1">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 회원 리스트</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
	</div>		
	
	<!-- pro_admin_list -->
	<div style="width: 800px;">
	
	<div style="text-align: left; height: 30px;">
	전체 <span style="color: red;">${total_cnt}</span> 개
	</div>
	
	<table style="width: 800px;">
	<thead>
		<tr>
		<td class="table_title" width="70px">회원번호</td>
		<td class="table_title" width="100px">회원ID</td>
		<td class="table_title" width="100px">이름</td>
		<td class="table_title" width="200px">이메일</td>
		<td class="table_title" width="100px">휴대폰</td>
		<td class="table_title" width="90px">마일리지</td>
		<td class="table_title" width="80px">초기화</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="bean" items="${mem_list}">
		<tr>
		<td class="table_content2">${bean.mem_no}</td>
		<td class="table_content2">${bean.mem_id}</td>
		<td class="table_content2">${bean.mem_name}</td>
		<td class="table_content2">${bean.mem_email}</td>
		<td class="table_content2">${bean.mem_hp}</td>
		<td class="table_content2 ar"><fmt:formatNumber value="${bean.mem_mil}" pattern="###,###,###,###" /></td>
		<td class="table_content2">
		<span style="padding: 4px 9px 3px 9px; border: 1px solid #8BBDFF; color: #ffffff; background: #8BBDFF; cursor: pointer;">초기화</span>
		</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<p:page p_totalPage="${p_totalPage}" p_nowPage="${p_nowPage}" p_list="${p_list}" p_pagePerBlock="${p_pagePerBlock}" />
	 
	</div>
	
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>