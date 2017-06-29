<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>컴퓨터 쇼핑몰의 최강자 DanaCom</title>
<script type="text/javascript">
	$(function() {
		if("${param.login_chk_msg}"){
			alert("${param.login_chk_msg}");
		}
	});
	
	function goProList(pro_pcl_no){
		location.href = "<%=cp %>/pro_main_prelist.do?dana=pro_main_prelist&pro_pcl_no="+pro_pcl_no;
	}
	
	function goMemLoginChk(){
		document.memLoginChk.action = "<%=cp %>/loginChk.do?dana=loginChk";
		document.memLoginChk.submit();
	}
	function goMemLoginOut(){
		location.href = "<%=cp %>/logout.do?dana=logout";
	}
</script>
</head>
<body>

<div id="top_title">
<a href="<%=cp %>/"><img src="<%=cp %>/img/top_main01.gif" alt="다나컴" /></a>
</div>

<c:if test="${login.mem_admin_autho =='y'}">
<nav id="top_ltb">
	<ul>
		<li><a href="<%=cp %>/pcl_list.do?dana=pcl_list">관리자모드</a></li>
	</ul>	
</nav>
</c:if>
<nav id="top_ltb_user">
	<ul>
		<li>사용자 -> kko01/111</a></li>
		<li>관리자 -> admin/111</a></li>
	</ul>
</nav>

<nav id="top_gnb">
	<ul>
		<li>
			<span>통합검색</span>
			<input type="text" class="box_input_left3" size="30" name="searchValue" value="" />
			<span class="box_button3">검색</span>
		</li>
	</ul>
</nav>
<nav id="top_lnb">
	<ul>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">가상견적서</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/vbl_main_prelist.do?dana=vbl_main_prelist">가상견적서</a></c:if>
		</li>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">공유견적서</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/vbb_prelist.do?dana=vbb_prelist">공유견적서</a></c:if>
		</li>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">베틀견적서</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/btl_main_list.do?dana=btl_main_list&reurl=main">베틀견적서</a></c:if>
		</li>
	</ul>
</nav>

<nav id="top_rnb">
	<ul>
		<li style="padding-top: 5px; margin-right: 5px;">
		<form name="memLoginChk" method="post">
		<span>
		<c:if test="${login.cmd != 101}">
			아이디 <input type="text" name="mem_id" size="12" maxlength="15" class="box_input_left4" />
			비밀번호 <input type="password" name="mem_pass" size="12" maxlength="15" class="box_input_left4" />
			<a href="javascript:goMemLoginChk();"><img src="<%=cp %>/img/btn_login_2.gif" style="vertical-align: -4px;" /></a>
		</c:if>
		<c:if test="${login.cmd == 101}">
			<span style="color: #9933FF; font-size: 18px; font-weight: bold;">${login.mem_name }</span> 님이 로그인 하셨습니다.&nbsp;
			<a href="javascript:goMemLoginOut();"><img src="<%=cp %>/img/btn_logout.gif" style="vertical-align: -4px;" /></a>
		</c:if>
		</span>
		</form>
		</li>
		<li><a href="<%=cp %>/member_prejoin.do?dana=member_prejoin">회원가입</a></li>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">장바구니</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/sct_main_prelist.do?dana=sct_main_prelist">장바구니</a></c:if>
		</li>
		<li>
		<c:if test="${login.cmd != 101}"><a href="#">마이페이지</a></c:if>
		<c:if test="${login.cmd == 101}"><a href="<%=cp %>/orders_list.do?dana=orders_list">마이페이지</a></c:if>
		</li>
	</ul>
</nav>

<!-- 상품분류 -->
<div style="width: 960px; margin: 0 auto; position: absolute; top: 93px;">
	<table style="width: 960px; padding: 0; border-spacing: 0;">
	<tr>
		<c:forEach var="bean" items="${class_list}" varStatus="vs">
		<c:if test="${vs.count < 3}">
		<td>
			<table style="width: 480px; padding: 0; border-spacing: 1px;">
			<tr><td style="width: 480px;" class="main_title1">${bean.pcl_name}</td></tr>
			<tr><td>
				<table style="width: 480px; padding: 0; border-spacing: 1px;">
				<tr>
					<c:forEach var="bean2" items="${bean.pcl_list}">
					<td class="main_title2">
						<a href="javascript:goProList('${bean2.pcl_no}');">${bean2.pcl_name}</a>
					</td>
					</c:forEach>
				</tr>
				</table>
			</td></tr>
			</table>
		</td>
		</c:if>
		</c:forEach>
	</tr>
	</table>
</div>

</body>
</html>