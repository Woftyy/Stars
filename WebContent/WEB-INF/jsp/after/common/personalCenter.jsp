<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/weblib/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alreadyLogin.css" type="text/css">
</head>
<body>
<!-- 头部区域 -->
	<header id="header">
		<!-- <div class="topbar hidden-sm hidden-xs"> -->
		<nav class="navbar navbar-itcast navbar-static-top" data-spy="affix"
			data-offset-top="260" data-offset-bottom="200">
			<div class="container">
				<button id="btn" type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#nav_list"
					aria-expanded="false">
					<span class="sr-only">切换菜单</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> <i class="icon-logo"></i>
				</a>
				<div id="nav_list" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li ><a href="${pageContext.request.contextPath}/after">首页</a></li>
					</ul>
					<ul class="nav navbar-nav">
						<li>
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Search for..."> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button">Go!</button>
								</span>
							</div> <!-- /input-group -->
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right hidden-sm">
						<li><a href="${pageContext.request.contextPath}/after/personalCenter"><img src="${pageContext.request.contextPath}/images/photo_test01.jpg" 
						alt="..." height="30px" width="30px" class="img-circle"></a></li>
						<li><a href="#" class="btn btn-link btn-sm"
							data-toggle="modal" data-target="#login_form">退出登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
<div class="container">
<!-- mainItem -->
<div id="mainItem">
<!-- top card -->
<div class="top Card"  style="height:200px;">

<div style="padding-top:40px; padding-left:100px;padding-right:30px;">
<img src="${pageContext.request.contextPath}/images/photo_test01.jpg" 
						alt="..." height="120px" width="120px" class="img-circle">
						<strong style="padding-left:20px;font-size:23px;">用户名在这</strong>
</div>

<div class="btn-group" role="group">
    <button type="button" class="btn btn-default" style="position:relative;left:888px;">编辑个人资料</button>
</div>


</div>
<!-- /top card -->
</div>
<!-- /mainItem -->
</div>


	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>


</body>
</html>