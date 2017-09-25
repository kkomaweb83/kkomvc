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
	    if(f.mem_chk.value == "N"){
	    	f.mem_id.focus();
	    	alert('사용할수 없는 아이디 입니다.');
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
	    
	    f.action = "${ct_path}/mem_join.do?dana=mem_join";
		f.submit();
	}
	function chkMemId(obj){
		$.ajax({
			url : "${ct_path}/chk_mem_id.do",
			type : "post",
			data : {dana:'chk_mem_id',chk_mem_id:obj.value},
			dataType : "json",
			success : function(data) {
				$("#mem_chk_desc").text("사용불가");
				$("#mem_chk").val("N");
				if(data.chk == "N"){
					if(data.msg != ""){
						$("#mem_chk_desc").text(data.msg);
					}
				}else if(data.chk == "Y"){
					var val_chk = /(^[0-9a-zA-Z\s]{5,10}$)/;
				    if(val_chk.test(obj.value)){
						$("#mem_chk").val("Y");
						$("#mem_chk_desc").text("사용가능");
				    }
				}
			},
			error : function() {
				alert("실패");
			}
		});
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
	<div id="proMainViewDiv" style="width: 960px; margin: 0 auto; padding-left: 5px;">
	
	<form method="post" name="mem_form">
	<input name="mem_chk" id="mem_chk" type="hidden" value="N" />
	
	<div style="border:1px dotted #FF9900;">
	<table class="main_table_mem">
	<thead>
	<tr>
		<td>
		<img src="${ct_path}/img/member_danacom_top02.jpg" />
		</td>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td>
			<table class="lngTable2" style="width:90%; margin: 0 auto;">
			<tr>
				<td colspan="2" class="one"><img src="${ct_path}/img/member_agreement_01-08.gif" /></td>
			</tr>
			<tr>
				<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 이름</th>
				<td><input type="text" name="mem_name" maxlength="30" /></td>
			</tr>
			<tr>
				<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 회원 아이디</th>
				<td>
					<input type="text" onkeyup="chkMemId(this);" name="mem_id" maxlength="30" />
					<span>5~10자 의 영문,숫자</span>
					<span id="mem_chk_desc" style="margin-left: 50px; color: red;"></span>
				</td>
			</tr>
			<tr>
				<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 비밀번호</th>
				<td>
					<input type="password" name="mem_pass" maxlength="30" />
					<span>5~10자 의 영문,숫자</span>
				</td>
			</tr>
			<tr>
				<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 이메일</th>
				<td><input type="text" name="mem_email" maxlength="40" /></td>
			</tr>
			<tr>
				<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 휴대폰 번호</th>
				<td><input type="text" name="mem_hp" maxlength="30" /></td>
			</tr>
			<tr>
				<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 일반주소</th>
				<td>
					<input type="text" name="mem_zonecode" id="mem_zonecode" readonly="readonly" />
					<input type="text" name="mem_addr" id="mem_addr" readonly="readonly" />
					<input type="text" name="mem_addr2" id="mem_addr2" maxlength="50" />
					<span onclick="addr_serarch();" class="main_table_mem_button">검색</span>
				</td>
			</tr>
			<tr>
				<th><img src="${ct_path}/img/member_n_icon.gif" border="0"> 일반 전화번호</th>
				<td><input type="text" name="mem_tel" maxlength="15" /></td>
			</tr>
			</table>
		</td>
	</tr>
	</tbody>
	</table>
	</div>
	
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