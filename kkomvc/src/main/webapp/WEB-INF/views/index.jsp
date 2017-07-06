<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>꼬마web의 놀이터</title>

<c:set var="ct_path" value="<%= request.getContextPath() %>"/>    

<script type="text/javascript" src="${ct_path}/js/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${ct_path}/js/kkoma01.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="${ct_path}/css/kkoma_new_01.css" />

<style type="text/css">
#index_header {
	width: 960px;
	margin: 0 auto;
	height: 145px;
	position: relative;
}
#index_header > #top_title {
	position: absolute;
	left: 250px; top: 10px;
}
#index_content{
	width: 700px;
	margin: 0 auto;
	border: 0px solid #4374D9;
	padding-top: 15px;
}
.index_title1_r{
	font-size: 15px;
	background-color: #4374D9;
	border: #FF9900 1px solid;
	padding: 9px 5px 9px 5px;
	text-align: center;
	color: #FFFFFF;
}
.index_title1_l{
	font-size: 15px;
	background-color: #FF9900;
	border: #336699 1px solid;
	padding: 9px 5px 9px 5px;
	text-align: center;
	color: #FFFFFF;
	cursor: pointer;
}
.index_title1_l:hover {
	background: white;
	color: #4374D9;
	border: #4374D9 1px solid;
}
.index_title2_r{
	padding: 9px 12px 9px 12px;
	border: 1px solid #4374D9;
	margin-left: 1px;
	color: #4374D9;
	text-align: center;
}
.index_title2_l{
	padding: 9px 12px 9px 12px;
	border: 1px solid #FF9900;
	margin-left: 1px;
	color: #FF9900;
	text-align: center;
}
.index_title2_l > a { color: #FF9900; }
.index_title2_l > a:hover { color: white; }
.index_title2_l:hover > a { color: white; }
.index_title2_l:hover {
	background: #FF9900;
	color: white;
}

.video-container {
    position: relative;
    padding-bottom: 56.25%;
    padding-top: 30px; 
    height: 0; 
    overflow: hidden;
    border: 2px solid #FF9900;
}
.video-container iframe,
.video-container object,
.video-container embed {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
 
</style>
<script type="text/javascript">
	function goYoutube(url){
		var newSrc = "https://www.youtube.com/embed/" + url;
		document.getElementById("youtube_kko").src = newSrc;
	}
	function goDanaCom(){
		location.href = "${ct_path}/pro_main_prelist.do?dana=pro_main_prelist&pro_pcl_no=0101";
	}
</script>
</head> 
<body>

	<header id="index_header">
	
	<div id="top_title">
		<img src="${ct_path}/img/index02.gif" alt="꼬마web의 놀이터" />
		<a href="${ct_path}/pro_main_prelist.do?dana=pro_main_prelist&pro_pcl_no=0101"><img src="${ct_path}/img/top_main01.gif" alt="다나컴" /></a>
	</div>
	
	<div style="width: 960px; margin: 0 auto; position: absolute; top: 70px;">
		<table style="width: 960px; padding: 0; border-spacing: 0;">
		<tr>
		<td>
			<table style="width: 480px; padding: 0; border-spacing: 1px;">
			<tr><td style="width: 480px;" class="index_title1_l" onclick="goDanaCom()">다나컴(DanaCom) 견적서PC 쇼핑몰</td></tr>
			<tr><td>
				<table style="width: 100%; padding: 0; border-spacing: 2px;">
				<tr>
					<td class="index_title2_l" style="width: 33.3%;"><a href="javascript:goYoutube('x843Y8JJWc8')">기획서 동영상1</a></td>
					<td class="index_title2_l" style="width: 33.3%;"><a href="javascript:goYoutube('lMW94lLtxpI')">기획서 동영상2</a></td>
					<td class="index_title2_l" style="width: 33.3%;"><a href="javascript:goYoutube('mFGJi7aKQIU')">시연 동영상</a></td>
				</tr>
				</table>
			</td></tr>
			</table>
		</td>
		
		<td>
			<table style="width: 480px; padding: 0; border-spacing: 1px;">
			<tr><td style="width: 480px;" class="index_title1_r">꼬마web의 주식 공부방 ☞ 개발중 입니다!</td></tr>
			<tr><td>
				<table style="width: 100%; padding: 0; border-spacing: 2px;">
				<tr>
					<td class="index_title2_l" style="width: 33.3%;"><a href="https://github.com/kkomaweb83/kkomvc" target="_blank">소스 깃허브</a></td>
					<td class="index_title2_r" style="width: 33.3%;">기획서 동영상</td>
					<td class="index_title2_r" style="width: 33.3%;">시연 동영상</td>
				</tr>
				</table>
			</td></tr>
			</table>
		</td>
		</tr>
		</table>
	</div>
	
	</header>
	
	<div id="index_content">
	
	<div class="video-container">
    	<div class="jetpack-video-wrapper">
	    	<span class="embed-youtube" style="text-align: center; display: block;">
	    	<iframe id="youtube_kko" class="youtube-player" src="https://www.youtube.com/embed/x843Y8JJWc8" allowfullscreen="true" 
	    		style="margin: 0px; border: 0px currentColor; border-image: none; width: 100%; height: 100%; display: block;" 
	    		data-height="315" data-width="560" type="text/html" data-ratio="0.5625"></iframe>
	    	</span>
    	</div>
	</div>
	
	<div style="height: 20px;"></div>
	
	</div>
	
	<footer>
	
	</footer>

</body>
</html>