<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>공유견적서 관리</title>

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
			url : "${ct_path}/ajax_vbb_list.do",
			type : "post",
			data : {dana:'ajax_vbb_list'},
			dataType : "html",
			success : function(data) {
				$("#pclListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function doList(page){
		$.ajax({
			url : "${ct_path}/ajax_vbb_list.do",
			type : "post",
			data : {dana:'ajax_vbb_list',cPage:page},
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
	<%-- 견적서 외편 메뉴 include 처리 --%>
	<jsp:include page="../left/vbl_left.jsp" flush="false" />
	
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