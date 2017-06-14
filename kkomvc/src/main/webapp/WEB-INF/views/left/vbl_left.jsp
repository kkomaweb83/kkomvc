<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>DanaCom 견적서</title>
</head>
<body>

<div style="text-align: center;">
	<span id="admin_top_title">▷ 견적서 메뉴 ◁</span>
</div>

<span class="box_button2">☞ 견적서관리</span>
<nav id="admin_menu_lnb">
	<ul>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">- 가상견적서 리스트</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/VblController?dana=vbl_main_prelist">- 가상견적서 리스트</a></c:if>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">- 공유견적서 리스트</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/VblController?dana=vbb_prelist">- 공유견적서 리스트</a></c:if>
		</li>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">- 베틀견적서 리스트</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/VblController?dana=btl_main_list&reurl=main">- 베틀견적서 리스트</a></c:if>
		</li>
	</ul>
</nav>

<div style="height: 800px;"></div>

</body>
</html>