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
	<div id="pclListDiv">
	
	<div class="title_div1" style="float: left; width: 100%;">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 회원정보 수정</span>
	</div>		
	
		<table style="width: 800px; border-spacing:0px; margin: auto;">
		<tr>
			<td style="border-left: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid; border-top: rgb(226,226,226) 1px solid;" 
						width="36" bgColor=#f6f7f9 height=30>
				<p align="right"><img src="${ct_path}/img/member_n_icon.gif" border="0"> </p></td>
			<td style="border-bottom: rgb(226,226,226) 1px solid; border-top: rgb(226,226,226) 1px solid;" width="18" bgColor=#f6f7f9 height=30><p align=center>&nbsp;</p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid; border-top: rgb(226,226,226) 1px solid;" 
						width="117" bgColor=#f6f7f9 height=30>
				<p align="left"><b><font color=black face="돋움"><span style="font-size:9pt;">이름</span></font></b></p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid; border-top: rgb(226,226,226) 1px solid;" width="689" bgColor=white height=30>
				<p align="left">&nbsp;&nbsp;
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="15" name="mem_name" maxlength="30" value="${login.mem_name}" /></p></td>
		</tr>
		<tr>
			<td style="border-left: rgb(226,226,226) 1px solid;  border-bottom: rgb(226,226,226) 1px solid" width="36" bgColor=#f6f7f9 height=30>
				<p align="right"><img src="${ct_path}/img/member_n_icon.gif" border="0"></p></td>
			<td style="border-bottom: rgb(226,226,226) 1px solid" width="18" bgColor=#f6f7f9 height=30><p align=center>&nbsp;</p></td>
			<td style=" border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="117" bgColor=#f6f7f9 height=30>
				<p align="left"><b><font color=black face="돋움"><span style="font-size:9pt;">회원 아이디</span></font></b></p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="689" bgColor=white height=30>
				<p align="left">&nbsp;&nbsp;
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="15" name="mem_id" maxlength="30" value="${login.mem_id}" /></p></td>
		</tr>
		<tr>
			<td style="border-left: rgb(226,226,226) 1px solid;  border-bottom: rgb(226,226,226) 1px solid" width="36" bgColor=#f6f7f9 height=30>
				<p align="right"><img src="${ct_path}/img/member_n_icon.gif" border="0"> </p></td>
			<td style="border-bottom: rgb(226,226,226) 1px solid" width="18" bgColor=#f6f7f9 height=30><p align=center>&nbsp;</p></td>
			<td style=" border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="117" bgColor=#f6f7f9 height=30>
				<p align="left"><b><font color=black face="돋움"><span style="font-size:9pt;">비밀번호</span></font></b></p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="689" bgColor=white height=30>
				<p align="left">&nbsp;&nbsp;
				<input style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="19" name="mem_pass" type="password" maxlength="30" /></p></td>
		</tr>
		<tr>
			<td style="border-left: rgb(226,226,226) 1px solid;  border-bottom: rgb(226,226,226) 1px solid" width="36" bgColor=#f6f7f9 height=30>
				<p align="right"><img src="${ct_path}/img/member_n_icon.gif" border="0"></p></td>
			<td style="border-bottom: rgb(226,226,226) 1px solid" width="18" bgColor=#f6f7f9 height=30><p>&nbsp;</p></td>
			<td style=" border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="117" bgColor=#f6f7f9 height=30>
				<p align="left"><b><font color=black face="돋움"><span style="font-size:9pt;">이메일</span></font></b></p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="689" bgColor=white height=30>
				<p align="left">&nbsp;&nbsp;
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="25" name="mem_email" maxlength="40" value="${login.mem_email}" /></p></td>
		</tr>
		<tr>
			<td style="border-left: rgb(226,226,226) 1px solid;  border-bottom: rgb(226,226,226) 1px solid" width="36" bgColor=#f6f7f9 height=30>
				<p align="right"><img src="${ct_path}/img/member_n_icon.gif" border="0"> </p></td>
			<td style="  border-bottom: rgb(226,226,226) 1px solid" width="18" bgColor=#f6f7f9 height=30><p align=center>&nbsp; </p></td>
			<td style=" border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="117" bgColor=#f6f7f9 height=30>
				<p align="left"><b><font color=black face="돋움"><span style="font-size:9pt;">휴대폰 번호</span></font></b></p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="689" bgColor=white height=30>
				<p align="left">&nbsp;&nbsp;
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="25" name="mem_hp" maxlength="30" value="${login.mem_hp}" /></p></td>
		</tr>
		<tr>
			<td style="border-left: rgb(226,226,226) 1px solid;  border-bottom: rgb(226,226,226) 1px solid" width="36" bgColor=#f6f7f9 height=30>
				<p align="right"><img src="${ct_path}/img/member_n_icon.gif" border="0"> </p></td>
			<td style="border-bottom: rgb(226,226,226) 1px solid" width="18" bgColor=#f6f7f9 height=30><p>&nbsp;</p></td>
			<td style=" border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="117" bgColor=#f6f7f9 height="30">
				<p align="left"><b><font color=black face="돋움"><span style="font-size:9pt;">일반주소</span></font></b>
				</p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid"width="689" bgColor=white height=30>
				<p align="left">&nbsp;&nbsp;
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid; width: 60px; text-align: center;" 
					name="mem_zonecode" id="mem_zonecode" readonly="readonly" value="${login.mem_zonecode}" />
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid; width: 500px;" name="mem_addr" id="mem_addr" readonly="readonly" value="${login.mem_addr}" />
				<span style="display: inline-block; margin-top: 5px; margin-left: 12px;">
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid; width: 525px;" name="mem_addr2" id="mem_addr2" maxlength="50" value="${login.mem_addr2}" />
				</span>	
				<span style="padding: 4px 9px 3px 9px; border: 1px solid #8BBDFF; color: #ffffff; background: #8BBDFF; cursor: pointer;" onclick="addr_serarch();">검색</span>
				</p>
			</td>
		</tr>
		<tr>
			<td style="border-left: rgb(226,226,226) 1px solid;  border-bottom: rgb(226,226,226) 1px solid" width="36" bgColor=#f6f7f9 height=30>
				<p align="right"><img src="${ct_path}/img/member_n_icon.gif" border="0"> </p></td>
			<td style="border-bottom: rgb(226,226,226) 1px solid" width="18" bgColor=#f6f7f9 height=30><p align=center>&nbsp;</p></td>
			<td style=" border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="117" bgColor=#f6f7f9 height=30>
				<p align="left"><b><font color=black face="돋움"><span style="font-size:9pt;">일반 전화번호</span></font></b></p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="689" bgColor=white height=30>
				<p align="left">&nbsp;&nbsp;
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="25" name="mem_tel" maxlength="15" value="${login.mem_tel}" /></p></td>
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