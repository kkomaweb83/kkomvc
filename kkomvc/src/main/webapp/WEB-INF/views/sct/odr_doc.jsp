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

</style>
<script type="text/javascript">
var useMileageValue =0;
var disprice = 0;
var useMileage = 0;
useMileage = document.getElementsByName("useMileage");
var dlv_sender = document.getElementsByName("dlv_sender");
var dlv_tel = document.getElementsByName("dlv_tel");
var dlv_sphone = document.getElementsByName("dlv_sphone");
var dlv_zonecode = document.getElementsByName("dlv_zonecode");
var dlv_sendaddr = document.getElementsByName("dlv_sendaddr");
var dlv_sendaddr2 = document.getElementsByName("dlv_sendaddr2");
var dlv_msg = document.getElementsByName("dlv_msg");

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
	
	function tot_sum(){
		var s_totPrice = document.getElementsByName("s_totPrice")[0].value;
		var tot_finalPrice = document.getElementsByName("tot_finalPrice")[0];
		useMileageValue =useMileage[0].value;
		var total = s_totPrice - useMileageValue - disprice + 2500;
		totPrice.innerHTML = total+' 원'; 
		tot_finalPrice.value = total;
	}
	
	function memInfoEqual(){
		document.odr_doc_form.dlv_sender.value= "${login.mem_name}";
		document.odr_doc_form.dlv_sender.readOnly = true;
		document.odr_doc_form.dlv_tel.value= "${login.mem_tel}";
		document.odr_doc_form.dlv_tel.readOnly = true;
		document.odr_doc_form.dlv_sphone.value= "${login.mem_hp}";
		document.odr_doc_form.dlv_sphone.readOnly = true;
		document.odr_doc_form.dlv_zonecode.value= "${login.mem_zonecode}";
		document.odr_doc_form.dlv_zonecode.readOnly = true;
		document.odr_doc_form.dlv_sendaddr.value= "${login.mem_addr}";
		document.odr_doc_form.dlv_sendaddr.readOnly = true;
		document.odr_doc_form.dlv_sendaddr2.value= "${login.mem_addr2}";
		document.odr_doc_form.dlv_sendaddr2.readOnly = true;
	}
	function memInfoNotEqual(){
		document.odr_doc_form.dlv_sender.value= "";
		document.odr_doc_form.dlv_sender.readOnly = false;
		document.odr_doc_form.dlv_tel.value= "";
		document.odr_doc_form.dlv_tel.readOnly = false;
		document.odr_doc_form.dlv_sphone.value= "";
		document.odr_doc_form.dlv_sphone.readOnly = false;
		document.odr_doc_form.dlv_zonecode.value= "";
		document.odr_doc_form.dlv_zonecode.readOnly = true;
		document.odr_doc_form.dlv_sendaddr.value= "";
		document.odr_doc_form.dlv_sendaddr.readOnly = true;
		document.odr_doc_form.dlv_sendaddr2.value= "";
		document.odr_doc_form.dlv_sendaddr2.readOnly = false;
	}
	
	function doChk(){
		var val = /(^[가-힝a-zA-Z\s]{1,20}$)/;
	    if(!val.test(dlv_sender[0].value)){
	    	dlv_sender[0].value = "";
	    	dlv_sender[0].focus();
	    	alert('이름은 한글, 영문으로만 입력해 주세요');
	    	return false;
	    }
		var val2 = /(^[0-9\-]{5,20}$)/;
	    if(!val2.test(dlv_tel[0].value)){
	    	dlv_tel[0].value = "";
	    	dlv_tel[0].focus();
	    	alert('숫자와 -를 사용하여 전화번호를 입력해주세요');
	    	return false;
	    }
		var val3 = /(^[0-9\-]{5,20}$)/;
	    if(!val3.test(dlv_sphone[0].value)){
	    	dlv_sphone[0].value = "";
	    	dlv_sphone[0].focus();
	    	alert('숫자와 -를 사용하여  휴대폰 번호를 입력해주세요');
	    	return false;
	    }
		var val4 = /(^[가-힝a-zA-Z\s]{1,20}$)/;
	    if(!val4.test(dlv_msg[0].value)){
	    	dlv_msg[0].value = "";
	    	dlv_msg[0].focus();
	    	alert(' 메세지는 꼭 입력해 주세요');
	    	return false;
	    }
	    var val5 = /(^[0-9]{5,6}$)/;
	    if(!val5.test(dlv_zonecode[0].value)){
	    	dlv_zonecode[0].value = "";
	    	dlv_zonecode[0].focus();
	    	alert(' 배송지를 입력해 주세요');
	    	return false;
	    }
	    var val6 = /(^[가-힝a-zA-Z0-9\s\-]{1,90}$)/;
	    if(!val6.test(dlv_sendaddr[0].value)){
	    	dlv_sendaddr[0].value = "";
	    	dlv_sendaddr[0].focus();
	    	alert(' 배송지를 입력해 주세요');
	    	return false;
	    }
		var val7 = /(^[가-힝a-zA-Z0-9\s\-]{1,90}$)/;
	    if(!val7.test(dlv_sendaddr2[0].value)){
	    	dlv_sendaddr2[0].value = "";
	    	dlv_sendaddr2[0].focus();
	    	alert(' 배송지를 입력해 주세요');
	    	return false;
	    }
	    
	    if(useMileage[0].value == ""){
	    	useMileage[0].value = "0";
	    }
	    
	    return true;
	}
	function checkForNumber() {
		var pattern = /(^[0-9]+$)/;
	    if(!pattern.test(useMileage[0].value)){
	    	useMileage[0].value = "0";
	    	useMileage[0].focus();
	    	return;
	    }

	    if(useMileage[0].value == "00"){
	    	useMileage[0].value = "0";
	    	useMileage[0].focus();
	    	return;
	    }
		var useMileageTot = document.getElementsByName("useMileageTot");
		if(	parseInt(useMileage[0].value) > parseInt(useMileageTot[0].value)){
			useMileage[0].value = useMileageTot[0].value; 
		}
	    var s_totPrice = document.getElementsByName("s_totPrice");
		var useMileage_price = document.getElementsByName("useMileage_price")[0];
		useMileage_price.value = useMileage[0].value;
		mileageAppliedPrice.innerHTML = '-'+useMileage[0].value+' 원';
		tot_sum();
	}
	
	function addr_serarch(){
		new daum.Postcode({
			oncomplete: function(data) {
				$("#dlv_zonecode").val(data.zonecode);
				$("#dlv_sendaddr").val(data.address);
				$("#dlv_sendaddr2").focus();
			}
		}).open();
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
	<div id="proMainViewDiv" style="width: 960px; margin-left: auto; margin-right: auto;">
	<form action="${ct_path}/odr_doc.da?dana=odr_doc" method="post" name="odr_doc_form" onsubmit="return doChk();">
		<input type="hidden" value="${login.mem_no }" name="mem_no" />
		<input type="hidden" value="${sctProMuti }" name="sct_pro_muti" />
	
	<div style="font-size: 11pt;
				background-color: #FFFFFF;
				border: #FF9900 1px solid;
				padding-left: 15px;
				padding-right: 5px;
				padding-top: 6px;
				padding-bottom: 5px;
				margin-bottom: 10px;
				vertical-align: middle;
			 	text-align: left;
			 	color: #000000;">
				 	
	<span style="margin-right: 10px;">☞  주문서 작성</span>
	</div>
	
	<!-- 주문 리스트 -->
	<div  style="font-size: 11pt;
						background-color: #FFFFFF;
						border: #FF9900 1px solid;
						padding: 10px;
						margin-bottom: 10px;
						vertical-align: middle;
					 	text-align: left;
					 	color: #000000;">
	<table style="padding-bottom: 5px; padding-top: 5px; width: 940px;">

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
	
	<c:forEach var="bean" items="${sctList}">
		<input type="hidden" value="${bean.sct_proVO.pro_no }" name="s_pro_no" />
		<input type="hidden" value="${bean.sct_mem_no }" name="s_mem_no" />
		<input type="hidden" value="${bean.sct_proVO.pro_milege }" name="s_pro_milege" />
		<input type="hidden" value="${bean.sct_proVO.pro_disprice }" name="s_pro_disprice" />
		<input type="hidden" value="${odr_doc.odr_no }" name="odr_no" />
		<input type="hidden" value="${bean.sct_count }" name="s_odt_count" />
		<input type="hidden" value="${bean.sct_pro_part }" name="s_odt_pro_part" />
	<tr>
		<td width="90" align="center" style="border-bottom: gray 1px dotted;">
		<a href="javascript:goProDlgView(${bean.sct_proVO.pro_no }, '${bean.sct_proVO.pro_pcl_no }', ${bean.sct_pro_part });">
		<img src="${ct_path}/product_img/${bean.sct_proVO.pmg_file }" style="width: 50px; height: 50px; border: 0px;">
		</a>
		</td>
		<td width="404" style="border-bottom: gray 1px dotted;">
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
		<td width="120" align="center" style="color: #FF3333; font-size: 10pt; font-weight: bold; 
			border-bottom: gray 1px dotted;">
		${bean.sct_proVO.pro_ch_price }
		</td>
		<td width="90" align="center" style="border-bottom: gray 1px dotted;">
		${bean.sct_count } 개</td>
		<td width="120" align="center" style="color: #FF3333; font-size: 10pt; 
			font-weight: bold; border-bottom: gray 1px dotted;">
		${bean.sct_proVO.pro_tot_ch_price }
		</td>
		<td width="120" align="center" style="border-bottom: gray 1px dotted;">
		${bean.sct_proVO.pro_ch_milege }
		</td>
	</tr>
	</c:forEach>
	</table>
	</div>
	<div style="text-align:right; 
				font-size: 11pt;
				height: 50px;
				padding-right: 10px;
				margin-bottom: 5px;
				line-height:20px;
				border-bottom: #FF9900 3px solid;">
		총 합계 금액 : <span style="color: red;">${sctTotPrivceVo.sct_tot_ch_disprice }</span><br />
		<span style="color: red;">총 적립금: ${sctTotPrivceVo.sct_tot_ch_milege }</span> 
		<input type="hidden" value="${sctTotPrivceVo.sct_tot_disprice }" name="s_totPrice" />
		<input type="hidden" value="${sctTotPrivceVo.sct_tot_milege }" name="s_totMilege" />
	</div>
	
	<table style="width: 960px; border-spacing: 5px;">
	<tr align="center">
		<td style="width: 560px; vertical-align: top;">
			<table style="border: #FF9900 1px solid; width: 100%; text-align: left;">
			<tr style="text-align: left;">
				<td colspan="4" class="title_box3">배송지정보</td>
			</tr>
			<tr>
				<td colspan="4">
				<span class="span_box2">
				<span style="margin-right: 20px;">주문자 정보와 배송지 정보가 같습니까?</span>
				예<input type="radio" name="rad_equal" id="yes" onclick="javascript:memInfoEqual();"/>
				아니오<input type="radio" name="rad_equal" id="no"  checked="checked"  onclick="javascript:memInfoNotEqual();"/>
				</span>
				</td>
			</tr>
			<tr>
				<td><span class="span_box2">수취인 이름</span></td>
				<td colspan="3"><input type="text" name="dlv_sender" class="box_input_left" style="width: 90%;" /></td>
			</tr>
			<tr>
				<td><span class="span_box2">전화번호</span></td>
				<td colspan="3"><input type="text" name="dlv_tel" class="box_input_left" style="width: 90%;" /></td>
			</tr>
			<tr>
				<td><span class="span_box2">휴대폰</span></td>
				<td colspan="3"><input type="text" name="dlv_sphone" class="box_input_left" style="width: 90%;" /></td>
			</tr>
			<tr>
				<td style="vertical-align: top;"><span class="span_box2">주소</span></td> 
				<td colspan="3">
				<span style="display: block; margin-bottom: 5px;">
				<input type="text" name="dlv_zonecode" id="dlv_zonecode" class="box_input_left" style="width: 100px;" maxlength="5" />
				<span style="padding: 4px 9px 3px 9px; border: 1px solid #8BBDFF; color: #ffffff; background: #8BBDFF; cursor: pointer;" onclick="addr_serarch();">검색</span>
				</span>
				<span style="display: block; margin-bottom: 5px;">
				<input type="text" name="dlv_sendaddr" id="dlv_sendaddr" class="box_input_left" style="width: 90%;" /></span>
				<span style="display: block; margin-bottom: 5px;">
				<input type="text" name="dlv_sendaddr2" id="dlv_sendaddr2" class="box_input_left" style="width: 90%;" maxlength="50" /></span>
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top;"><span class="span_box2">배송 메세지</span></td>
				<td colspan="4">
					<textarea rows="4" name="dlv_msg" style="width: 90%;"></textarea>
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top;"><span class="span_box2">마일리지 사용</span></td>
				<td>
					<input type="text" name="useMileage" onkeyup="checkForNumber();" class="box_input_left" style="width: 90%;" value="0" />
					<input type="hidden" name="useMileageTot" value="${userMil.mem_mil}" />
					<div style="margin-top:2px;">현재 회원님의 마일리지 &nbsp;<span style="color: red;" >${userMil.mem_ch_mil}</span></div>
				</td>
			</tr>
			<tr>
				<td><span class="span_box2">결제 방법</span></td>
				<td colspan="3">
					무통장입금  <input type="radio" name="odr_way" id="cash" value="무통장입금" checked="checked" />
					<%--
					신용카드 <input type="radio" name="odr_way" id="card" value="신용카드" onclick="javascript:ajaxCard();"/>
					 --%>	
				</td>
			</tr>
			<tr><td colspan="4" style="height: 15px;">&nbsp;</td></tr>
			<tr>
				<td style="text-align: right;padding-right: 7px;" colspan="4"></td>
			</tr>
			</table>
		</td>
		<td style="width: 400px; vertical-align: top;">
		<table style="border: #FF9900 1px solid; width: 100%; text-align: left;">
		<tr>
			<td align="left" class="title_box3" valign="top" colspan="2">
				결제하실 금액
			</td>
		</tr>
		<tr>
			<td><span class="span_box2">* 상품 합계 금액 :</span></td>
			<td class="table_content2"><div id="ch_disprice" align="right">${sctTotPrivceVo.sct_tot_disprice } 원</div></td>
		</tr>
		<tr>
			<td align="left"><span class="span_box2">* 사용 마일리지 :</span></td>
			<td class="table_content2">
				<div id="mileageAppliedPrice" align="right"></div>
				<input type="hidden" name="useMileage_price" value="0" />
			</td>
		</tr>
		<tr>
			<td align="left"><span class="span_box2">* 사용 쿠폰 :</span></td>
			<td class="table_content2">
				<div id="cpn_Dis_Price" align="right"></div>
				<input type="hidden" name="CouponApply" value="0">
			</td>
		</tr>
		<tr>
			<td align="left"><span class="span_box2">* 배송비 :</span></td>
			<td class="table_content2"><div id="dlbfare" align="right">+ 2,500 원</div></td>
		</tr>
		<tr> 
			<td align="left" style="border: #FF9900 1px solid;"><span class="span_box2">* 실제 입금하실 금액 :</span></td>
			<td style="border: #FF9900 1px solid;">
				<div id="totPrice" align="right"></div>
				<input type="hidden" name="tot_finalPrice" value="0">
			</td>
		</tr>
		<tr><td colspan="4" style="height: 15px;">&nbsp;</td></tr>
		<tr>
			<td align="left" colspan="4" class="title_box3">주문자정보</td>
		</tr>
		<tr>
			<td><span class="span_box2">주문자 이름</span></td>
			<td colspan="3"><input type="text" name="mem_name" value="${login.mem_name }" class="box_input_left" style="width: 90%;" /></td>
		</tr>
		<tr>
			<td><span class="span_box2">연락처</span></td>
			<td><input type="text" name="mem_hp" value="${login.mem_hp}" class="box_input_left" style="width: 90%;" /></td>
		</tr>
		<tr>
			<td><span class="span_box2">이메일</span></td> 
			<td><input type="text" maxlength="20" value="${login.mem_email }" class="box_input_left" style="width: 90%;" /></td>
		</tr>
		<tr><td colspan="4" style="height: 15px;">&nbsp;</td></tr>
		</table>
		<div style="width: 100%; text-align: right; padding-top: 15px;">
			<input type="submit" value="주문하기" style="padding: 5px 7px 4px 7px; font-size: 17px; background-color: #6699FF; color: #ffffff;" />
		</div>
		</td>
	</tr>			
	</table>
	
	<div style="height: 50px;"></div>
	
	</form>
	</div>
	<!-- 주문 리스트 -->
	
	</div>
	
	<footer>
	
	</footer>
	
<script type="text/javascript">
document.onload = tot_sum();
</script>
	
<!-- 상세보기 dlg -->
<div id="dialog"></div>	
</body>
</html>