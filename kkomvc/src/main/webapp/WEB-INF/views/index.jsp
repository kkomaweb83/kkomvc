<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꼬마web의 놀이터</title>

<c:set var="ct_path" value="<%= request.getContextPath() %>"/>    

<script type="text/javascript" src="${ct_path}/js/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${ct_path}/js/kkoma01.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="${ct_path}/css/kkoma_new_01.css" />

<style type="text/css">

* {
    box-sizing: border-box;
}

[class*="col-"] {
    width: 100%;
    float: left;
}
.col_center{ text-align: center; }
.col_left { text-align: center; }
.col_right { text-align: center; }  

@media only screen and (min-width: 768px) {
	.col_body{
		width: 590px;
		margin: 0 auto;
	}
	
	.col-m-1 {width: 8.33%;}
    .col-m-2 {width: 16.66%;}
    .col-m-3 {width: 25%;}
    .col-m-4 {width: 33.33%;}
    .col-m-5 {width: 41.66%;}
    .col-m-6 {width: 50%;}
    .col-m-7 {width: 58.33%;}
    .col-m-8 {width: 66.66%;}
    .col-m-9 {width: 75%;}
    .col-m-10 {width: 83.33%;}
    .col-m-11 {width: 91.66%;}
    .col-m-12 {width: 100%;}
}
@media only screen and (min-width: 1024px) {
	.col_body{
		width: 960px;
		margin: 0 auto;
	}
	
	.col-1 {width: 8.33%;}
    .col-2 {width: 16.66%;}
    .col-3 {width: 25%;}
    .col-4 {width: 33.33%;}
    .col-5 {width: 41.66%;}
    .col-6 {width: 50%;}
    .col-7 {width: 58.33%;}
    .col-8 {width: 66.66%;}
    .col-9 {width: 75%;}
    .col-10 {width: 83.33%;}
    .col-11 {width: 91.66%;}
    .col-12 {width: 100%;}
    
    .col_center{ text-align: center; }
	.col_left { text-align: left; }
	.col_right { text-align: right; }
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
	float: left;
}
.index_title2_l > a { color: #FF9900; }
.index_title2_l > a:hover { color: white; }
.index_title2_l:hover > a { color: white; }
.index_title2_l:hover {
	background: #FF9900;
	color: white;
}

.index_content{
	width: 80%;
	margin: 0 auto;
	border: 0px solid #4374D9;
}

.video-container {
    position: relative;
    padding-bottom: 56.25%;
    padding-top: 30px; 
    height: 0; 
    overflow: hidden;
    border: 2px solid #FF9900;
    margin-top: 10px;
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
<body class="col_body">

	<div class="col-12 col-m_12">
	<div class="col-2 col-m-0"></div>
	<div class="col-4 col-m-6 col_right">
		<img src="${ct_path}/img/index02.gif" alt="꼬마web의 놀이터" />
	</div>
	<div class="col-4 col-m-6 col_left">
		<a href="${ct_path}/pro_main_prelist.do?dana=pro_main_prelist&pro_pcl_no=0101"><img src="${ct_path}/img/top_main01.gif" alt="다나컴" /></a>
	</div>
	<div class="col-2 col-m-0"></div>
	</div>
	
	<div class="col-12 col-m_12">
	<div class="col-6 col-m_6">
		<div style="position: relative;">
		<ul>
			<li onclick="goDanaCom()" class="index_title1_l" style="width: 100%; display: block;">다나컴(DanaCom) 견적서PC 쇼핑몰</li>
		</ul>
		<ul style="margin-top: 2px;">
			<li class="index_title2_l" style="width: 33%; float: left;"><a href="javascript:goYoutube('x843Y8JJWc8')">기획서 동영상1</a></li>				
			<li class="index_title2_l" style="width: 33%; float: left;"><a href="javascript:goYoutube('lMW94lLtxpI')">기획서 동영상2</a></li>				
			<li class="index_title2_l" style="width: 33%; float: left;"><a href="javascript:goYoutube('mFGJi7aKQIU')">시연 동영상</a></li>				
		</ul>
		</div>
	</div>
	<div class="col-6 col-m_6">
		<div style="position: relative;">
		<ul>
			<li class="index_title1_r" style="width: 100%; display: block;">꼬마web의 주식 공부방 ☞ 개발중 입니다!</li>
		</ul>
		<ul style="margin-top: 2px;">
			<li class="index_title2_l" style="width: 33%; float: left;"><a href="https://github.com/kkomaweb83/kkomvc" target="_blank">소스 깃허브</a></li>				
			<li class="index_title2_l" style="width: 33%; float: left;"><a href="${ct_path}/download.do?file_name=kko_project01.pptx">기획서 다운</a></li>				
			<li class="index_title2_r" style="width: 33%; float: left;">시연 동영상</li>				
		</ul>	
		</div>
	</div>
	</div>
	
	<div class="col-12 col-m_12">
		<div class="index_content">
		<div class="video-container">
	    	<div class="jetpack-video-wrapper">
		    	<span class="embed-youtube" style="text-align: center; display: block;">
		    	<iframe id="youtube_kko" class="youtube-player" src="https://www.youtube.com/embed/x843Y8JJWc8" allowfullscreen="true" 
		    		style="margin: 0px; border: 0px currentColor; border-image: none; width: 100%; height: 100%; display: block;" 
		    		type="text/html" data-ratio="0.5625"></iframe>
		    	</span>
	    	</div>
		</div>
		</div>
	</div>
	
	<footer>
	
	</footer>

</body>
</html>