<%@page import="com.stars.entity.Forum"%>
<%@page import="com.stars.entity.User"%>
<%@page import="com.stars.entity.Thread"%>
<%@page import="java.util.List"%>
<%@page import="com.stars.service.ThreadService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 设置浏览器兼容性 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 视口，声明当前网页在移动浏览器中device-width根据设备宽度  最小缩放minimum-scale,最大缩放maximum-scale -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/weblib/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/alreadyLogin.css"
	type="text/css">
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
					<%User user1 = (User)request.getAttribute("user"); %>
					<ul class="nav navbar-nav navbar-right hidden-sm">
						<li><a
							href="${pageContext.request.contextPath}/after/personalCenter"><img
								src="${pageContext.request.contextPath}/images<%=user1.getSrc() %>"
								alt="..." height="30px" width="30px" class="img-circle"></a></li>
						<li><a href="${pageContext.request.contextPath}"
							class="btn btn-link btn-sm">退出登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
	<div class="container">
		<div id="mainItem">
			<!-- 左边卡片 -->
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
				if(threads.size()==0){
					%><div><strong>没有搜索结果</strong> </div><% 
				}
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
						src="${pageContext.request.contextPath}/images<%=user.getSrc() %>"
						alt="..." class="img-circle"><strong class="name"><%=user.getNickname()%></strong>
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
			<!-- /左边卡片 -->
			<!-- 右边卡片 -->
			<div class="RightItemContainer">
				
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