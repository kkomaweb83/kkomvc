<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>DanaCom 마이페이지</title>
</head>
<body>

<div style="text-align: center;">
	<span id="admin_top_title">▷ 나의 쇼핑정보 ◁</span>
</div>

<span class="box_button2">☞ 주문관리</span>
<nav id="admin_menu_lnb">
	<ul>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">주문 리스트</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/ProController?dana=orders_list">주문 리스트</a></c:if>
		<li>
	</ul>
</nav>

<span class="box_button2">☞ 회원관리</span>
<nav id="admin_menu_lnb">
	<ul>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">회원정보 수정</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/ProController?dana=mem_preUpdate">회원정보 수정</a></c:if>
		<li>
	</ul>
</nav>

<div style="height: 800px;"></div>

</body>
</html>