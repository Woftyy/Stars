<%@page import="com.alibaba.druid.sql.visitor.functions.Substring"%>
<%@page import="com.stars.entity.Forum"%>
<%@page import="com.stars.entity.User"%>
<%@page import="com.stars.entity.Thread"%>
<%@page import="java.util.List"%>
<%@page import="com.stars.service.ThreadService"%>
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
<title>天上星河-首页</title>
<!-- 引入Bootstrap核心样式表文件 -->
<link href="weblib/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/main.css" type="text/css">

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
		<nav class="navbar navbar-itcast navbar-static-top" data-spy="affix"
			data-offset-top="100" data-offset-bottom="100">
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
						<li class="active"><a href="">首页</a></li>
					</ul>
					<ul class="nav navbar-nav">
						<li>
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="输入关键字搜索"> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button" onclick="window.location.href='${pageContext.request.contextPath}/login'">搜索</button>
								</span>
							</div> <!-- /input-group -->
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right hidden-sm">
						<li><a href="${pageContext.request.contextPath}/register" class="btn btn-link btn-sm">注册</a></li>
						<li><a href="${pageContext.request.contextPath}/login" class="btn btn-link btn-sm">登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
	<!-- 广告轮播 -->
	<div class="container">
		<section id="main_ad" class="carousel slide" data-ride="carousel">
			<!-- 下面的小点点，活动指示器 -->
			<ol class="carousel-indicators">
				<li data-target="#main_ad" data-slide-to="0" class="active"></li>
				<li data-target="#main_ad" data-slide-to="1"></li>
				<li data-target="#main_ad" data-slide-to="2"></li>
				<li data-target="#main_ad" data-slide-to="3"></li>
			</ol>
			<!-- 轮播项 -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" data-image-lg="images/slide01.jpg"
					data-image-xs="images/slide01.jpg"></div>
				<div class="item" data-image-lg="images/slide02.jpg"
					data-image-xs="images/slide02.jpg"></div>
				<div class="item" data-image-lg="images/slide03.jpg"
					data-image-xs="images/slide02.jpg"></div>
				<div class="item" data-image-lg="images/slide04.jpg"
					data-image-xs="images/slide02.jpg"></div>
			</div>
		</section>
	</div>
	<!-- /广告轮播 -->
	<!-- 主要内容 -->
	<div class="container">
		<div id="mainItem">
			<!-- 左边卡片 -->
				<div class="LeftItemContainer">
			<%
			
			  List<Thread> threads = (List<Thread>) request.getAttribute("threads");
			List<Forum> forums = (List<Forum>) request.getAttribute("forums");
			List<User> users = (List<User>) request.getAttribute("users");
			User user = new User();
			Forum forum = new Forum();
			Thread thread= new Thread();
				for (int i = threads.size()-1; i>=0 ; i--) {
					thread = threads.get(i);
					forum=forums.get(i);
					user = users.get(i);
			%>
			<div class="Card LeftItem" >
				<div class="WhererForumItem">
					<span>来自：<a href="${pageContext.request.contextPath}<%=forum.getUrlView()%>"><%=forum.getName() %></a></span>


				</div>
				<div class="UserItem">
					<img src="${pageContext.request.contextPath}/images<%=user.getSrc() %>" alt="..." class="img-circle"><strong
						class="name"><a href="#"><%=user.getNickname() %></a></strong>
				</div>

				<div class="ContentItem"  onclick="window.location.href='${pageContext.request.contextPath}/login'">
					<strong class="title"><%=thread.getTitle()%></strong>
						<p></p>
					                   <button type="button" class="comment_button">
  <span class="glyphicon glyphicon-comment" aria-hidden="true"><%=thread.getReplyNum()%>条评论</span>
</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="comment_button">
  <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><%=thread.getViews() %>查看</span>
</button>
				</div>
			</div>
			
			<%
				}

			%>
			</div>
<!-- /左边卡片 -->

			<!-- 右边卡片 -->
				<div class="RightItemContainer">
			<div class="Card RightItem">

				<div class="post">
				<button class="publish_button" onclick="window.location.href='${pageContext.request.contextPath}/login'">
					<span class="glyphicon glyphicon-pencil"> </span><strong>发帖</strong>
</button>
				</div>
			</div>
			<div class="Card RightItem">





				<div class="hotForum">
					<strong>热门版块</strong>
					<hr />
					<ul>
				<li><p>
								<a href="${pageContext.request.contextPath}/view/science">科普讨论</a>
							</p></li>
						<li><p>
								<a href="${pageContext.request.contextPath}/view/photograph">摄影天地</a>
							</p></li>
						<li><p>
								<a href="${pageContext.request.contextPath}/view/movie">电影宇宙</a>
							</p></li>
					</ul>
				</div>
			</div>
			<a href="${pageContext.request.contextPath}/admin">管理员</a>
			</div>
			<!-- /右边卡片 -->
		</div>
		<!-- /mainItem -->
	</div>
	<!-- /主要内容 -->

	<script src="weblib/jquery/jquery.js"></script>
	<script src="weblib/bootstrap/js/bootstrap.js"></script>
	<script src="js/main.js"></script>

</body>
</html>