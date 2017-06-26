<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<script type="text/javascript">
	$(function() {
		$("#dialog").dialog({
			autoOpen:true, //자동으로 열리지않게
			width:600,
			height:500,
			modal:false, //모달대화상자
            resizable:false, //크기 조절 못하게
			show : 'slide', hide : 'slide',
			position : [500, 500],
			buttons: {
				"닫기": function() {
					$(this).dialog('close');
				}
			}
		});
	});
</script>

<div id="dialog" title="배틀견적서 상세" style="display: none; width: 95%;" align="left">
	<table class="lngTable2" style="width: 95%;">
		<tr>
			<th width="10%">번호</th>
			<th width="40%">제목</th>
			<th width="20%">점수</th>
			<th width="20%">가격</th>
			<th width="10%">작성자</th>
		</tr>
		<tr>
			<td style="vertical-align: middle; text-align: center;">${btlJoinContent.vbj_no}</td>
			<td>${btlJoinContent.vbj_title}</td>
			<td style="vertical-align: middle; text-align: center;">${btlJoinContent.vbj_grade}점</td>
			<td style="vertical-align: middle; text-align: center;">${btlJoinContent.totDisprice}</td>
			<td style="vertical-align: middle; text-align: center;">${btlJoinContent.mem_id}</td>
		</tr>
	</table>
	
	<div class="title_box3" style="width: 95%;">
	<span style="margin-right: 10px;">☞  견적서 상품 목록</span> 
	</div>
	
	<div align="left" style="width: 95%;">
	<c:forEach var="btlPro" items="${btlJoinDetList}">
		<table style="border-bottom: #336699 1px solid; padding-bottom: 5px; padding-top: 5px; width: 100%;">
			<tr>
				<td style="text-align: left; width: 15%;">
					${btlPro.pcl_name }
				</td>
				<td style="text-align: center; width: 18%;">
					<img src="${ct_path}/product_img/${btlPro.pmg_file }" style="width: 60px; height: 60px; border: 0px;" />
				</td>
				<td style="text-align: left; width: 47%;">
					<table>
						<tr>
							<td style="font-weight: bold;" align="left">
								${btlPro.pro_name }
							</td>
						</tr>
						<tr>
							<td style="color: #6666CC;" align="left">
								등록일 : ${btlPro.pro_regdate }
							</td>
						</tr>
					</table>
				</td>
				<td width="10%">
					${btlPro.vbd_quantity }개 
				</td>
				<td width="5%" align="right" style="color: #FF3333; font-size: 11pt; font-weight: bold;">
					${btlPro.pro_disprice }
				</td>
			</tr>
		</table>
	</c:forEach>
	</div>
</div>       