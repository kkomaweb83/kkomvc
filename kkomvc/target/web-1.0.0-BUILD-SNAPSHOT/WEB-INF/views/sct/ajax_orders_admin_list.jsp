<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
		<span class="title_box1">☞ 주문내역 리스트</span>
		<span style="margin-right: 20px;">&nbsp;</span>
		전체 <span style="color: red;">${total_cnt }</span> 개
	</div>		
	
	<div style="width: 800px;"> 

	<table style="width: 800px;">
	<thead>
		<tr>
		<td class="table_title">주문번호</td>
		<td class="table_title">회원번호</td>
		<td class="table_title">마일리지</td>
		<td class="table_title">결제금액</td>
		<td class="table_title">결제방법</td>
		<td class="table_title">주문날짜</td>
		<td class="table_title">결제날짜</td>
		<td class="table_title">완료날짜</td>
		<td class="table_title">주문현황</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${orders_list}">
		<tr>
		<td  align="center" class="table_content2">
		<a href="${ct_path}/orders_admin_det_list.da?dana=orders_admin_det_list&odr_no=${vo.odr_no }&reurl=admin">${vo.odr_no }</a></td>
		<td  align="center" class="table_content2">${vo.mem_id }</td>
		<td  align="center" class="table_content2">${vo.odr_mileage }</td>
		<td  align="center" class="table_content2"><fmt:formatNumber value="${vo.odr_amount}" pattern="###,###,###,###" /></td>
		<td  align="center" class="table_content2">${vo.odr_way }</td>
		<td  align="center" class="table_content2">${vo.odr_odate }</td>
		<td  align="center" class="table_content2">${vo.odr_sdate }</td>
		<td  align="center" class="table_content2">${vo.odr_cdate }</td>
		<td  align="center" class="table_content2">
		<c:if test="${vo.odr_condition==1 }">주문신청</c:if>
		<c:if test="${vo.odr_condition==2 }">결제확인</c:if>
		<c:if test="${vo.odr_condition==3 }">배송</c:if>
		<c:if test="${vo.odr_condition==4 }">주문완료</c:if>
		</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<p:page p_totalPage="${p_totalPage}" p_nowPage="${p_nowPage}" p_list="${p_list}" p_pagePerBlock="${p_pagePerBlock}" />
	
	</div>

</body>
</html>