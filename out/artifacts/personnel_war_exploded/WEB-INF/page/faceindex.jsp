<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>Signin Template for Bootstrap</title>
		<!-- Bootstrap core CSS -->
		<!--<link href="${ctx}/public/css/bootstrap.min.css" rel="stylesheet">-->
		<!-- Custom styles for this template -->
		<!--<link href="${ctx}/public/css/signin.css" rel="stylesheet">-->
		<link rel="stylesheet" href="${ctx}/public/css/signin.css">
		<link rel="stylesheet" href="${ctx}/public/css/bootstrap.min.css">



	</head>

	<body class="text-center">
		<form class="form-signin" action="${ctx}/facelogin/jumpGetface">
			<img class="mb-4" src="asserts/img/bootstrap-solid.svg" alt="" width="72" height="72">
			<h1 class="h3 mb-3 font-weight-normal">刷脸登录</h1>
			<label class="sr-only">Username</label>
			<input type="text" class="form-control" placeholder="Username" required="" autofocus="" value="admin">
			<label class="sr-only">Password</label>
			<input type="password" class="form-control" placeholder="Password" required="" value="admin">
			<div class="checkbox mb-3">
				<label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="faceloginpage" type="submit">刷脸登录</button>
			<p class="mt-5 mb-3 text-muted">2023</p>
			<a class="btn btn-sm">中文</a>
			<a class="btn btn-sm">English</a>
		</form>

	</body>

</html>