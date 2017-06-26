<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title></title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

</head>
<body>

<%-- 왼쪽상단 분류제목 리스트 갯수 --%>
<div style="width: 390px; background-color: #254284; padding: 7px 12px 5px 12px;">
<span style="color: #ffffff; font-size: 15px; ">★ ${mainPclName}
	<input type="hidden" name="pcl_no" value="${mainPclNo }" />
	<input type="hidden" name="cPage" value="1" />
</span>
</div>

<!-- 왼쪽 상단 상품분류 검색조건 -->
<table style="border-spacing: 0px; padding: 0; background-color:white; width: 390px; border: 0px solid black; margin-top: 2px; ">
<tbody>

<!-- 제조사 -->
<tr>
<td style="padding: 0px; width: 390px; vertical-align: top; height: 25px;">
<table style="padding: 0; width: 100%; border: 0px; border-spacing: 0px;">
<tbody>
<tr>
	<td style="width: 50%;">
		<select style="width: 192px; height: 22px;" onchange="goPptProChk(this);" name="maker">
		<option value="0">-- 제조사 --</option>
		<c:forEach var="bean" items="${mkrList}">
		<option value="${bean.mkr_no }">${bean.mkr_name }</option>
		</c:forEach>
		</select>
	</td>
	<td style="width: 50%; text-align: right; vertical-align: top;">
		<input type="text" value="" style="width: 130px; margin: 0px; height: 17px;" name="searchValue" />
		<img height="21" width="42" style="cursor: pointer; margin-bottom: -6px;" onclick="search_keyword();" src="${ct_path}/img/btn_search1.gif"/>
	</td>
</tr>
</tbody>
</table>
</td>
</tr>
<!-- 제조사 -->

<!-- 상품분류 -->
<tr>
<td width="390">
<table style="border-spacing: 0; padding: 0; width: 100%;">
<tbody>
<tr>
<td align="left">
	<c:forEach var="bean" items="${pclList}" varStatus="no">
	<c:forEach var="bean2" items="${bean.pcl_list}" varStatus="no2">
	<select style="width: 126px;" onchange="goPptProChk(this);" name="search_pcl_no">
	<option value="0">- ${bean2.pcl_name } -</option>
	<c:forEach var="bean3" items="${bean2.pcl_list}">
	<option value="${bean3.pcl_no }">${bean3.pcl_name }</option>
	</c:forEach>
	</select>
	</c:forEach>
	</c:forEach>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<!-- 상품분류 -->

</tbody>
</table>

</body>
</html>