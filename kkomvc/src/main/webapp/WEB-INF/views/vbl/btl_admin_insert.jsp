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
		$("#datepicker1").datepicker(); 
		$('#datepicker1').datepicker('option', {dateFormat: 'yy/mm/dd'});		
		$("#datepicker2").datepicker(); 
		$('#datepicker2').datepicker('option', {dateFormat: 'yy/mm/dd'});		
	});
	
	function goProInsert(){
		if (document.btl_insert.btl_title.value == "")  {
	        alert("배틀 명을 입력하세요!");
	        document.btl_insert.btl_title.focus();
	        return;
	 	}
		if (document.btl_insert.btl_sdate.value == "")  {
	        alert("배틀 시작일을 선택하세요!");
	        document.btl_insert.btl_sdate.focus();
	        return;
	 	}
		if (document.btl_insert.btl_cdate.value == "")  {
	        alert("배틀 마감일을 선택하세요!");
	        document.btl_insert.btl_cdate.focus();
	        return;
	 	}
		if (document.btl_insert.btl_content.value == "")  {
	        alert("배틀 내용을 입력하세요!");
	        document.btl_insert.btl_content.focus();
	        return;
	 	}
		
		document.btl_insert.action = "${ct_path}/btl_admin_insert.do?dana=btl_admin_insert";
		document.btl_insert.submit();
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
	<form method="post" name="btl_insert">
	
	<div class="title_div1">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 베틀 등록</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
	</div>
	
	<table class="lngTable">
		<colgroup>
			<col width="10%;" />
			<col width="40%;" />
			<col width="10%;" />
			<col width="40%;" />
		</colgroup>
		<tr>
			<th>배틀 명</th>
			<td colspan="3"><input type="text" name="btl_title" maxlength="50" /></td>
		</tr>
		<tr>
			<th>배틀 시작일</th>
			<td><input type="text" id="datepicker1" name="btl_sdate" readonly="readonly"></td>
			<th>배틀 마감일</th>
			<td><input type="text" id="datepicker2" name="btl_cdate" readonly="readonly"></td>
		</tr>
		<tr>
			<th>배틀 내용</th>
			<td colspan="3"><textarea rows="20" style="width: 98%;" name="btl_content"></textarea>
		</tr>
	</table>
	
	<div style="text-align: center;"><input type="button" value="등록" onclick="javascript:goProInsert();" /></div>
	
	</form>
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>