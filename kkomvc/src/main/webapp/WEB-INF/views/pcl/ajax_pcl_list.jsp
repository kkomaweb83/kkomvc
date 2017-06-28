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

<form method="post" id="pcl_insert">
	<input name="insert" id="insert" type="hidden" value="${insert }" />
	<input name="step" type="hidden" value="${pclVO.pcl_step }" />
	<input name="pcl_old_upperno" type="hidden" value="${pclVO.pcl_upperno }" />
	<input name="dana" id="dana" type="hidden" value="" />

<div class="title_div1">
	<span style="font-size: 5px;">&nbsp;</span><br/>
	<span class="title_box1">☞ 상품분류 관리</span><br/>
	<span style="font-size: 0px;">&nbsp;</span>
</div>

<!-- 상품분류 입력, 수정 -->
<div class="title_div2">
	<table style="width: 800px; padding: 0; border-spacing: 5px;">
	<tr>
	<td><span class="span_box2">분류코드</span></td>
	<td align="left" colspan="2">
	<input type="text" name="pcl_no" id="pcl_no" class="box_input_left" style="width: 250px;" 
	<c:if test="${insert == 'y'}"> value="${pcl_atuo_no }" </c:if>
	<c:if test="${insert == 'n'}"> value="${pclVO.pcl_no }" </c:if>
	readonly="readonly" />
	<c:if test="${insert == 'y'}">
	<span onclick="javascript:goPclAutoNo();" class="dana_button01">코드생성</span>
	</c:if>
	</td>
	<td align="right">
		<table style="border-spacing: 3px;"><tr>
		<c:if test="${insert == 'y'}">
		<td><span onclick="javascript:doPclInsert();" class="dana_button01">입력</span></td>
		</c:if>
		<c:if test="${insert == 'n'}">
		<td><span onclick="javascript:doPclUpdate();" class="dana_button01">수정</span></td>
		<td><span onclick="javascript:doPclDelete();" class="dana_button01">삭제</span></td>
		</c:if>
		</tr>
		</table>
	</td>
	</tr>
	<tr>
	<td><span class="span_box2">분류명</span></td>
	<td colspan="3" align="left" width="300">
	<input type="text" name="pcl_name" id="pcl_name" class="box_input_left" 
			style="width: 655px;" value="${pclVO.pcl_name }" /></td>
	</tr>
	<tr>
	<td><span class="span_box2">기본여부</span></td>
	<td align="left" width="300">
	<select name="pcl_basis" id="pcl_basis">
		<option value="Y" <c:if test="${pclVO.pcl_basis == 'Y'}"> selected="selected" </c:if>>Y</option>
		<option value="N" <c:if test="${pclVO.pcl_basis == 'N'}"> selected="selected" </c:if>>N</option>
	</select></td>
	<td><span class="span_box2">분류단계</span></td>
	<td align="left" width="300">
	<input type="text" name="pcl_step" class="box_input_left" 
				style="width: 250px;" readonly="readonly" value="${pclVO.pcl_step }"/></td>							
	</tr>
	<tr>
	<td><span class="span_box2">상위 코드</span></td>
	<td align="left">
	<input type="text" name=pcl_upperno class="box_input_left" 
				style="width: 250px;" readonly="readonly" value="${pclVO.pcl_upperno }" /></td>
	<td><span class="span_box2">상위 분류명</span></td>
	<td align="left">
	<input type="text" name=pa_pcl_name class="box_input_left" 
				style="width: 250px;" readonly="readonly" value="${pclVO.pa_pcl_name }" /></td>			
	</tr>
	</table>
</div>
<!-- 상품분류 입력, 수정 -->

<!-- pcl_insert -->

<!-- pcl_list -->
<div style="width: 800px;">

	<div style="text-align: left; height: 30px;">
		<a href="${ct_path}/pcl_list.do?dana=pcl_list">최상위분류</a>
		<c:if test="${!empty old_list}">
		<c:forEach var="bean" items="${old_list}">
			<span id="spcl_list_step"  style="display: inline;">
			<select name="pcl_list_step" style="vertical-align: middle;" onchange="chkPclList(this, '${bean.pcl_upperno }', ${bean.pcl_step });">
				<c:if test="${!empty bean.pcl_list}">
				<c:forEach var="bean2" items="${bean.pcl_list}">
				<option value="${bean2.pcl_no }" <c:if test="${bean2.pcl_no == bean.pcl_no}"> selected="selected" </c:if>>${bean2.pcl_name }</option>
				</c:forEach>
				</c:if>
			</select>
			</span>
		</c:forEach>
		</c:if>
	</div> 
	
	<table style="width: 800px;">
	<thead>
		<tr>
			<td class="table_title" width="150px">분류코드</td>
			<td class="table_title" width="320px">분류명</td>
			<td class="table_title" width="90px">분류단계</td>
			<td class="table_title" width="90px">기본여부</td>
			<td class="table_title" width="150px">상위분류명</td>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach var="bean" items="${pcllist}">
		<tr>
			<td class="table_content1">
			<a href="javascript:goPclListNo('${bean.pcl_no }','${bean.pcl_step+1}','${bean.pcl_upperno }');">
			${bean.pcl_no}</a></td>
			<td class="table_content1">
			<a href="javascript:goPclListName('${bean.pcl_no }','${bean.pcl_upperno }');">
			${bean.pcl_name }</a></td>
			<td class="table_content2">${bean.pcl_step}</td>
			<td class="table_content2">${bean.pcl_basis}</td>
			<td class="table_content2">${bean.pa_pcl_name}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>	

</div>

</form>

</body>
</html>