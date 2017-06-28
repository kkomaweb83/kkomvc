<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>제조사 관리</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {

	});
	
	function chkPclList(mk_pcl_no){
		location.href = "${ct_path}/mkr_list.do?dana=mkr_list&mkr_insert=y&mkr_pcl_no="+mk_pcl_no.value;
	}

	function selPclList(mk_pcl_no){
		$("#mkr_pcl_no").val(mk_pcl_no.value);
	}

	function doMkrInsert(){
		if (document.mkr_insert.mkr_name.value == "")  {
	        alert("제조사명을 입력하세요!");
	        document.mkr_insert.mkr_name.focus();
	        return;
	 	}

		if (document.mkr_insert.mkr_pcl_no.value == "")  {
	        alert("분류코드를 선택하세요!");
	        document.mkr_insert.pcl_list_stepi.focus();
	        return;
	 	}

		document.mkr_insert.mkr_no.value = 12;
		document.mkr_insert.action = "${ct_path}/mkr_insert.do?dana=mkr_insert";
		document.mkr_insert.submit();
	}

	function doMkrUpdate(){
		if (document.mkr_insert.mkr_name.value == "")  {
	        alert("제조사명을 입력하세요!");
	        document.mkr_insert.mkr_name.focus();
	        return;
	 	}
		
		document.mkr_insert.action = "${ct_path}/mkr_update.do?dana=mkr_update";
		document.mkr_insert.submit();	
	}

	function doMkrDelete(){
		document.mkr_insert.action = "${ct_path}/mkr_delete.do?dana=mkr_delete";
		document.mkr_insert.submit();	
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
	<form method="post" name="mkr_insert">
		<input name="mkr_no" type="hidden" value="${mkrVO.mkr_no }" />
		<input name="mkr_insert" type="hidden" value="y" />
	
	<div class="title_div1">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 제조사 관리</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
	</div>
	
	<!-- 제조사 입력, 수정 -->
	<div class="title_div2">
	<table style="width: 800px; padding: 0; border-spacing: 5px;">
	<tr>
	<td><span class="span_box2">제조사명</span></td>
	<td align="left" width="350">
	<input type="text" name="mkr_name" id="mkr_name" class="box_input_left" 
			style="width: 250px;" value="${mkrVO.mkr_name }" /></td>
	
	<td align="right" width="350">
		<table style="border-spacing: 3px;"><tr>
		<c:if test="${mkrCom.mkr_insert == 'y'}">
		<td><span onclick="javascript:doMkrInsert();" class="dana_button01">입력</span></td>
		</c:if>
		<c:if test="${mkrCom.mkr_insert == 'n'}">
		<td><span onclick="javascript:doMkrUpdate();" class="dana_button01">수정</span></td>
		<td><span onclick="javascript:doMkrDelete();" class="dana_button01">삭제</span></td>
		</c:if>
		</tr>
		</table>
	</td>
	</tr>
	<tr>
	<td><span class="span_box2">분류코드</span></td>
	<td align="left" colspan="2">
	<input type="text" id="mkr_pcl_no" name="mkr_pcl_no" class="box_input_left" 
				style="width: 250px;" readonly="readonly" value="${mkrVO.mkr_pcl_no }"/>							
	
	<c:if test="${mkrCom.mkr_insert == 'y'}">
	<span id="spcl_list_stepi"  style="display: inline;">
	<select name="pcl_list_stepi" style="vertical-align: middle;" onchange="selPclList(this);">
	<c:forEach var="bean" items="${class_list}">
	<option value="${bean.pcl_no }" disabled="disabled" class="select_title1">☞ ${bean.pcl_name }</option>
	<c:forEach var="bean2" items="${bean.pcl_list}">
	<option value="${bean2.pcl_no }">
	${bean2.pcl_name }</option>
	</c:forEach>
	</c:forEach>
	</select>
	</span>
	</c:if>
	
	</td>
	
	</tr>
	</table>
	</div>
	<!-- 제조사 입력, 수정 -->	
	
	<!-- mkr_insert -->
	
	<!-- mkr_list -->
	<div style="width: 800px;">
	
		<div style="text-align: left; height: 30px;">
			상품분류 선택
			<span id="spcl_list_step"  style="display: inline;">
			<select name="pcl_list_step" style="vertical-align: middle;" onchange="chkPclList(this);">
				<c:forEach var="bean" items="${class_list}">
				<option value="${bean.pcl_no }" disabled="disabled" class="select_title1">☞ ${bean.pcl_name }</option>
				<c:forEach var="bean2" items="${bean.pcl_list}">
				<option value="${bean2.pcl_no }" <c:if test="${mkr_pcl_no == bean2.pcl_no}"> selected="selected" </c:if>>
				${bean2.pcl_name }</option>
				</c:forEach>
				</c:forEach>
			</select>
			</span>
		</div>
		
		<table style="width: 800px;">
		<thead>
			<tr>
			<td class="table_title" width="150px">제조사코드</td>
			<td class="table_title" width="400px">제조사명</td>
			<td class="table_title" width="250px">상품 분류명</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="bean" items="${mkrCom.list}">
			<tr>
			<td class="table_content2">${bean.mkr_no}</td>
			<td class="table_content1">
			<a href="${ct_path}/mkr_preUpdate.do?dana=mkr_preUpdate&mkr_no=${bean.mkr_no}&mkr_pcl_no=${bean.mkr_pcl_no}&mkr_insert=n">${bean.mkr_name }</a>
			</td>
			<td class="table_content2">${bean.pcl_name}</td>
			</tr>
			</c:forEach>
		</tbody>
		
		</table> 		
	
	</div>
	
	</form>
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>