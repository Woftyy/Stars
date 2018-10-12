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
						<li class="active"><a
							href="${pageContext.request.contextPath}/after">首页</a></li>
					</ul>
					<ul class="nav navbar-nav">
						<li>
						<form id="requestSearch" >
							<div class="input-group">
								<input id="content" type="text" class="form-control" 
									placeholder="Search for..."> <span
									class="input-group-btn">
									<button class="btn btn-default"  
									onclick="toSearch()">搜索</button>
								</span>
							</div> <!-- /input-group -->
							</form>
						</li>
					</ul>
					<%!  User user1=new User(); %>
					<%
					user1 = (User)request.getAttribute("user");
					System.out.println("AlreadyLogin--url--"+user1.getSrc()); %>
					<ul class="nav navbar-nav navbar-right hidden-sm">
						<li><a href="${pageContext.request.contextPath}/after/personalCenter">
						<img src="${pageContext.request.contextPath}/images<%=user1.getSrc() %>" 
						alt="..." height="30px" width="30px" class="img-circle"></a></li>
						<li><a href="${pageContext.request.contextPath}"
							class="btn btn-link btn-sm">退出登录</a></li>
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
				<div class="item active"
					data-image-lg="${pageContext.request.contextPath}/images/slide01.jpg"
					data-image-xs="${pageContext.request.contextPath}/images/slide01.jpg"></div>
				<div class="item"
					data-image-lg="${pageContext.request.contextPath}/images/slide02.jpg"
					data-image-xs="${pageContext.request.contextPath}/images/slide02.jpg"></div>
				<div class="item"
					data-image-lg="${pageContext.request.contextPath}/images/slide03.jpg"
					data-image-xs="${pageContext.request.contextPath}/images/slide02.jpg"></div>
				<div class="item"
					data-image-lg="${pageContext.request.contextPath}/images/slide04.jpg"
					data-image-xs="${pageContext.request.contextPath}/images/slide02.jpg"></div>
			</div>
		</section>
	</div>
	<!-- /广告轮播 -->
	<!-- 主要内容 -->
	<div class="container">
		<div id="mainItem">
		<!-- LeftItemContainer -->
			<div class="LeftItemContainer">
			<!-- 左边卡片 -->
			<%
				int uid =(int)session.getAttribute("uid");
				List<Thread> threads = (List<Thread>) request.getAttribute("threads");
				List<Forum> forums = (List<Forum>) request.getAttribute("forums");
				List<User> users = (List<User>) request.getAttribute("users");
				User user = new User();
				Forum forum = new Forum();
				Thread thread = new Thread();
				for (int i = threads.size() - 1; i >= 0; i--) {
					thread = threads.get(i);
					forum = forums.get(i);
					user = users.get(i);
			%>
			<div class="Card LeftItem">
				<div class="WhererForumItem">
					<span>来自：<a href="${pageContext.request.contextPath}<%=forum.getUrlAfter()%>"><%=forum.getName()%></a></span>


				</div>
				<div class="UserItem">
					<img
						src="${pageContext.request.contextPath}/images<%=user.getSrc()%>"
						alt="..." class="img-circle"><strong class="name">
						<a href="${pageContext.request.contextPath}/after/othersCenter?otherUid=<%=user.getId()%>"><%=user.getNickname()%></a></strong>
				</div>

				<div class="ContentItem"
					onclick="javascript:window.open('${pageContext.request.contextPath}/after/reading?uid=<%=user.getId()%>&tid=<%=thread.getId()%>','_blank')">
					<strong class="title"><%=thread.getTitle()%></strong>
					<% System.out.println("alreadyuid="+user.getId()); 
					System.out.println("alreadyuname="+user.getName()); 
					%>
					<p></p>
					<button type="button" class="comment_button">
						<span class="glyphicon glyphicon-comment" aria-hidden="true"><%=thread.getReplyNum()%>条评论</span>
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="comment_button">
						<span class="glyphicon glyphicon-eye-open" aria-hidden="true"><%=thread.getViews() %>查看</span>
					</button>
				</div>

			</div>
			<!-- /左边卡片 -->
			<%
				}
			%>
			</div>
			<!-- 右边卡片 -->
				<div class="RightItemContainer">
			<div class="Card RightItem">

				<div class="post">
					<button class="publish_button"
						onclick="window.location.href='${pageContext.request.contextPath}/after/editing?uid=<%=uid%>'">
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
									<a href="${pageContext.request.contextPath}/after/science">科普讨论</a>
								</p></li>
							<li><p>
									<a href="${pageContext.request.contextPath}/after/photograph">摄影天地</a>
								</p></li>
							<li><p>
									<a href="${pageContext.request.contextPath}/after/movie">电影宇宙</a>
								</p></li>
					</ul>
				</div>
			</div>
			</div>
			<!-- /右边卡片 -->
		</div>
		<!-- /mainItem -->
	</div>
	<!-- /主要内容 -->

	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
		<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.form.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script >
function toSearch(){
    //这里面可以做表单提交前的验证判断
    
 //   javascript:window.open('${pageContext.request.contextPath}/after/search?','_blank')
	 $('#requestSearch').submit(function() {
		var content= $('#content').val();
		console.log(content);
		 window.open('${pageContext.request.contextPath}/after/search?content='+content,'_blank')
		 return false;
  	   });
}

</script>
   
</body>
</html>