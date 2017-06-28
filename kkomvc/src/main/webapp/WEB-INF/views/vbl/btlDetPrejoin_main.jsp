<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>베틀 견적서</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		 $("#tabs").tabs();
	});
	
	function ajaxBtlJoinDetList(vbj_no){
		$.ajax({
			url : "${ct_path}/ajaxBtlJoinDetList.do",
			type : "post",
			data : {dana:'ajaxBtlJoinDetList',reurl:'main',vbj_no:vbj_no},
			dataType : "html",
			success : function(data) {
				$("#ajaxVbbRead").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	
	function getAjaxVbbList(){
		$.ajax({
			url : "${ct_path}/ajaxVbbList.do",
			type : "post",
			data : {dana:'ajaxVbbList',reurl:'admin',vbb_mem_no:'${login.mem_no}'},
			dataType : "html",
			success : function(data) {
				$("#ajaxVbbList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function doList(page){
		$.ajax({
			url : "${ct_path}/ajaxVbbList.do",
			type : "post",
			data : {dana:'ajaxVbbList',cPage:page,reurl:'admin'},
			dataType : "html",
			success : function(data) {
				$("#ajaxVbbList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function getAjaxVbbRead(vbb_no){
		$.ajax({
			url : "${ct_path}/ajaxVbbRead.do",
			type : "post",
			data : {dana:'ajaxVbbRead',vbb_no:vbb_no,reurl:'btl'},
			dataType : "html",
			success : function(data) {
				$("#ajaxVbbRead").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function ajaxBtlDetJoin(vbb_no, answer){
		if(answer == "y"){
			alert("이미 베틀에 참여한 견적서 입니다.");
			return;
		}
		
		var tabs = "";
		tabs = $( "#tabs" ).tabs();
		tabs.tabs({ active: 0 });
		
		$.ajax({
			url : "${ct_path}/ajaxBtlDetJoin.do",
			type : "post",
			data : {dana:'ajaxBtlDetJoin',vbb_no:vbb_no,btl_no:'${btl.btl_no}'},
			dataType : "html",
			success : function(data) {
				$("#ajaxBtlJoinList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
		
		getAjaxVbbList();
	}
	function ajaxBtlJoinDowngrade(vbj_no,btl_no,vbj_title){
		var tabs = "";
		tabs = $( "#tabs" ).tabs();
		tabs.tabs({ active: 0 });
		
		$.ajax({
			url : "${ct_path}/ajaxBtlJoinDowngrade.do",
			type : "post",
			data : {dana:'ajaxBtlJoinDowngrade',vbj_no:vbj_no,btl_no:btl_no,vbj_title:vbj_title},
			dataType : "html",
			success : function(data) {
				$("#ajaxBtlJoinList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
		
		getAjaxVbbList();
	}
	function ajaxBtlDetUnjoin(vbj_no){
		$.ajax({
			url : "${ct_path}/ajaxBtlDetUnjoin.do",
			type : "post",
			data : {dana:'ajaxBtlDetUnjoin',vbj_no:vbj_no,btl_no:'${btl.btl_no}'},
			dataType : "html",
			success : function(data) {
				$("#ajaxBtlJoinList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
		
		getAjaxVbbList();
	}
	
	function goSctOdr(){
		
		if (!document.getElementsByName("pst_pro_no")[0])  {
	        alert("바로구매할 부품을 1개 이상 선택하세요!");
	         return;
	 	}
	 	
		$("#dana").val("sct_odr_doc");
	 	
		document.vblPro_Search.action = "${ct_path}/sct_odr_doc.do";
		document.vblPro_Search.submit();	
	}
	
	function goSctmultiInsert(){
		if (!document.getElementsByName("pst_pro_no")[0])  {
	        alert("장바구니에 담을 부품을 1개 이상 선택하세요!");
	         return;
	 	}
		
		$("#dana").val("ajax_sct_multi_insert");
	 	
		document.vblPro_Search.action = "${ct_path}/ajax_sct_multi_insert.do";
		document.vblPro_Search.submit();	
	}
	
	function init(){
		getAjaxVbbList();
		
		$.ajax({
			url : "${ct_path}/ajaxBtlDetList.do",
			type : "post",
			data : {dana:'ajaxBtlDetList',btl_no:'${btl.btl_no}',reurl:'main'},
			dataType : "html",
			success : function(data) {
				$("#ajaxBtlJoinList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	document.onload=init();
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
	<form method="post" id="vblPro_Search" name="vblPro_Search">
		<input name="dana" id="dana" type="hidden" value="" />
	<div class="title_div1">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 배틀 견적서 관리</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
	</div>
	
	<!-- pro_admin_list -->
	<div style="width: 800px;">
	
	<table class="lngTable2" style="width: 800px;">
		<colgroup>
			<col width="15%;" />
			<col width="40%;" />
			<col width="10%;" />
			<col width="35%;" />
		</colgroup>
		<tr>
			<th>배틀 명</th>
			<td colspan="3">${btl.btl_title}</td>
		</tr>
		<tr>
			<th>배틀 시작일</th>
			<td>${btl.btl_sdate }</td>
			<th>배틀 마감일</th>
			<td>${btl.btl_cdate }</td>
		</tr>
		<tr>
			<th>배틀 내용</th>
			<td colspan="3"><pre>${btl.btl_content}</pre></td>
		</tr>
	</table>
	
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">배틀 참가 견적서</a></li>
			<li><a href="#tabs-2">공유 견적서</a></li>
		</ul>
		<div id="tabs-1">
			<div id="ajaxBtlJoinList" style="width: 100%; margin: 0px; padding: 0px;">
			</div>
		</div>
		<div id="tabs-2">
			<div id="ajaxVbbList" style="width: 100%; margin: 0px; padding: 0px;">
			</div>
		</div>
	</div>
	
	<div id="ajaxVbbRead"></div>
	 
	</div>
	</form>
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>