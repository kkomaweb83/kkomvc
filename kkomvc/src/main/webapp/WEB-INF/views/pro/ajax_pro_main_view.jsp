<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title></title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

</head>
<body>

<div style="border: #FF9900 1px solid; margin-left: 10px;">

<table style="padding-bottom: 5px; padding-top: 5px; width: 100%;">
<tr>
	<td width="350" align="center">
	<img src="${ct_path}/product_img/${proVo.pmg_file }" style="width: 300px; height: 300px; border: 0px;">
	</td>
	<td width="550" valign="middle">
		<table>
		<tr><td colspan="2" style="border-bottom: gray 2px solid; font-weight: bold;
								padding-bottom: 3px; margin-bottom: 3px; font-size: 12pt;">
		${proVo.pro_name }</td></tr>
		<tr><td style="font-weight: bold; width: 150px;" class="main_box_viewt">판매가격</td>
		<td style="width: 400px;" class="main_box_view1">
		${proVo.pro_ch_price }</td></tr>
		<tr><td style="font-weight: bold; width: 150px;" class="main_box_viewt">적립금</td>
		<td class="main_box_view1">
		${proVo.pro_milege }</td></tr>
		<tr><td style="font-weight: bold; width: 150px;" class="main_box_viewt">제조사</td>
		<td class="main_box_view1">
		${proVo.mkr_name }</td></tr>
		<tr><td style="font-weight: bold; width: 150px;" class="main_box_viewt">상품등록일</td>
		<td class="main_box_view1">
		${proVo.pro_regdate }</td></tr>
		<tr><td style="font-weight: bold; width: 150px;" class="main_box_viewt">상품코드</td>
		<td class="main_box_view1">
		${proVo.pro_no }</td></tr>
		<tr><td style="font-weight: bold; width: 150px;" class="main_box_viewt">요약정보</td>
		<td class="main_box_view1">
		${proVo.psm_conent }</td></tr>
		<tr><td colspan="2" style="text-align: center; padding-top: 5px;">
		<c:if test="${login.cmd != 101}">
		<img src="${ct_path}/img/btn_buy.gif" border="0">
		</c:if>
		<c:if test="${login.cmd == 101}">
		<a href="${ct_path}/sct_odr_doc.do?dana=sct_odr_doc&sct_pro_no=${proVo.pro_no }
																&sct_pro_part=1
																&sct_pro_muti=2
																&sct_mem_no=${login.mem_no }">
		
		<img src="${ct_path}/img/btn_buy.gif" border="0"></a>
		</c:if>&nbsp;
		<c:if test="${login.cmd != 101}">
		<img src="${ct_path}/img/btn_cart.gif" border="0">
		</c:if>
		<c:if test="${login.cmd == 101}">
		<a href="javascript:goShopCart(${proVo.pro_no }, ${login.mem_no}, 1);">
		<img src="${ct_path}/img/btn_cart.gif" border="0"></a>
		</c:if>
		</td></tr>
		</table>
	</td>
</tr>
</table>

</div>

<div style="text-align: center; margin-top: 15px; ">

<table style="width: 640px; border-spacing: 1px; background-color: #C4DFE1; margin: auto;">
	<c:forEach var="bean" items="${pclList}" varStatus="no">
	<tr bgcolor='#EDF8FA' style="height: 35px; vertical-align: middle;">
		<td align='center' colspan='2'>
		<strong><font color="#298494">${bean.pcl_name }</font></strong>
		</td>
	</tr>
	<c:forEach var="bean2" items="${bean.pcl_list}" varStatus="no2">
	<tr>
		<td bgcolor="#FFFFFF" width="20%" style="height: 35px; vertical-align: middle;">
			<font color="#2D98AE">${bean2.pcl_name }</font>
		</td>
		<td bgcolor="#FFFFFF" width="30%">${bean2.pcl_next_name }</td>
	</tr>
	</c:forEach>
	</c:forEach>
</table>

</div>

<div style="height: 200px;"></div>

</body>
</html>