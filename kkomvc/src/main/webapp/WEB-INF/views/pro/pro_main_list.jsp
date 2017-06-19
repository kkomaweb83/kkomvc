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
#wrapMiniTex {
	position: fixed;
	bottom: 0pt;
	z-index: 99;
}
</style>
<script type="text/javascript">
	$(function() {
		init();

	});
	
	function init(){
		$.ajax({
			url : "${ct_path}/ajax_pro_topSearch.da",
			type : "post",
			data : {dana:'ajax_pro_topSearch',pro_pcl_no:'${param.pro_pcl_no}'},
			dataType : "html",
			success : function(data) {
				$("#proTopSearchDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
		
		$.ajax({
			url : "${ct_path}/ajax_pro_list.da",
			type : "post",
			data : {dana:'ajax_pro_list',pro_pcl_no:'${param.pro_pcl_no}',proOrderCode:'1'},
			dataType : "html",
			success : function(data) {
				$("#proListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
		
		<c:if test="${login.cmd == 101}">
		$.ajax({
			url : "${ct_path}/ajax_sct_list.da",
			type : "post",
			data : {dana:'ajax_sct_list',sct_mem_no:'${login.mem_no }',sct_part:1},
			dataType : "html",
			success : function(data) {
				$("#miniSctListDiv").html(data);
			},
			error : function() {
				alert("실패9");
			}
		});
		</c:if>
	}
	function doList(page){
		$("#cPage").val(page);
		$("#dana").val("ajax_pro_list");
		$.ajax({
			url : "${ct_path}/ajax_pro_list.da",
			type : "post",
			data : $('#pro_pclSearch').serialize(),
			dataType : "html",
			success : function(data) {
				$("#proListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	
	function proListPclWrap(part){
		var area = document.getElementById("pclWrap");
		var area2 = document.getElementById("pclListDiv");
		var strHtml = "";

		if(part == 1){
			area2.style.display = "none";
			strHtml += '<a href="javascript:proListPclWrap(2);">';
			strHtml += '<img src="${ct_path}/img/open_btn.gif" /></a>';
			area.innerHTML = strHtml;
		}else{
			area2.style.display = "inline";
			strHtml += '<a href="javascript:proListPclWrap(1);">';
			strHtml += '<img src="${ct_path}/img/close_btn.gif" /></a>';
			area.innerHTML = strHtml;
		}
	}
	
	function goMainTopChk(proOrderCode){
		if(proOrderCode != 0){
			$("#proOrderCode").val(proOrderCode);
		} 
		$("#cPage").val(1);
		$("#dana").val("ajax_pro_pclSearch");
		$.ajax({
			url : "${ct_path}/ajax_pro_pclSearch.da",
			type : "post",
			data : $('#pro_pclSearch').serialize(),
			dataType : "html",
			success : function(data) {
				$("#proListDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});		
	}
	
	function goProMainView(pro_no, pro_pcl_no){
		$.ajax({
			url : "${ct_path}/ajax_pro_mainView.da",
			type : "post",
			data : {dana:'ajax_pro_mainView',pro_no:pro_no,pro_pcl_no:pro_pcl_no},
			dataType : "html",
			success : function(data) {
				$("#proMainViewDiv").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	
	function goShopCart(pro_no, mem_no, sct_pro_part, sct_part){
		var sctDiv = "proMainViewDiv";
		if(sct_part == 1) sctDiv = "miniSctListDiv"; 
		
		$.ajax({
			url : "${ct_path}/ajax_sct_insert.da",
			type : "post",
			data : {dana:'ajax_sct_insert',sct_pro_no:pro_no,sct_mem_no:mem_no,sct_pro_part:sct_pro_part,sct_part:sct_part},
			dataType : "html",
			success : function(data) {
				$("#"+sctDiv).html(data);
			},
			error : function() {
				alert("실패");
			}
		});
		
		if(sct_part != 1){
			var area = document.getElementById("wrapMiniTex");
			area.style.display = "none";
		}
	}
	
	function wrapShow(part){
		var area = document.getElementById("wrapMiniTex");
		var area1 = document.getElementById("miniTex_top_clearfix");
		var area2 = document.getElementById("miniTex_body");
		if(part == 1){
			area.style.height = "225px";
			area2.style.display = "inline";
			area1.innerHTML = '<a href="javascript:wrapShow(2);">장바구니 ▼</a>';
		}else{
			area.style.height = "35px";
			area2.style.display = "none";
			area1.innerHTML = '<a href="javascript:wrapShow(1);">장바구니 ▲</a>';
		}
	}
	function chZindex(no, part){
		var area3 = document.getElementById(no);
		area3.style.zIndex=199;
		
		var area = document.getElementById("wrapMiniTex");
		var area1 = document.getElementById("miniTex_top_clearfix");
		var area2 = document.getElementById("miniTex_body");
		if(part == 1){
			area.style.height = "225px";
			area2.style.display = "inline";
			area1.innerHTML = '<a href="javascript:wrapShow(2);">장바구니 ▼</a>';
		}else{
			area.style.height = "35px";
			area2.style.display = "none";
			area1.innerHTML = '<a href="javascript:wrapShow(1);">장바구니 ▲</a>';
		}
	}
	
	function sct_count_ch(sct_no, part, mem_no, prono, sct_part){
		var cnt = document.getElementsByName("cnt_"+prono);
		var temp = 0;
		var sctDiv = "proMainViewDiv";
		if(sct_part == 1) sctDiv = "miniSctListDiv"; 

		if(part == "PLUS"){
			temp = parseInt(cnt[0].value);
			temp = temp+1;
		}else if(part == "MINUS"){
			temp = parseInt(cnt[0].value);
			if(temp > 1) temp = temp-1;
		}
		
		$.ajax({
			url : "${ct_path}/ajax_sct_update.da",
			type : "post",
			data : {dana:'ajax_sct_update',sct_no:sct_no, sct_count: temp, sct_mem_no: mem_no, sct_part:sct_part},
			dataType : "html",
			success : function(data) {
				$("#"+sctDiv).html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}

	function goSctDelete(sct_no, mem_no, sct_part){
		var sctDiv = "proMainViewDiv";
		if(sct_part == 1) sctDiv = "miniSctListDiv";
		
		$.ajax({
			url : "${ct_path}/ajax_sct_delete.da",
			type : "post",
			data : {dana:'ajax_sct_delete',sct_no:sct_no, sct_mem_no: mem_no, sct_part:sct_part},
			dataType : "html",
			success : function(data) {
				$("#"+sctDiv).html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}

	function goSctAllDelete(mem_no, sct_part){
		var sctDiv = "proMainViewDiv";
		if(sct_part == 1) sctDiv = "miniSctListDiv";
		
		$.ajax({
			url : "${ct_path}/ajax_sct_alldelete.da",
			type : "post",
			data : {dana:'ajax_sct_alldelete',sct_mem_no: mem_no, sct_part:sct_part},
			dataType : "html",
			success : function(data) {
				$("#"+sctDiv).html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function goProDlgView(pro_no, pro_pcl_no, sct_pro_part){
		$("#dialog").dialog({ 
            autoOpen:true, //자동으로 열리지않게
			width:600,
			height:500,
			modal:false, //모달대화상자
            resizable:false, //크기 조절 못하게
			show : 'slide', hide : 'slide',
			position : [500, 500]
		});
		
		$.ajax({
			url : "${ct_path}/ajax_pro_mainView.da",
			type : "post",
			data : {dana:'ajax_pro_mainView',pro_no:pro_no, pro_pcl_no:pro_pcl_no, view_area:2},
			dataType : "html",
			success : function(data) {
				$("#dialog").html(data);
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
	
	<div id="content">
	
	<!-- 전체 -->
	<div id="proMainViewDiv" style="width: 960px; margin: 0 auto;">
	
	<!-- 검색 -->
	<div id="proTopSearchDiv" style="margin-top: 0px;">
	
	</div>
	<!-- 검색 -->
	
	<!-- 리스트 -->
	<div id="proListDiv">
	
	</div>
	<!-- 리스트 -->
	
	<div style="height: 200px;"></div>
	
	</div>
	
	<c:if test="${login.cmd == 101}">
	<!-- 하단 장바구니 -->
	<div id="wrapMiniTex">
		<div id="miniTex_top_clearfix"><a href="javascript:wrapShow(1);">장바구니 ▲</a></div>
	<div id="miniTex_body">
		<div id="miniSctListDiv">
		<!-- 하단 장바구니 -->
		</div>
	</div>
	</div>
	<!-- 하단 장바구니 -->
	</c:if>
	
	</div>
	
	<footer>
	
	</footer>
<!-- 상세보기 dlg -->
<div id="dialog"></div>			
</body>
</html>