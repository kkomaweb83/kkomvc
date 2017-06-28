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
<title>주문내역 관리</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		
	});
	
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
	
	function updateOdr_condition(){
		var newCondition = document.getElementsByName("odr_condition")[0].value;
		var odr_no = document.getElementsByName("odr_no")[0].value;
		location.href = "${ct_path}/odr_condition.do?dana=odr_condition&odr_condition="+newCondition+"&odr_no="+odr_no;
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
	
	<div class="title_div1">
		<div style="float: left;" >
			<span style="font-size: 5px;">&nbsp;</span><br/>
			<span class="title_box1">☞ 주문/배송 상세정보</span>
			<span style="margin-right: 20px;">&nbsp;</span>
		</div>	
	</div>
	
	<table border="1" style="border: thin; border-color: black; width: 800px;">
		<tr>
			<td class="box_top" style="width: 120px">주문번호</td>
			<td style="width: 280px"><div>${mpCommand.odr_no }</div>
			<input type="hidden" name="odr_no" value="${mpCommand.odr_no }"/>
			</td>
			<td class="box_top" style="width: 120px">회원ID</td>
			<td style="width: 300px"><div>${mpCommand.mem_id }</div>
			</td>
		</tr>
		<tr>
			<td class="box_top" style="width: 120px">이름</td>
			<td style="width: 300px"><div>${mpCommand.mem_name}</div></td>
			<td class="box_top" style="width: 120px">이메일</td>
			<td style="width: 300px"><div>${mpCommand.mem_email }</div></td>
		</tr>
		<tr>
			<td class="box_top" style="width: 120px">주소</td>
			<td style="width: 700px" colspan="3"><div> ${mpCommand.mem_addr }</div></td>
		</tr>
		<tr>
			<td class="box_top" style="width: 120px">연락처</td>
			<td style="width: 300px"><div> ${mpCommand.mem_tel}</div></td>
			<td class="box_top" style="width: 120px">주문일</td>
			<td style="width: 300px"><div> ${mpCommand.odr_odate }</div></td>
		</tr>
		<tr>
			<td class="box_top" style="width: 120px">배송지</td>
			<td style="width: 700px" colspan="3"><div>[${mpCommand.dlv_zonecode }] ${mpCommand.dlv_sendaddr } ${mpCommand.dlv_sendaddr2 }</div></td>
		</tr>
		<tr>
			<td class="box_top" style="width: 120px">주문상태</td>
			<td style="width: 300px" align="center"><span style="color: red;"> <b>${mpCommand.odr_condition2 }</b></span>
				<select name="odr_condition">
					<option value="1" 
					<c:if test="${mpCommand.odr_condition == '1'}">selected="selected"</c:if>>
					주문신청</option>
					<option value="2"
					<c:if test="${mpCommand.odr_condition == '2'}">selected="selected"</c:if>>
					결제확인</option>
					<option value="3"
					<c:if test="${mpCommand.odr_condition == '3'}">selected="selected"</c:if>>
					배송</option>
					<option value="4"
					<c:if test="${mpCommand.odr_condition == '4'}">selected="selected"</c:if>>
					주문완료</option>
				</select>
				<input type="button" value="변경" onclick="javascript:updateOdr_condition();">
			</td>
			<td class="box_top" style="width: 120px">주문 총 금액</td>
			<td style="width: 300px" class="ar"><fmt:formatNumber value="${mpCommand.odr_amount}" pattern="###,###,###,###" /> 원 
			<span style="color: #E3C4FF;">(배송비 2,500원 포함)</span>
			</td>
		</tr>
		<tr>
			<td class="box_top" style="width: 120px">사용 마일리지</td>
			<td style="width: 300px" class="ar"><span> <fmt:formatNumber value="${mpCommand.odr_mileage}" pattern="###,###,###,###" /></span>
			</td>
			<td class="box_top" style="width: 120px">잔여 마일리지</td>
			<td style="width: 280px;" class="ar"><span> <fmt:formatNumber value="${mpCommand.mem_mil}" pattern="###,###,###,###" /></span>
			</td>
		</tr>
	</table>
	
	<!-- 주문내역 -->				
	<div style="text-align: left; margin-top: 10px;">
	<div class="title_box3">☞  주문 내역확인</div>
								
	<table style="padding-bottom: 5px; padding-top: 5px; width: 800px; border-spacing: 0;">
	
	<tr style="background-color: #ffdab9;">
		<td colspan="2">
		<span style="padding-left: 5px; margin-right: 150px;">주문리스트</span>
		<span>상품</span>
		</td>
		<td align="center">가격</td>
		<td align="center">수량</td>
		<td align="center">소계</td>
		<td align="center">적립금</td>
	</tr>	
	
	<c:forEach var="bean" items="${odtList}">
	<tr>
		<td width="90" align="center" style="border-bottom: gray 1px dotted;">
		<a href="javascript:goProDlgView(${bean.sct_proVO.pro_no }, '${bean.sct_proVO.pro_pcl_no }', ${bean.sct_pro_part });">
		<img src="${ct_path}/product_img/${bean.sct_proVO.pmg_file }" style="width: 50px; height: 50px; border: 0px;">
		</a>
		</td>
		<td width="390" style="border-bottom: gray 1px dotted;">
			<table>
			<tr><td>
			<span style="color: blue;">[${bean.sct_proVO.pcl_name }]</span>
			</td></tr>
			<tr><td>
			<a href="javascript:goProDlgView(${bean.sct_proVO.pro_no }, '${bean.sct_proVO.pro_pcl_no }', ${bean.sct_pro_part });">
			${bean.sct_proVO.pro_name }</a>
			</td></tr>
			</table>
		</td>
		<td width="100" align="center" style="color: #FF3333; font-size: 10pt; font-weight: bold; border-bottom: gray 1px dotted;">
			${bean.sct_proVO.pro_ch_price }
		</td>
		<td width="80" align="center" style="border-bottom: gray 1px dotted;">
			${bean.sct_count } 개</td>
		<td width="100" align="center" style="color: #FF3333; font-size: 10pt; font-weight: bold; border-bottom: gray 1px dotted;">
			${bean.sct_proVO.pro_tot_ch_price }
		</td>
		<td width="100" align="center" style="border-bottom: gray 1px dotted;">
			${bean.sct_proVO.pro_ch_milege }
		</td>
	</tr>		
	</c:forEach>
	</table>
	</div>
	<!-- 주문내역 -->	
	
	<!-- 주문내역 합계 -->
	<div style="text-align:right; 
					font-size: 11pt;
					height: 50px;
					padding-right: 10px;
					margin-top: 5px;
					margin-bottom: 5px;
					line-height:20px;
					border-bottom: #6699FF 3px solid;">
	
	총 합계 금액 : <span style="color: red;">${sctTotPrivceVo.sct_tot_ch_disprice }</span><br />
	<span style="color: red;">총 적립금: ${sctTotPrivceVo.sct_tot_ch_milege }</span> 
					
	</div>
	<!-- 주문내역 합계 -->
	
	</section>
	
	</div>
	
	<footer>
	
	</footer>
	
<!-- 상세보기 dlg -->
<div id="dialog"></div>		
</body>
</html>