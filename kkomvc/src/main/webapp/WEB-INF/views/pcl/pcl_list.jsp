<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>상품분류 관리</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		init();
		
	});
	
	function init(){
		$.ajax({
			url : "${ct_path}/ajax_pcl_list.do",
			type : "post",
			data : {dana:'ajax_pcl_list',pcl_upperno:'NULL',insert:'y',step:1, pcl_old_upperno:'NO'},
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function goPclListNo(pcl_no, step, pcl_upperno){
		if(step == "6"){
			alert("분류단계는 5단계 까지만 가능합니다.");
			return;
		}
		$.ajax({
			url : "${ct_path}/ajax_pcl_list.do",
			type : "post",
			data : {dana:'ajax_pcl_list',pcl_upperno:pcl_no,insert:'y',step:step, pcl_old_upperno:pcl_upperno, pcl_session:'y'},
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function goPclAutoNo(){
		$("#dana").val("pcl_auto_no");
		$.ajax({
			url : "${ct_path}/pcl_auto_no.do",
			type : "post",
			data : $('#pcl_insert').serialize(),
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function chkPclList(obj, pcl_upperno, step){
		$.ajax({
			url : "${ct_path}/ajax_pcl_list.do",
			type : "post",
			data : {dana:'ajax_pcl_list',pcl_upperno:obj.value,insert:'y',step:step, pcl_old_upperno:pcl_upperno, objsetp:step, pcl_session:'y'},
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function goPclListName(pcl_no, pcl_upperno){
		$.ajax({
			url : "${ct_path}/pcl_preUpdate.do",
			type : "post",
			data : {dana:'pcl_preUpdate',pcl_no:pcl_no,pcl_upperno:pcl_upperno,insert:'n'},
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function doPclInsert(){
		var re = null;	
		re = new RegExp(/^[0-9]+$/);
		if(!chkWan(re, $("#pcl_no"), "코드가 생성되지 않았습니다.")) return;
		if ($("#pcl_name").val() == "")  {
	        alert("상품분류명을 입력하세요!");
	        $("#pcl_name").focus();
	        return;
	 	}
		
		$("#dana").val("pcl_insert");
		$.ajax({
			url : "${ct_path}/pcl_insert.do",
			type : "post",
			data : $('#pcl_insert').serialize(),
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function doPclUpdate(){
		if ($("#pcl_name").val() == "")  {
	        alert("상품분류명을 입력하세요!");
	        $("#pcl_name").focus();
	        return;
	 	}
		
		$("#dana").val("pcl_update");
		$("#insert","#pcl_insert").val("y");
		$.ajax({
			url : "${ct_path}/pcl_update.do",
			type : "post",
			data : $('#pcl_insert').serialize(),
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function doPclDelete(){
		$("#dana").val("pcl_delete");
		$("#insert","#pcl_insert").val("y");
		$.ajax({
			url : "${ct_path}/pcl_delete.do",
			type : "post",
			data : $('#pcl_insert').serialize(),
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
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
	<%-- 상단 헤더 include 처리 --%>
	<jsp:include page="../top/top_menu.jsp" flush="false" />
	
	</header>
	
	<div id="admin_content">
	
	<aside id="admin_aside">
	<%-- 관리자 외편 메뉴 include 처리 --%>
	<jsp:include page="../left/admin_left.jsp" flush="false" />
	
	</aside>
	
	<section id="admin_section">
	
	<!-- pcl_insert -->
	<div id="pclListDiv">
	
	<!-- ajax_pcl_list -->
	
	</div>
	<!-- pcl_list -->
	
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>