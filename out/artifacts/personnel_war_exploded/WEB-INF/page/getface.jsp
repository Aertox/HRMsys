<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
	<style>
		body {
			background-image: url('../public/images/face.png'); /* 设置背景图片 */
			background-repeat: no-repeat; /* 调整图片尺寸 */
			background-position: 400px 100px;
			background-size: 50% auto;
		}
	</style>
    <title>js调用摄像头拍照上传图片</title>
    <meta charset="utf-8">
</head>
<script type="text/javascript" src="${ctx}/public/Getface.js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/public/Getface.js/Getface.js"></script>

<style>
	.getface{
		position: absolute;
		top: 25%;
		left: 40%;
		
	}
	.tishi{
		font-size: 20px;
		
	}
</style>
<body>
<div align="center">
	<p id="flag" class="tishi"></p>
</div>
<div class="getface">
	<video id="video" width="450px" height="450px" autoplay="autoplay"></video>
	<canvas id="canvas" width="450px" height="450px" style="display: none;"></canvas>
	<img id="imgTag" src="" alt="imgTag" style="display: none;">
</div>

</body>