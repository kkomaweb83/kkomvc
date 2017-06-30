<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>컴퓨터 쇼핑몰의 최강자 DanaCom</title>

<!-- 환경설정 include 한다. -->
<%@ include file="../include/EnvironmentSetup.jsp" %>

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<header id="top_header">
	<%-- 상단 헤더 include 처리 --%>
	<jsp:include page="../top/top_menu.jsp" flush="false" />
	
	</header>
	
	<div id="content">
	
	<!-- 전체 -->
	<div id="proMainViewDiv" style="width: 960px; margin: 0 auto; text-align: center;">
	
	<section id="admin_section">
	
	<div class="title_div1">
		<div style="float: left;" >
			<span style="font-size: 5px;">&nbsp;</span><br/>
			<span class="title_box1">★ 축 회원가입 완료 ★</span>
			<span style="margin-right: 20px;">&nbsp;</span>
		</div>
	</div>
	
	<table style="width: 100%; border: 1px solid red;">
		<tr>
			<td colspan="4" style="text-align: center;">
				<div style="font-size: 20px; margin: 10px; padding: 10px;">
					회원ID : ${mem_id}
				</div>
				<div style="border: #FF9900 1px solid;font-size: 15px; padding: 10px;margin-bottom: 10px;">
				이용하시면서 문의사항이나 문제점이 발생할 경우에는<br/> 
				고객지원실 (<a style="color:red;">02-555-9999</a>) 로<br/> 
				문의 하시기 바랍니다.<br/>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<div class="box_button1"><a href="${ct_path}/pro_main_prelist.do?dana=pro_main_prelist&pro_pcl_no=0101">메인화면</a></div>
			</td>
		</tr>
	</table>
	
	</section>
	
	</div>
	
	</div>
	
	<footer>
	
	</footer>
<!-- 상세보기 dlg -->
<div id="dialog"></div>		
</body>
</html>