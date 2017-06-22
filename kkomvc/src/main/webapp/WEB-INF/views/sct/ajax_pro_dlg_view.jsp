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

<script type="text/javascript">
	$(function() {
		
	});
</script>	
</head>
<body>

<div id="dialog" title="상세보기">

<div style="text-align: left; border: #FF9900 1px solid; 
					margin-bottom: 15px; 
					padding: 7px;">

<table style="padding-bottom: 5px; padding-top: 5px; width: 100%; border-spacing: 0; text-align: center;">
<tr>
<td align="center" style="width: 150px; text-align: center;">
<img src="${ct_path}/product_img/${proVo.pmg_file }" style="width: 150px; height: 150px; border: 0px;">
</td>
<td>
	<table style="text-align: left;">
	<tr><td colspan="2" style="border-bottom: gray 2px solid; font-weight: bold; padding-bottom: 3px; margin-bottom: 3px;">
	${proVo.pro_name }</td></tr>
	<tr><td style="font-weight: bold; width: 20%;" class="main_box_viewt">판매가격</td>
	<td style="width: 80%;" class="main_box_view1">
	${proVo.pro_ch_price }</td></tr>
	<tr><td style="font-weight: bold; width: 100px;" class="main_box_viewt">적립금</td>
	<td class="main_box_view1">
	${proVo.pro_milege }</td></tr>
	<tr><td style="font-weight: bold; width: 100px;" class="main_box_viewt">제조사</td>
	<td class="main_box_view1">
	${proVo.mkr_name }</td></tr>
	<tr><td style="font-weight: bold; width: 100px;" class="main_box_viewt">상품등록일</td>
	<td class="main_box_view1">
	${proVo.pro_regdate }</td></tr>
	<tr><td style="font-weight: bold; width: 100px;" class="main_box_viewt">상품코드</td>
	<td class="main_box_view1">
	${proVo.pro_no }</td></tr>
	<tr><td style="font-weight: bold; width: 100px;" class="main_box_viewt">요약정보</td>
	<td class="main_box_view1">
	${proVo.psm_conent }</td></tr>
	</table>
</td>
</tr>
</table>

</div>

<div style="text-align: center;">

<table style="width: 500px; border-spacing: 1px; background-color: #C4DFE1; padding: 2px; margin: auto;">
<c:forEach var="bean" items="${pclList}" varStatus="no">
<tr bgcolor='#EDF8FA' style="height: 20px; vertical-align: middle;">
<td align='center' colspan='2'><strong><font color="#298494">
${bean.pcl_name }</font></strong></td>
</tr>
<c:forEach var="bean2" items="${bean.pcl_list}" varStatus="no2">
<tr>
<td bgcolor="#FFFFFF" width="20%" style="height: 20px; vertical-align: middle;">
<font color="#2D98AE">
${bean2.pcl_name }</font></td>
<td bgcolor="#FFFFFF" width="30%">${bean2.pcl_next_name }</td>
</tr>
</c:forEach>
</c:forEach>
</table>

</div>

<div style="height: 100px;"></div>

</div>

</body>
</html>