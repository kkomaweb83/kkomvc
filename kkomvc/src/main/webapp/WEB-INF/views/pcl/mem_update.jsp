<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>회원정보 관리</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">
input {
	padding: 3px;
}
</style>
<script type="text/javascript">
	$(function() {
		
	});
	
	function addr_serarch(){
		new daum.Postcode({
			oncomplete: function(data) {
				$("#mem_zonecode").val(data.zonecode);
				$("#mem_addr").val(data.address);
				$("#mem_addr2").focus();
			}
		}).open();
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
	<jsp:include page="../left/my_left.jsp" flush="false" />
	
	</aside>
	
	<section id="admin_section">
	
	<!-- pcl_insert -->
	<div id="pclListDiv" class="main_table_mem">
	
	<div class="title_div1" style="float: left; width: 100%;">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 회원정보 수정</span>
	</div>		
	
		<table class="lngTable2" style="width: 800px; border-spacing:1px; margin: auto;">
		<colgroup>
			<col width="200px" />
			<col />
		</colgroup>
		<tr>
			<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 이름</th>
			<td><input type="text" name="mem_name" maxlength="30" value="${login.mem_name}" /></td>
		</tr>
		<tr>
			<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 회원 아이디</th>
			<td>
				<input type="text" onkeyup="chkMemId(this);" name="mem_id" maxlength="30" value="${login.mem_id}" />
			</td>
		</tr>
		<tr>
			<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 비밀번호</th>
			<td>
				<input type="password" name="mem_pass" maxlength="30" />
			</td>
		</tr>
		<tr>
			<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 이메일</th>
			<td><input type="text" name="mem_email" maxlength="40" value="${login.mem_email}" /></td>
		</tr>
		<tr>
			<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 휴대폰 번호</th>
			<td><input type="text" name="mem_hp" maxlength="30" value="${login.mem_hp}" /></td>
		</tr>
		<tr>
			<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 일반주소</th>
			<td>
				<input type="text" name="mem_zonecode" id="mem_zonecode" readonly="readonly" value="${login.mem_zonecode}" />
				<input type="text" name="mem_addr" id="mem_addr" readonly="readonly" value="${login.mem_addr}" />
				<input type="text" name="mem_addr2" id="mem_addr2" maxlength="50" value="${login.mem_addr2}" />
				<span onclick="addr_serarch();" class="main_table_mem_button">검색</span>
			</td>
		</tr>
		<tr>
			<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 일반 전화번호</th>
			<td><input type="text" name="mem_tel" maxlength="15" value="${login.mem_tel}" /></td>
		</tr>
		</table>
	
	</div>
	<!-- pcl_list -->
	
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>