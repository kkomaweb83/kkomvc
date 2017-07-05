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
.midLayout
{
	margin: 30px 10px 30px 280px;
	top: 150px;
	left: 50%;
	text-align: left;
	overflow: auto;
}
.box_top{
 	font-size: 9pt;
 	border-top: gray 1px solid;
 	border-right: gray 1px solid;
 	border-bottom: gray 1px solid;
 	border-left: gray 1px solid;
 	padding: 5px;
 	vertical-align: middle;
 	text-align: center;
 }
.video-container {
    position: relative;
    padding-bottom: 56.25%;
    margin-left: 10px;
    padding-top: 30px; height: 0; overflow: hidden;
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
</script>
</head> 
<body>
<div style="width: 960px; margin:0 auto;">

	<div style="margin: 10px;">
		<nav id="top_lnb">
			<ul>
				<li><a href="javascript:goYoutube('x843Y8JJWc8')">기획서 동영상1</a></li>
				<li><a href="javascript:goYoutube('lMW94lLtxpI')">기획서 동영상2</a></li>
				<li><a href="javascript:goYoutube('mFGJi7aKQIU')">시연 동영상</a></li>
				<li><a href="https://github.com/kkomaweb83/kkomvc" target="_blank">소스 깃허브</a></li>
			</ul>
		</nav>
	</div>
	<div class="midLayout">
		<table style="width: 400px; height: 200px;" class="box_top">
		<tbody>
			<tr>
				<td align="center">
					<img src="${ct_path}/img/index02.gif" alt="꼬마web의 놀이터" />
				</td>
			</tr>
			<tr>
				<td align="center">
					<a href="${ct_path}/pro_main_prelist.do?dana=pro_main_prelist&pro_pcl_no=0101"><img src="${ct_path}/img/top_main01.gif" alt="다나컴" /></a>
				</td>
			</tr>
		</tbody>
		</table>
	</div>
	
	<div class="video-container">
    	<div class="jetpack-video-wrapper">
	    	<span class="embed-youtube" style="text-align: center; display: block;">
	    	<iframe id="youtube_kko" class="youtube-player" src="https://www.youtube.com/embed/x843Y8JJWc8" allowfullscreen="true" 
	    		style="margin: 0px; border: 0px currentColor; border-image: none; width: 560px; height: 315px; display: block;" 
	    		data-height="315" data-width="560" type="text/html" data-ratio="0.5625"></iframe>
	    	</span>
    	</div>
	</div>
	

</div>

</body>
</html>