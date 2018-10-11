<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.stars.service.impl.UserServiceImpl"%>
<%@page import="com.stars.service.UserService"%>
<%@page import="com.stars.entity.ReplyThread"%>
<%@page import="java.util.List"%>
<%@page import="com.stars.entity.Thread"%>
<%@page import="com.stars.entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 设置当前HTML 文件字符编码 -->
<meta charset="utf-8">
<!-- 设置浏览器兼容性 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 视口，声明当前网页在移动浏览器中device-width根据设备宽度  最小缩放minimum-scale,最大缩放maximum-scale -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>天上星河-查看</title>
<!-- 引入Bootstrap核心样式表文件 -->
<link
	href="${pageContext.request.contextPath}/weblib/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/alreadyLogin.css"
	type="text/css">
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!-- 条件注释   1 让浏览器识别html5 2respond让低版本浏览器可以使用css3媒体查询-->
<!--[if lt IE 9]>
	      <script src="weblib/html5shiv/html5shiv.min.js"></script>  
	      <script src="weblib/respond/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
	<!-- 头部区域 -->
	<header id="header">
		<!-- <div class="topbar hidden-sm hidden-xs"> -->
		<!-- 		data-spy="affix"
			data-offset-top="0" data-offset-bottom="0" -->
		<nav class="navbar navbar-itcast navbar-static-top">
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
						<li class="active"><a
							href="${pageContext.request.contextPath}">首页</a></li>
					</ul>
					<ul class="nav navbar-nav">
					
					</ul>
				
					<ul class="nav navbar-nav navbar-right hidden-sm">
					
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->

	<div class="container">
		<div id="mainItem">
			<!--  Top -->
			<%
				User user = (User) request.getAttribute("user");
				Thread thread = (Thread) request.getAttribute("thread");
			%>
			<div class="Top Card" style="padding: 16px 20px;">
				<div>
					&nbsp;&nbsp;&nbsp;
					<h2><%=thread.getTitle()%></h2>
				</div>
				<br>
				<button type="button" class="comment_button">
					<span class="glyphicon glyphicon-comment" aria-hidden="true"><%=thread.getReplyNum()%>条评论</span>
				</button>
				<button type="button" class="comment_button">
					<span class="glyphicon glyphicon-eye-open" aria-hidden="true"><%=thread.getViews()%>查看</span>
				</button>
				<button type="button" class="comment_button">
					<span class="glyphicon glyphicon-edit" aria-hidden="true"><%=(String.valueOf(thread.getTime())).substring(0, 19)%></span>
				</button>
			</div>
			<!--  /Top -->
			<div >

				<div class="Card "style="padding: 16px 20px;">
					<div class="UserItem">
						<img
							src="${pageContext.request.contextPath}/images<%=user.getSrc() %>"
							alt="..." class="img-circle"><strong class="name"><%=user.getNickname()%></strong>
					</div>
					<br>
					<div class="contents">
						<%=thread.getContent()%>
					</div>
				</div>
			
			</div>
			<!-- /左边卡片 -->

		

		
		
		</div>
	</div>
	<!-- /container -->
	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.form.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script>

   
   
</script>
</body>
</html>