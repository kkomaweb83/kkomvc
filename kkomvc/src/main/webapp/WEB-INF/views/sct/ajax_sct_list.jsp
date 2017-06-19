<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>Insert title here</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

</head>
<body>

<div  style="font-size: 11pt;
					background-color: #FFFFFF;
					border: #6699FF 1px solid;
					padding-left: 15px;
					padding-right: 5px;
					padding-top: 6px;
					padding-bottom: 5px;
					margin-bottom: 10px;
					vertical-align: middle;
				 	text-align: left;
				 	color: #000000;">
				 	
<span style="margin-right: 10px;">☞  장바구니</span>
</div>

<div  style="font-size: 11pt;
					background-color: #FFFFFF;
					border: #6699FF 1px solid;
					padding: 10px;
					margin-bottom: 10px;
					vertical-align: middle;
				 	text-align: left;
				 	color: #000000;">

<table style="width: 940px; padding: 0; border-spacing: 0; padding-bottom: 5px; padding-top: 5px;">

<tr style="background-color: #6699FF;">
<td></td>
<td>상품</td>
<td align="center">가격</td>
<td align="center">수량</td>
<td align="center">소계</td>
<td align="center">적립금</td>
</tr>			
<c:forEach var="bean" items="${sctList}">

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
	${bean.sct_proVO.pro_name }
	</td></tr>
	</table>
</td>
<td width="120" align="center" style="color: #FF3333; font-size: 10pt; font-weight: bold; 
	border-bottom: gray 1px dotted;">
${bean.sct_proVO.pro_ch_price }
</td>
<td width="90" align="center" style="border-bottom: gray 1px dotted;">

<input name="cnt_${bean.sct_proVO.pro_no}" value="${bean.sct_count }" size="1" type="text" readonly="readonly" class="iar">
<img src="${ct_path}/img/btn_cnt.gif" usemap="#MAP_BtnCnt_${bean.sct_proVO.pro_no}" style="vertical-align: -5px;" />
<map name="MAP_BtnCnt_${bean.sct_proVO.pro_no}">
<area shape="rect" coords="0,0,9,10" 
	href="javascript:sct_count_ch(${bean.sct_no},'PLUS',${login.mem_no},${bean.sct_proVO.pro_no},0);">
<area shape="rect" coords="0,10,9,20" 
	href="javascript:sct_count_ch(${bean.sct_no},'MINUS',${login.mem_no},${bean.sct_proVO.pro_no},0);"></map>

</td>
<td width="120" align="center" style="color: #FF3333; font-size: 10pt; 
	font-weight: bold; border-bottom: gray 1px dotted;">
${bean.sct_proVO.pro_tot_ch_price }
</td>
<td width="120" align="center" style="border-bottom: gray 1px dotted;">
${bean.sct_proVO.pro_ch_milege }
<a href="javascript:goSctDelete(${bean.sct_no},${login.mem_no},0);">
<img src="${ct_path}/img/btn_delSmall.gif" style="border: 0px; vertical-align: middle;"></a>
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
				border-bottom: #6699FF 3px solid;">

총 합계 금액 : <span style="color: red;">${sctTotPrivceVo.sct_tot_ch_disprice }</span><br />
<span style="color: red;">총 적립금: ${sctTotPrivceVo.sct_tot_ch_milege }</span> 
				
</div>

<div style="text-align: right; padding-right: 10px; height: 70px;">
<a href="${ct_path}/ProController?dana=pro_main_prelist&pro_pcl_no=0101"> 
<img src="${ct_path}/img/btn_shoppingContinue.gif" style="border: 0px;"></a>&nbsp;

<c:if test="${not empty sctList}">
<a href="javascript:goSctAllDelete(${login.mem_no},0);">
<img src="${ct_path}/img/btn_emptyCart.gif" style="border: 0px;"></a>&nbsp;
<a href="${ct_path}/ProController?dana=sct_odr_doc&sct_mem_no=${login.mem_no }&sct_pro_muti=1">
<img src="${ct_path}/img/btn_buy2.gif" style="border: 0px;"></a>
</c:if>

</div>

</body>
</html>