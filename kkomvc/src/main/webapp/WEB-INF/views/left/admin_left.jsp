<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>DanaCom 관리자 모드</title>
</head>
<body>

<div style="text-align: center;">
	<span id="admin_top_title">▷ 관리자 메뉴 ◁</span>
</div>

<span class="box_button2">☞ 상품관리</span>
<nav id="admin_menu_lnb">
	<ul>
		<li><a href="<%=cp %>/PclController?dana=pcl_list">- 상품분류 관리</a></li>
		<li><a href="<%=cp %>/MkrController?dana=mkr_list&mkr_insert=y&mkr_pcl_no=0101">- 제조사 관리</a></li>
		<li><a href="<%=cp %>/ProAdminController?dana=pro_admin_list">- 상품 리스트</a></li>
	</ul>
</nav>

<span class="box_button2">☞ 주문관리</span>
<nav id="admin_menu_lnb">
	<ul>
		<li><a href="<%=cp %>/ProController?dana=orders_admin_list&reurl=admin">- 주문 리스트</a></li>
	</ul>
</nav>

<span class="box_button2">☞ 회원관리</span>
<nav id="admin_menu_lnb">
	<ul>
		<li><a href="<%=cp %>/ProAdminController?dana=mem_admin_list">- 회원 리스트</a></li>
	</ul>
</nav>

<span class="box_button2">☞ 베틀관리</span>
<nav id="admin_menu_lnb">
	<ul>
		<li><a href="<%=cp %>/VblController?dana=btl_admin_list">- 베틀 리스트</a></li>
	</ul>
</nav>

<div style="height: 500px;"></div>

</body>
</html>