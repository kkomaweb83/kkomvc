<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>상품 admin 리스트</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {

	});
	
	function chkPclList(pro_pcl_no){
		location.href = "${ct_path}/pro_admin_list.da?dana=pro_admin_list&pro_pcl_no="+pro_pcl_no.value;
	}
	function doList(page){
		var pcl_no = document.getElementsByName("pcl_list_step")[0].value;
		location.href = "${ct_path}/pro_admin_list.da?dana=pro_admin_list&pro_pcl_no="+pcl_no+"&cPage="+page;
	}
	function doPreInsert(){
		location.href = "${ct_path}/pro_preInsert.da?dana=pro_preInsert";
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
		<span class="title_box1">☞ 상품 리스트</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
	</div>		
	
	<div style="width: 70px; text-align: center; float: right;">
	<span onclick="javascript:doPreInsert();" class="dana_button01">상품등록</span>
	</div>
	
	<!-- pro_admin_list -->
	<div style="width: 800px;">
	
	<div style="text-align: left; height: 30px;">
	상품분류 선택
	<span id="spcl_list_step"  style="display: inline;">
	<select name="pcl_list_step" style="vertical-align: middle;" onchange="chkPclList(this);">
	<option value="all">전체검색</option>
	<c:forEach var="bean" items="${class_list}">
	<option value="${bean.pcl_no }" disabled="disabled" class="select_title1">☞ ${bean.pcl_name }</option>
	<c:forEach var="bean2" items="${bean.pcl_list}">
	<option value="${bean2.pcl_no }" <c:if test="${param.pro_pcl_no == bean2.pcl_no}"> selected="selected" </c:if>>
	${bean2.pcl_name }</option>
	</c:forEach>
	</c:forEach>
	</select>
	</span>
	전체 갯수<span style="color: red;">${total_cnt}</span> 개
	</div>
	
	<table style="width: 800px;">
	<thead>
		<tr>
		<td class="table_title" width="80px">상품코드</td>
		<td class="table_title" width="400px">상품명</td>
		<td class="table_title" width="100px">판매가격</td>
		<td class="table_title" width="100px">분류명</td>
		<td class="table_title" width="70px">재고</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="bean" items="${pro_list}">
		<tr>
		<td class="table_content2">${bean.pro_no}</td>
		<td class="table_content1">
		<a href="${ct_path}/pro_admin_view.da?dana=pro_admin_view&pro_no=${bean.pro_no}&pro_pcl_no=${bean.pro_pcl_no}">${bean.pro_name }</a>
		</td>
		<td class="table_content2" style="text-align: right;">${bean.pro_ch_price}</td>
		<td class="table_content2">${bean.pcl_name}</td>
		<td class="table_content2">${bean.pro_stockcount}</td>
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