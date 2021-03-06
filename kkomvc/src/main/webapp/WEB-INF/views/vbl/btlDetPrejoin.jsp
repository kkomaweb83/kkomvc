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
		if("${btl_mil}" == "Y"){
			alert("베틀 마감 마일리지가 지급 되었습니다.");
		}
		$("#tabs").tabs();
	});
	
	function ajaxBtlJoinDetList(vbj_no){
		$.ajax({
			url : "${ct_path}/ajaxBtlJoinDetList.do",
			type : "post",
			data : {dana:'ajaxBtlJoinDetList',vbj_no:vbj_no},
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
			data : {dana:'ajaxVbbList',reurl:'admin'},
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
		if("${cs_date_chk}" == "N"){
			alert("기간이 지난 베틀 입니다.");
			return;
		}
		
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
			data : {dana:'ajaxBtlDetJoin',vbb_no:vbb_no,btl_no:'${btl.btl_no}',reurl:'admin'},
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
		var tabs = "";
		tabs = $( "#tabs" ).tabs();
		tabs.tabs({ active: 0 });
		
		$.ajax({
			url : "${ct_path}/ajaxBtlDetUnjoin.do",
			type : "post",
			data : {dana:'ajaxBtlDetUnjoin',vbj_no:vbj_no,btl_no:'${btl.btl_no}',reurl:'admin'},
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
	function init(){
		getAjaxVbbList();
		
		$.ajax({
			url : "${ct_path}/ajaxBtlDetList.do",
			type : "post",
			data : {dana:'ajaxBtlDetList',btl_no:'${btl.btl_no}',reurl:'admin'},
			dataType : "html",
			success : function(data) {
				$("#ajaxBtlJoinList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	
	function goBtlEnd(vbj_no){
		if("${cs_date_chk}" == "Y"){
			alert("아직 베틀 기간이 남아있습니다.");
			return;
		}
		
		location.replace("${ct_path}/ajaxBtlEnd.do?dana=ajaxBtlEnd&btl_no=${btl.btl_no}&reurl=admin");
		
		/*
		$.ajax({
			url : "${ct_path}/ajaxBtlEnd.do",
			type : "post",
			data : {dana:'ajaxBtlEnd',btl_no:'${btl.btl_no}',reurl:'admin'},
			dataType : "html",
			success : function(data) {
				$("#ajaxBtlJoinList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
		*/
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
	<%-- 관리자 외편 메뉴 include 처리 --%>
	<jsp:include page="../left/admin_left.jsp" flush="false" />
	
	</aside>
	
	<section id="admin_section">
	
	<div class="title_div1" style="float: left; width: 80%;">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 배틀 견적서 관리</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
	</div>
	
	<div style="width: 120px; text-align: center; float: right;" class="vbl_btn01">
	<c:if test="${btl.btl_end != 'Y'}">
	<span onclick="javascript:goBtlEnd();" class="dana_button01"><span>마감</span></span>
	</c:if>
	<c:if test="${btl.btl_end == 'Y'}">
	<span class="dana_button01"><span>마감 되었습니다.</span></span>
	</c:if>
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
	
	</section>
	
	</div>
	
	<footer>
	
	</footer>
</body>
</html>