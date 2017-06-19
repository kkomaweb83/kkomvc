<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>컴퓨터 쇼핑몰의 최강자 DanaCom</title>

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
	function onMemJoin(){
		var f = document.mem_form;
		
		var val = /(^[가-힝a-zA-Z\s]{1,20}$)/;
	    if(!val.test(f.mem_name.value)){
	    	f.mem_name.value = "";
	    	f.mem_name.focus();
	    	alert('이름은 한글, 영문으로만 입력해 주세요');
	    	return false;
	    }
	    var val2 = /(^[0-9a-zA-Z\s]{5,10}$)/;
	    if(!val2.test(f.mem_id.value)){
	    	f.mem_id.value = "";
	    	f.mem_id.focus();
	    	alert('아이디는 5~10자 의 영문,숫자 만 입력해 주세요');
	    	return false;
	    }
	    var val3 = /(^[0-9a-zA-Z\s]{5,10}$)/;
	    if(!val3.test(f.mem_pass.value)){
	    	f.mem_pass.value = "";
	    	f.mem_pass.focus();
	    	alert('비밀번호는 5~10자 의 영문,숫자 만 입력해 주세요');
	    	return false;
	    }
	    var val4 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	    if(!val4.test(f.mem_email.value)){
	    	f.mem_email.value = "";
	    	f.mem_email.focus();
	    	alert('이메일 형식에 맞게 입력해 주세요');
	    	return false;
	    }
	    var val5 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	    if(!val5.test(f.mem_hp.value)){
	    	f.mem_hp.value = "";
	    	f.mem_hp.focus();
	    	alert('휴대폰 번호 형식에 맞게 입력해주세요');
	    	return false;
	    }
	    
    	if(f.mem_addr.value == ""){
    		f.mem_addr2.focus();
	    	alert('주소를 검색 하세요');
	    	return false;
    	}
    	var val6 = /(^[0-9가-힝a-zA-Z\s]{3,50}$)/;
	    if(!val6.test(f.mem_addr2.value)){
	    	f.mem_addr2.value = "";
	    	f.mem_addr2.focus();
	    	alert('주소를 정확히 입력하세요');
	    	return false;
	    }
	    
    	var val7 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	    if(!val7.test(f.mem_tel.value)){
	    	f.mem_tel.value = "";
	    	f.mem_tel.focus();
	    	alert('전화번호 형식에 맞게 입력해주세요');
	    	return false;
	    }
	    
	    alert("회원가입은 2017년 6월 19일 open 예정입니다. 감사합니다.");
	}
	
</script>
</head>
<body>
	<header id="top_header">
	<%-- 상단 헤더 include 처리 --%> <%-- ${ct_path}/PclController?dana=member_join --%>
	<jsp:include page="../top/top_menu.jsp" flush="false" />
	
	</header>
	
	<div id="content">
	
	<!-- 전체 -->
	<div id="proMainViewDiv" style="width: 960px; margin-left: 5px;">
	
	<form method="post" name="mem_form">
	
	<table style="border: 1px dotted black; border-spacing:0px; padding: 10px 5px 20px 5px; margin: auto;">
	<tr>
		<td>
		<img src="${ct_path}/img/member_danacom_top02.jpg" />
		</td>
	</tr>
	<tr>
		<td style="960px;">
			<table style="width: 863px; border-spacing:0px; margin: auto;">
			<tr>
			<td width="863" height="10">			
				<p><img src="${ct_path}/img/member_agreement_01-08.gif" /></p>
			</td>
			</tr>
			<tr><td style="background-color: #1A6BAB;width: 863px; height: 3px;"><p></p></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		<table style="width: 863px; border-spacing:0px; margin: auto;">
		<tr>
			<td style="border-left: rgb(226,226,226) 1px solid;  border-bottom: rgb(226,226,226) 1px solid" width="36" bgColor=#f6f7f9 height=30>
				<p align="right"><img src="${ct_path}/img/member_n_icon.gif" border="0"> </p></td>
			<td style="border-bottom: rgb(226,226,226) 1px solid" width="18" bgColor=#f6f7f9 height=30><p align=center>&nbsp;</p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="117" bgColor=#f6f7f9 height=30>
				<p align="left"><b><font color=black face="돋움"><span style="font-size:9pt;">이름</span></font></b></p></td>
			<td style="border-right: rgb(226,226,226) 1px solid; border-bottom: rgb(226,226,226) 1px solid" width="689" bgColor=white height=30>
				<p align="left">&nbsp;&nbsp;
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="15" name="mem_name" maxlength="30" /></p></td>
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
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="15" name="mem_id" maxlength="30" /></p></td>
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
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="25" name="mem_email" maxlength="40" /></p></td>
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
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="25" name="mem_hp" maxlength="30" /></p></td>
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
					name="mem_zonecode" id="mem_zonecode" readonly="readonly" />
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid; width: 500px;" name="mem_addr" id="mem_addr" readonly="readonly" />
				<span style="display: inline-block; margin-top: 5px; margin-left: 12px;">
				<input type="text" style="border-right: rgb(204,204,204) 1px solid; border-top: rgb(204,204,204) 1px solid; 
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid; width: 525px;" name="mem_addr2" id="mem_addr2" maxlength="50" />
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
					border-left: rgb(204,204,204) 1px solid; border-bottom: rgb(204,204,204) 1px solid" size="25" name="mem_tel" maxlength="15" /></p></td>
		</tr>
		</table>
		</td>
	</tr>
	</table>
	<p align="center"><img src="${ct_path}/img/member_agreement_ok1.gif" onclick="onMemJoin();" style="cursor: pointer;" /></p>
	</form>	
	
	</div>
	<!-- 전체 -->
	
	</div>
	
	<footer>
	
	</footer>
<!-- 상세보기 dlg -->
<div id="dialog"></div>			
</body>
</html>