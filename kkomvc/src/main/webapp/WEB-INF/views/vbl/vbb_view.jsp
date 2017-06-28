<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>공유견적서 관리</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {

	});
	
	function goSctOdr(){
		
		if (!document.getElementsByName("pst_pro_no")[0])  {
	        alert("바로구매할 부품을 1개 이상 선택하세요!");
	         return;
	 	}
	 	
		$("#dana").val("sct_odr_doc");
	 	
		document.vblPro_Search.action = "${ct_path}/sct_odr_doc.do";
		document.vblPro_Search.submit();	
	}

	function goMyVblInsert(){
		
		if (!document.getElementsByName("pst_pro_no")[0])  {
	        alert("바로구매할 부품을 1개 이상 선택하세요!");
	         return;
	 	}
	 	
		$("#dana").val("ajax_vbl_insert");
	 	
		document.vblPro_Search.action = "${ct_path}/ajax_vbl_insert.do";
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
	function search_keyword(){
		var searchUi = document.getElementsByName("searchValue")[1];
		var searchValue = $.trim(searchUi.value);
		if(searchValue == ""){
			//alert("검색어를 입력하세요!");
			searchUi.value = "";
			//searchUi.focus();
			//return;
		}
		searchUi.value = searchValue;
		
		document.getElementsByName("cPage")[0].value = 1;
		
		$("#dana").val("ajax_vbl_inProList");
		$.ajax({
			url : "${ct_path}/ajax_vbl_inProList.do",
			type : "post",
			data : $('#vblPro_Search').serialize(),
			dataType : "html",
			success : function(data) {
				$("#LAY_OnlyProdList").html(data);
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
			url : "${ct_path}/ajax_pro_mainView.do",
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
	function goVbbRecomm(){
		location.href = "${ct_path}/vbb_recomm.do?dana=vbb_recomm&vbb_no=${vbbContent.vbb_no}";
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
	<jsp:include page="../left/vbl_left.jsp" flush="false" />
	
	</aside>
	
	<section id="admin_section">

<form method="post" id="vblPro_Search" name="vblPro_Search">
	<input name="sct_pro_no" type="hidden" value="0" />
	<input name="dana" id="dana" type="hidden" value="" />
	<input type="hidden" name="vbl_mem_no" value="${login.mem_no}" />
	<input type="hidden" name="sct_mem_no" value="${login.mem_no}" />
	<input type="hidden" name="sct_pro_part" value="1" />
	<input type="hidden" name="sct_pro_muti" value="3" />
	<input type="hidden" name="vbl_title" value="${vbbContent.vbb_title}" />
	<input type="hidden" name="vbl_bor_answer" value="Y" />
	<c:forEach var="vbbPro" items="${vbbProList}">
	<input name="pst_pro_no" value="${vbbPro.pro_no}" type="hidden" />
	<input name="cnt_${vbbPro.pro_no}" value="${vbbPro.vds_quantity }" type="hidden" />
	</c:forEach>
</form>

<div class="title_div1">
	<div style="float: left;" >
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 공유견적서 관리</span>
		<span style="margin-right: 20px;">&nbsp;</span>
	</div>
	
	<div style="text-align: center; float: right; margin-left: 4px;" class="vbl_btn01">
		<span onclick="javascript:goVbbRecomm();" class="dana_button01"><span>추천</span></span>
	</div>	
</div>

<table class="lngTable2" style="width: 100%;">
	<tr>
		<th>번호</th>
		<th>글쓴이</th>
		<th>날짜</th>
		<th>추천수</th>
		<th>조회수</th>
		<th>배틀등록여부</th>
	</tr>
	<tr class="vbb_tr">
		<td>${vbbContent.vbb_no}</td>
		<td>${vbbContent.mem_id}</td>
		<td>${vbbContent.vbb_date}</td>
		<td>${vbbContent.vbb_recomm}</td>
		<td>${vbbContent.vbb_count}</td>
		<td>${vbbContent.vbb_btr_answer}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="5" align="left">${vbbContent.vbb_title}</td>
	</tr>
</table>

<div class="title_div3">
	<div style="float: left; padding-top: 10px;" >
		<span class="title_box1_o">
		<c:if test="${login.mem_id != vbbContent.mem_id}">
		<a href="javascript:goMyVblInsert();">
		내 가상견적서에 담기</a>
		</c:if>
		<c:if test="${login.mem_id == vbbContent.mem_id}">
		${vbbContent.mem_id}님이  등록한 가상견적서 입니다.
		</c:if>
		</span>
	</div>

	<div style="float: right;">
		<a href="javascript:goSctOdr();">	
		<img src="${ct_path}/img/btn_buy.gif" border="0"></a>&nbsp;
		<a href="javascript:goSctmultiInsert();">
		<img src="${ct_path}/img/btn_cart.gif" border="0"></a>
	</div>
</div>


<div class="title_box3">
<span style="margin-right: 10px;">☞  견적서 상품 목록</span> 
</div>

<c:forEach var="vbbPro" items="${vbbProList}">
	<table style="border-bottom: #336699 1px solid; padding-bottom: 5px; padding-top: 5px; width: 100%; border-spacing: 0; text-align: center;">
		<tr>
			<td style="text-align: left; width: 70px;">${vbbPro.pcl_name }</td>
			<td style="text-align: center; width: 100px;">
				<a href="javascript:goProDlgView(${vbbPro.pro_no }, '${vbbPro.pcl_no }', 1);">
				<img src="${ct_path}/product_img/${vbbPro.pmg_file }" style="width: 60px; height: 60px; border: 0px;" /></a>
			</td>
			<td style="width: 500px;">
				<table style="text-align: left;">
					<tr>
						<td style="font-weight: bold;" align="left">
							<a href="javascript:goProDlgView(${vbbPro.pro_no }, '${vbbPro.pcl_no }', 1);">
							${vbbPro.pro_name }</a>
						</td>
					</tr>
					<tr>
						<td style="color: #6666CC;" align="left">등록일 : ${vbbPro.pro_regdate }</td>
					</tr>
				</table>
			</td>
			<td>${vbbPro.vds_quantity }개</td>
			<td style="color: #FF3333; font-size: 11pt; font-weight: bold; width: 100px; text-align: right;">${vbbPro.pro_disprice }</td>
		</tr>
	</table>
</c:forEach>
<form action="${ct_path}/vbb_reply_insert.do?dana=vbb_reply_insert&vbb_no=${vbbContent.vbb_no}" method="post">
<table class="lngTable" style="width: 100%;">
	<tr>
		<th width="10%">내용</th>
		<td><textarea rows="5" name="vbr_content"></textarea></td>
		<td width="10%" style="vertical-align: middle;">
			<input type="image" src="${ct_path}/img/btn_nl_ok.gif" value="댓글 등록" />
		</td>
	</tr>
</table>
</form>
<table class="lngTable" style="width: 100%;"> 
	<tr>
		<th width="10%">번호</th>
		<th width="70%">내용</th>
		<th width="10%">글쓴이</th>
		<th width="10%">날짜</th>
	</tr>
	<c:if test="${empty vbrList}">
	<tr>
		<td colspan="4">해당 글에 등록된 댓글이 없습니다.</td>
	</tr>
	</c:if>
	<c:forEach var="vbr" items="${vbrList}">
		<form action="${ct_path}/vbb_reply_update.do?dana=vbb_reply_update&vbr_no=${vbr.vbr_no}&vbb_no=${vbbContent.vbb_no}" method="post">
		<c:if test="${login.mem_id != vbr.mem_id}">
			<tr>
				<td style="text-align: center; vertical-align: middle;">${vbr.vbr_no}</td>
				<td><div style="overflow-y: scroll; height: 100px; text-align: left;">${vbr.vbr_content}</div></td>
				<td style="vertical-align: middle;">${vbr.mem_id}</td>
				<td style="vertical-align: middle;">${vbr.vbr_rdate}</td>
			</tr>
		</c:if>
		<c:if test="${login.mem_id == vbr.mem_id}">
			<tr>
				<td style="text-align: center;vertical-align: middle;">${vbr.vbr_no}</td>
				<td><textarea rows="5" name="vbr_content">${vbr.vbr_content}</textarea></td>
				<td style="vertical-align: middle;">
					${vbr.mem_id}<br />
					<a href="${ct_path}/vbb_reply_delete.do?dana=vbb_reply_delete&vbr_no=${vbr.vbr_no}&vbb_no=${vbbContent.vbb_no}"><img src="${ct_path}/img/btn_delete.gif" border=0 /></a>
					<input type="image" src="${ct_path}/img/btn_update.gif"/>
				</td>
				<td style="vertical-align: middle;">${vbr.vbr_rdate}</td>
			</tr>
		</c:if>
		</form>
	</c:forEach>
</table>
<div style="text-align: center; display: none;">
<a href="${ct_path}/vbb/list.ama"><img src="${ct_path}/img/btn_list.gif" border=0 /></a>
<a href="${ct_path}/vbb_recomm.do?dana=vbb_recomm&vbb_no=${vbbContent.vbb_no}"><img src="${ct_path}/img/btn_good.gif" border=0 /></a>
<c:if test="${login.mem_id == vbbContent.mem_id}">
	<a href="${ct_path}/vbb_preupdate.do?dana=vbb_preupdate&vbb_no=${vbbContent.vbb_no}"><img src="${ct_path}/img/btn_update.gif" border="0"/></a>
	<a href="${ct_path}/vbb_delete.do?dana=vbb_delete&vbb_no=${vbbContent.vbb_no}"><img src="${ct_path}/img/btn_delete.gif" border=0 /></a>
</c:if>
</div>

	</section>
	
	</div>
	
	<footer>
	
	</footer>
	
<!-- 상세보기 dlg -->
<div id="dialog"></div>	
</body>
</html>