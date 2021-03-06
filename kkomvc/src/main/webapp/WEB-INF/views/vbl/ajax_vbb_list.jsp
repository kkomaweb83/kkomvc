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
		<span class="title_box1">☞ 공유견적서 리스트</span>
		<span style="margin-right: 20px;">&nbsp;</span>
		전체 <span style="color: red;">${total_cnt }</span> 개
	</div>		
	
	<div style="width: 800px;"> 

	<table style="width: 800px;">
	<thead>
		<tr>
		<th class="table_title" width="5%">번호</th>
		<th class="table_title" width="53%">제목</th>
		<th class="table_title" width="11%">글쓴이</th>
		<th class="table_title" width="10%">날짜</th>
		<th class="table_title" width="8%">추천수</th>
		<th class="table_title" width="8%">조회수</th>
		<th class="table_title" width="5%">배틀</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="bean" items="${pro_list}" varStatus="no">
		<tr>
		<td class="table_content2">${bean.vbb_no}</td>
		<td class="table_content1">
			<a href="${ct_path}/vbb_view.do?dana=vbb_view&vbb_no=${bean.vbb_no}">${bean.vbb_title }</a>
		</td>
		<td class="table_content2">${bean.mem_id}</td>
		<td class="table_content2">${bean.vbb_date}</td>
		<td class="table_content2">${bean.vbb_recomm}</td>
		<td class="table_content2">${bean.vbb_count}</td>
		<td class="table_content2">${bean.vbb_btr_answer}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<p:page p_totalPage="${p_totalPage}" p_nowPage="${p_nowPage}" p_list="${p_list}" p_pagePerBlock="${p_pagePerBlock}" />
	
	</div>

</body>
</html>