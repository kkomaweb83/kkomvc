<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>꼬마web의 주식 공부방</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">

	function goPptPreInsert(){
		location.href = "${ct_path}/kkoma/company_preInsert.ama?insert=Y";
	}

</script>
</head>
<body>

<header id="top_header" style="height:30px;">
	<div id="top_title">
	<a href="${ct_path}/company_list.do"><img src="${ct_path}/img/index02.gif" alt="꼬마web의 놀이터" /></a>
	</div>
	
	<nav id="top_gnb">
	<ul>
		<li><a href="${ct_path}/">HOME</a></li>
	</ul> 
</nav>
</header>

<!-- 전체 -->
<div id="proMainViewDiv" style="width: 980px; margin-top: 0px; margin-left: auto; margin-right: auto;">

	<div class="title_div1">
		<div style="float: left;" >
		<span style="font-size: 5px;">&nbsp;</span><br/>
		<span class="title_box1">☞ 기업 리스트</span><br/>
		<span style="font-size: 0px;">&nbsp;</span>
		</div>
	
		<div style="width:120px;text-align:right;float:right;padding-right:2px;" class="vbl_btn01">
		<span onclick="javascript:goPptPreInsert();" class="dana_button01"><span>기업등록</span></span>
		</div>
	</div>

	<table style="width: 980px;">
	<tr>
		<td class="table_title" width="150px">기업코드</td>
		<td class="table_title" width="150px">기업명</td>
		<td class="table_title" width="530px">제목</td>
		<td class="table_title" width="150px">등록일</td>
	</tr>
	<c:forEach var="bean" items="${cpyList}">
	<tr>
		<td class="table_content2" width="150px">
		<a href="#." onclick="window.open('${ct_path}/kkoma/company_report.ama?cpy_code=${bean.cpy_code}'
			,'','top=50,width=700,height=600,scrollbars=yes');">${bean.cpy_code}</a></td>
		<td class="table_content2" width="150px">
		<a href="${ct_path}/kkoma/company_preUpdate.ama?cpy_code=${bean.cpy_code}&insert=N">${bean.cpy_name}</a></td>
		<td class="table_content1" width="530px">${bean.cpy_title}</td>
		<td class="table_content2" width="150px">${bean.cpy_indate}</td>
	</tr>
	</c:forEach>
	<%--
	<tr><td class="table_content2" colspan="4">등록된 기업이 없습니다.</td></tr>
	--%>			
	</table>			

</div>

</body>
</html>