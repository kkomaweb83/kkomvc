<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>가상견적서 관리</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		init("0101");
		
	});
	
	function init(pcl_no){
		$.ajax({
			url : "${ct_path}/ajax_vbl_inMkrPcl.do",
			type : "post",
			data : {dana:'ajax_vbl_inMkrPcl',pcl_no:pcl_no},
			dataType : "html",
			success : function(data) {
				$("#LAY_TopPart").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
		
		$.ajax({
			url : "${ct_path}/ajax_vbl_inProList.do",
			type : "post",
			data : {dana:'ajax_vbl_inProList',pcl_no:pcl_no, proOrderCode:1},
			dataType : "html",
			success : function(data) {
				$("#LAY_OnlyProdList").html(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	function doList(page){
		document.getElementsByName("cPage")[0].value = page;
		
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
	
	function goPptProChk(object){
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
	function goMainProOrder(main_order){
		document.getElementsByName("cPage")[0].value = 1;
		document.getElementsByName("proOrderCode")[0].value = main_order.value;
		
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
	
	function row_tgl(pro_no, pro_pcl_no){
		var prono = document.getElementsByName("prono_"+pro_no)[0].value;
		var pname = document.getElementsByName("pname_"+pro_no)[0].value;
		var price = document.getElementsByName("price_"+pro_no)[0].value;
		var pricech = document.getElementsByName("pricech_"+pro_no)[0].value;
		var pcl_no = document.getElementById("LAY_MSG_"+pro_pcl_no);
		var div_totalPrice = document.getElementById("LAY_TotalPrice");
		
		var strHtml = '<table style="width: 307px; padding: 0; border-spacing: 0;">';
			strHtml += '<tbody>';
			strHtml += '<tr>';
			strHtml += '<td style="width: 164px;">';
			strHtml += '<a href="javascript:goProDlgView('+prono+',\''+pro_pcl_no+'\', 1);">';
			strHtml += pname+'</a>';
			strHtml += '<input name="pst_pro_no" value="'+prono+'" type="hidden" />';
			strHtml += '<input name="pro_disprice" value="'+price+'" type="hidden" />';
			strHtml += '</td>';
			strHtml += '<td style="width:53px; background-color: #fff; text-align:center; border-left: 1px solid #cfd2d7; border-right: 1px solid #cfd2d7;">';
			strHtml += '<input name="cnt_'+prono+'" value="1" type="text" readonly="readonly" style="width:20px;" />';
			strHtml += '<img src="${ct_path}/img/btn_cnt.gif" usemap="#MAP_BtnCnt_'+prono+'"'; 
			strHtml += ' style="vertical-align: -6px; margin-left:2px;" />';
			strHtml += '<map name="MAP_BtnCnt_'+prono+'">';
			strHtml += '<area shape="rect" coords="0,0,9,10" href="javascript:count_change('+prono+','+"'PLUS'"+')">';
			strHtml += '<area shape="rect" coords="0,10,9,20" href="javascript:count_change('+prono+','+"'MINUS'"+')">	</map>';
			strHtml += '</td>';
			strHtml += '<td style="width:88px;text-align:right;">'+pricech; 
			strHtml += '<a href="javascript:row_Delete('+"'"+pro_pcl_no+"'"+')">';
			strHtml += '<img src="${ct_path}/img/btn_del.gif" style="vertical-align: -5px; margin-left: 5px; margin-right: 3px;" /></a>';
			strHtml += '&nbsp;</td></tr></tbody>';
			strHtml += '</table>';
		pcl_no.innerHTML = strHtml;

		var price = document.getElementsByName("pro_disprice");
		var pst_pro_no = document.getElementsByName("pst_pro_no");
		var temp = 0;
		var cnt = 1;
		var temp_prono = "";
		for(var i =0; i<price.length; i++){
			temp_prono = pst_pro_no[i].value;
			cnt = document.getElementsByName("cnt_"+temp_prono)[0].value;
			temp += parseInt(price[i].value)*cnt; 
		}
		div_totalPrice.innerHTML= '<b>'+commaNum(temp)+' 원</b>';
		
	}

	function row_Delete(pro_pcl_no){
		var pcl_no = document.getElementById("LAY_MSG_"+pro_pcl_no);
		
		pcl_no.innerHTML = '<span style="color: #999999">☜ 항목을 클릭하세요.</span>';

		pstProTotal();
	}

	function count_change(prono, part){
		var cnt = document.getElementsByName("cnt_"+prono);
		var temp = 0;

		if(part == "PLUS"){
			temp = parseInt(cnt[0].value);
			cnt[0].value = temp+1;
		}else if(part == "MINUS"){
			temp = parseInt(cnt[0].value);
			if(temp > 1) cnt[0].value = temp-1;
		}

		pstProTotal();
	}

	function pstProTotal(){
		var div_totalPrice = document.getElementById("LAY_TotalPrice");
		var price = document.getElementsByName("pro_disprice");
		var pst_pro_no = document.getElementsByName("pst_pro_no");
		var temp = 0;
		var cnt = 1;
		var temp_prono = "";
		for(var i =0; i<price.length; i++){
			temp_prono = pst_pro_no[i].value;
			cnt = document.getElementsByName("cnt_"+temp_prono)[0].value;
			temp += parseInt(price[i].value)*cnt; 
		}
		div_totalPrice.innerHTML= '<b>'+commaNum(temp)+' 원</b>';
	}

	function commaNum(num) {  
	    if (num < 0) { num *= -1; var minus = true} 
	    else var minus = false      
	    var dotPos = (num+"").split(".")
	    var dotU = dotPos[0] 
	    var dotD = dotPos[1] 
	    var commaFlag = dotU.length%3 

	    if(commaFlag) { 
	            var out = dotU.substring(0, commaFlag)  
	            if (dotU.length > 3) out += "," 
	    } 
	    else var out = "" 
	    for (var i=commaFlag; i < dotU.length; i+=3) { 
	            out += dotU.substring(i, i+3)  
	            if( i < dotU.length-3) out += "," 
	    } 
	    if(minus) out = "-" + out 
	    if(dotD) return out + "." + dotD 
	    else return out 
	}
	
	function goVblUpdate(){
		if (document.vblPro_Search.vbl_title.value == "")  {
	        alert("가상견적서 제목을 입력하세요!");
	        document.vblPro_Search.vbl_title.focus();
	        return;
	 	}

	 	if (!document.getElementsByName("pst_pro_no")[0])  {
	        alert("견적서 부품을 1개 이상 선택하세요!");
	         return;
	 	}
	 	
	 	$("#dana").val("ajax_vbl_update");

		document.vblPro_Search.action = "${ct_path}/ajax_vbl_update.do";
		document.vblPro_Search.submit();
		
	}

	function goVblDelete(){
		
		$("#dana").val("ajax_vbl_delete");
		
		document.vblPro_Search.action = "${ct_path}/ajax_vbl_delete.do";
		document.vblPro_Search.submit();
	}

	function goVbbInsert(){
		if (document.vblPro_Search.vbl_title.value == "")  {
	        alert("가상견적서 제목을 입력하세요!");
	        document.vblPro_Search.vbl_title.focus();
	        return;
	 	}

	 	if (!document.getElementsByName("pst_pro_no")[0])  {
	        alert("견적서 부품을 1개 이상 선택하세요!");
	         return;
	 	}
	 	
	 	$("#dana").val("ajax_vbb_insert");
	 	
		document.vblPro_Search.action = "${ct_path}/ajax_vbb_insert.do";
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
		<input type="hidden" name="vbl_no" value="${vblVo.vbl_no}" />
		<input type="hidden" name="vbl_mem_no" value="${login.mem_no}" />
		<input type="hidden" name="sct_mem_no" value="${login.mem_no}" />
		<input type="hidden" name="sct_pro_part" value="1" />
		<input type="hidden" name="sct_pro_muti" value="3" />
		<input name="proOrderCode" type="hidden" value="1" />
		<input name="dana" id="dana" type="hidden" value="" />
		<input name="sct_pro_no" type="hidden" value="0" />

	<div class="title_div1">
		<div style="float: left;" >
			<span style="font-size: 5px;">&nbsp;</span><br/>
			<span class="title_box1">☞ 가상견적서 관리</span>
			<span style="margin-right: 20px;">&nbsp;</span>
		</div>	
		
		<div style="text-align: center; float: right; margin-left: 4px;" class="vbl_btn01">
			<span onclick="javascript:goVblDelete();" class="dana_button01"><span>삭제</span></span>
		</div>
		<div style="text-align: center; float: right; margin-left: 4px;" class="vbl_btn01">
			<span onclick="javascript:goVblUpdate();" class="dana_button01"><span>수정</span></span>
		</div>
		<div style="text-align: center; float: right; margin-left: 4px;" class="vbl_btn01">
			<c:if test="${vblVo.vbl_bor_answer == 'N'}">
			<span onclick="javascript:goVbbInsert();" class="dana_button01"><span>공유</span></span>
			</c:if>
			<c:if test="${vblVo.vbl_bor_answer == 'Y'}">
			<span class="dana_button01"><span>공유 되었습니다</span></span>
			</c:if>
		</div>
	</div>
	
	<div class="title_div2">
		<table style="width: 800px; padding: 0; border-spacing: 5px;">
		<tr>
		<td width="110"><span class="title_box2_o">가상견적서 제목</span></td>
		<td align="left">
		<input type="text" name="vbl_title" class="box_input_left" style="width: 97%;" value="${vblVo.vbl_title }"  /></td>
		</tr>
		</table>
	</div>
	
	<div style="width: 800px;">
	
	<table style="width: 800px; padding: 0; border-spacing: 0; border-top: 1px solid black; border-bottom: 1px solid #cfd2d7;">
	<tbody>
	<tr>
	<td style="width: 390px; background-color: #F8FFFF; vertical-align: top;">
		<!-- 왼쪽 검색 -->
		<div style="border: 0px solid rgb(204, 204, 204); width: 390px;" id="LAY_TopPart">
			
		</div>
		<!-- 상품 리스트 -->
		<div id="LAY_OnlyProdList">
		
		</div>	
		<!-- 상품 리스트 -->
	</td>
	<!-- 왼쪽 끝 -->
	
	<!-- 오른쪽 시작 -->
	<td style="width: 396px; vertical-align: top;">
	<div id="LAY_ChangeB">
	<!-- 가격 총합계 -->
	<table style="width: 396px; padding: 0; border-spacing: 0;">
	<tbody>
	<tr>
		<td style="width: 396px; background-color: #f6f6f6;">
		<div style="padding: 7px 0pt 5pt 5px; float: left;">
			<img src="${ct_path}/img/plus_icon.gif" style="width: 6px; height: 6px;" /><b>총합 : </b>
		</div>
		<div style="padding: 7px 15px 5pt 5px; float: right; color: rgb(245, 98, 0);" id="LAY_TotalPrice">
		<b><fmt:formatNumber value="${totPrice}" pattern="###,###,###,###" /> 원</b>
		</div>
		</td>
	</tr>
	</tbody>
	</table>
	<!-- 가격 총합계 -->
	<!-- 선택된 상품 -->
	<div style="width: 396px; height: 455px; overflow-y: scroll; overflow-x: hidden; " id="LAY_Right">
		<c:forEach var="bean" items="${pptPclList}" varStatus="class9">
		<table style="width: 396px; padding: 0; border-spacing: 0;">
		<tbody>
		<tr>
		<td>
			<table style="width: 394px; padding: 0; border-spacing: 0;">
			<tbody>
			<tr style="background-color: #254284; height: 39px;">
			<td>
			<span style="color: #ffffff; padding-left: 5px;">${bean.pcl_name }</span>
			</td>
			</tr>
			</tbody>
			</table>
		</td>
		</tr>
		</tbody>
		</table>
		
		<div id="LAY_VH_${class9.count }">
		<table style="width: 394px; padding: 0; border-spacing: 0;">
		<tbody>	
		<tr>
			<td bgcolor="#ffffff" width="394">
			<table style="width: 394px; padding: 0; border-spacing: 0;">
			<tbody>
				<c:forEach var="bean2" items="${bean.pcl_list}" varStatus="class2">
				<tr style="height: 30px;">
					<td style="background-color: #F8FFFF; width: 77px; text-align: center; border-bottom: 1px solid #cfd2d7; border-right: 1px solid #cfd2d7;">
						<a href="javascript:init('${bean2.pcl_no }')">${bean2.pcl_name }</a>
					</td>
					<td style="border-bottom: 1px solid #cfd2d7; width: 317px; text-align: left;">
						<div style="display: block; visibility: visible;" id="LAY_MSG_${bean2.pcl_no }">
						
						<c:if test="${empty bean2.proVO }">
						<span style="color: #999999">☜ 항목을 클릭하세요.</span>
						</c:if>
						<c:if test="${!empty bean2.proVO }">
							<table style="width: 307px; padding: 0; border-spacing: 0;">
							<tbody>
							<tr>
							<td style="width: 164px;">
							<a href="javascript:goProDlgView(${bean2.proVO.pro_no }, '${bean2.proVO.pro_pcl_no }', 1);">${bean2.proVO.pro_name}</a>
							<input name="pst_pro_no" value="${bean2.proVO.pro_no}" type="hidden">
							<input name="pro_disprice" value="${bean2.proVO.pro_disprice}" type="hidden">
							</td>
							<td style="width:53px; background-color: #fff; text-align:center; border-left: 1px solid #cfd2d7; border-right: 1px solid #cfd2d7;">
							<input name="cnt_${bean2.proVO.pro_no}" value="${bean2.proVO.pst_quantity }" type="text" readonly="readonly" style="width:20px;" />
							<img src="${ct_path}/img/btn_cnt.gif" usemap="#MAP_BtnCnt_${bean2.proVO.pro_no}" style="vertical-align: -6px; margin-left:2px;" />
							<map name="MAP_BtnCnt_${bean2.proVO.pro_no}">
							<area shape="rect" coords="0,0,9,10" href="javascript:count_change(${bean2.proVO.pro_no},'PLUS')">
							<area shape="rect" coords="0,10,9,20" href="javascript:count_change(${bean2.proVO.pro_no},'MINUS')"></map>
							</td>
							<td style="width:88px;text-align:right;">${bean2.proVO.pro_ch2_price} 
							<a href="javascript:row_Delete('${bean2.proVO.pro_pcl_no}')">
							<img src="${ct_path}/img/btn_del.gif" style="vertical-align: -5px; margin-left: 1px; margin-right: 3px;" /></a>&nbsp;</td>
							</tr>
							</tbody>
							</table>						
						</c:if>
						
						</div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			</td>
		</tr>
		</tbody>
		</table>
		</div>
	</c:forEach>	
	
	</div>
	<!-- 선택된 상품 -->
	
	</div>
	</td>
	<!-- 오른쪽 끝 -->
	
	</tr>	
	
	</tbody>
	</table>
	
	</div>		
	
	<div style="margin-top: 10px; text-align: right; padding-right: 10px; height: 150px;">
	<a href="javascript:goSctOdr();">	
	<img src="${ct_path}/img/btn_buy.gif" border="0"></a>&nbsp;
	<a href="javascript:goSctmultiInsert();">
	<img src="${ct_path}/img/btn_cart.gif" border="0"></a>
	</div>
	
	</form>
	</section>
	
	</div>
	
	<footer>
	
	</footer>
	
<!-- 상세보기 dlg -->
<div id="dialog"></div>		
</body>
</html>