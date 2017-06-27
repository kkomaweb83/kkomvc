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

	<div class="title_div1" style="float: left;">
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 가상견적서 리스트</span>
		<span style="margin-right: 20px;">&nbsp;</span>
		전체 <span style="color: red;">${total_cnt }</span> 개
	</div>		
	
	<div style="width: 120px; text-align: center; float: right;" class="vbl_btn01">
	<span onclick="javascript:goPptPreInsert();" class="dana_button01"><span>가상견적서 등록</span></span>
	</div>
	
	<div style="width: 800px;"> 

	<table style="width: 800px;">
	<thead>
		<tr>
		<td class="table_title" width="80px">번호</td>
		<td class="table_title" width="530px">제목</td>
		<td class="table_title" width="90px">공유여부</td>
		<td class="table_title" width="110px">등록일</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="bean" items="${pro_list}" varStatus="no">
		<tr>
		<td class="table_content2">${no.count+(5*(p_nowPage-1))}</td>
		<td class="table_content1">
			<a href="${ct_path}/vbl_view.da?dana=vbl_view&vbl_no=${bean.vbl_no}">${bean.vbl_title }</a>
		</td>
		<td class="table_content2">${bean.vbl_bor_answer}</td>
		<td class="table_content2">${bean.vbl_date}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<p:page p_totalPage="${p_totalPage}" p_nowPage="${p_nowPage}" p_list="${p_list}" p_pagePerBlock="${p_pagePerBlock}" />
	
	</div>

</body>
</html>