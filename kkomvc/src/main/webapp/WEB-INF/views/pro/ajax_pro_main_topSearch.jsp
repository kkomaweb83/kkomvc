<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<form method="post" id="pro_pclSearch">
	<input name="pro_pcl_no" type="hidden" value="${param.pro_pcl_no }" />
	<input name="pdt_conent" type="hidden" value="" />
	<input name="cPage" id="cPage" type="hidden" value="1" />
	<input name="proOrderCode" id="proOrderCode" type="hidden"  value="1"/>
	<input name="dana" id="dana" type="hidden" value="" />

<div style="text-align: left; border: #FF9900 1px solid; padding: 7px; width: 946px; margin-left: 5px;">

<div style="border-bottom: blue 1px solid; padding-bottom: 3px; 
					margin-bottom: 3px;">
<table><tr>
	<td width="846"><span style="color: blue; font-size: 11pt;">☞ ${mainPclName }</span></td>
	<td width="100" align="right"><span id="pclWrap">
	<a href="javascript:proListPclWrap(1);">
	<img src="${ct_path}/img/close_btn.gif" border="0"></a>
	</span></td>
	</tr>
</table>
</div>

<!-- 제조사 -->
<div style="border-bottom: gray 1px dotted; padding-bottom: 3px;
					 margin-bottom: 3px; width: 946px;">
<table style="width: 946px;">
<tr>
<td style="width: 120px; padding-left: 3px; vertical-align: middle;">제조사</td>
<td style="width: 796px;">
<c:if test="${!empty mkrList}">
	<c:forEach var="bean" items="${mkrList}" varStatus="no">
	<div style="float: left; width: 160px;">
		<input type="checkbox" name="mkr_no_sy" onclick="goMainTopChk(0);" value="${bean.mkr_no }" />${bean.mkr_name }
	</div>
	</c:forEach>
</c:if>
</td>
</tr></table>
</div>
<!-- 제조사 -->

<!-- 상품분류 -->
<div style="width: 946px;" id="pclListDiv">
<c:forEach var="bean" items="${pclList}" varStatus="no">
	<table style="width: 946px;">
	<tr>
		<td colspan="3" style="background-color: #ffdab9; text-align: center; height: 23px;">
			<span style="color: blue;">${bean.pcl_name }</span>
		</td>
	</tr>
	<c:forEach var="bean2" items="${bean.pcl_list}" varStatus="no2">
	<tr>
		<td style="width: 120px; padding-left: 3px; vertical-align: middle; border-bottom: gray 1px dotted;">
			<span>${bean2.pcl_name }</span>
		</td>
		<td style="border-bottom: gray 1px dotted; padding-bottom: 3px; margin-bottom: 3px; width: 796px;">
			<c:forEach var="bean3" items="${bean2.pcl_list}" varStatus="no3">
			<div style="float: left; width: 160px;">
			<input type="checkbox" name="pdt_step51_sy" onclick="goMainTopChk(0);" value="${bean3.pcl_no }" />${bean3.pcl_name }
			</div>		
			</c:forEach>
		</td>
	</tr>
	</c:forEach>
	</table>
</c:forEach>
</div>
<!-- 상품분류 -->

</div>
</form>