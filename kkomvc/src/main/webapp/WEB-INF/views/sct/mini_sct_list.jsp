<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>Insert title here</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">
.mini_sct_ellip{
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
	padding: 3px 2px;
	background:#fff;
	width: 130px;
	display: inline-block;
}
</style>
</head>
<body>

<div style="width:785px; height: 170px; overflow-y: scroll; overflow-x: hidden; float: left;">

<c:forEach var="bean" items="${sctList}" varStatus="no">
<div style="width: 147px; float: left; margin-right: 3px; margin-bottom: 5px; border: #6699FF 1px solid; background: #ffffff;">
<table style="padding-bottom: 3px; padding-top: 3px; width: 147px; height: 160px;" >
<tr>
	<td><span style="color: #6699FF; padding-left: 5px;">[${bean.sct_proVO.pcl_name }]</span></td>
</tr>
<tr>
	<td align="center">
	<a href="javascript:goProDlgView(${bean.sct_proVO.pro_no }, '${bean.sct_proVO.pro_pcl_no }', ${bean.sct_pro_part })">
	<img src="${ct_path}/product_img/${bean.sct_proVO.pmg_file }" style="width: 50px; height: 50px;" />
	</a>
	</td>
</tr>
<tr>
	<td align="center" style="color: #FF3333; font-size: 9pt;">${bean.sct_proVO.pro_ch_price }
		<input name="cnt_${bean.sct_proVO.pro_no}" value="${bean.sct_count }" size="1" type="text" readonly="readonly" class="iar" />
		<img src="${ct_path}/img/btn_cnt.gif" usemap="#MAP_BtnCnt_${bean.sct_proVO.pro_no}" style="vertical-align: -5px;" />
		<map name="MAP_BtnCnt_${bean.sct_proVO.pro_no}">
		<area shape="rect" coords="0,0,9,10" 
			href="javascript:sct_count_ch(${bean.sct_no},'PLUS',${login.mem_no},${bean.sct_proVO.pro_no},1);">
		<area shape="rect" coords="0,10,9,20" 
			href="javascript:sct_count_ch(${bean.sct_no},'MINUS',${login.mem_no},${bean.sct_proVO.pro_no},1);">
		</map>
	</td>
</tr>
<tr><td align="center"><span class="mini_sct_ellip" title="${bean.sct_proVO.pro_name}">${bean.sct_proVO.pro_name}</span></td></tr>
<tr>
	<td align="center">
	적립금 : <span style="color: red;">${bean.sct_proVO.pro_ch_milege }</span>
	<a href="javascript:goSctDelete(${bean.sct_no},${login.mem_no},1);">
	<img src="${ct_path}/img/btn_delSmall.gif" style="border: 0px; vertical-align: middle;" />
	</a>
	</td>
</tr>
</table>
</div>
</c:forEach>

</div>

<div id="mini_sct_tot">
<span>총 합계 금액</span>
<span style="color: red;">${sctTotPrivceVo.sct_tot_ch_disprice }</span>
<span>총 적립금</span>
<span style="color: red;">${sctTotPrivceVo.sct_tot_ch_milege }</span>

<c:if test="${not empty sctList}">
<span><a href="javascript:goSctAllDelete(${login.mem_no},1);"><img src="${ct_path}/img/btn_emptyCart.gif" /></a></span>
<span><a href="${ct_path}/ProController?dana=sct_odr_doc&sct_mem_no=${login.mem_no }&sct_pro_muti=1"><img src="${ct_path}/img/btn_buy2.gif" /></a></span>
</c:if>

</div>

</body>
</html>