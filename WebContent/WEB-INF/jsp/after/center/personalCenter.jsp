<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/weblib/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/alreadyLogin.css"
	type="text/css">
<style type="text/css">
.breadcrumb {
	padding: 8px 15px;
	margin-bottom: 0px;
	list-style: none;
	background-color: white;
	border-radius: 4px;
}
</style>
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
						<li><a href="${pageContext.request.contextPath}/after">首页</a></li>
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
						<li><a
							href="${pageContext.request.contextPath}/after/personalCenter"><img
								src="${pageContext.request.contextPath}/images/photo_test01.jpg"
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
			<div class="top Card" style="height: 200px;">

				<div
					style="padding-top: 40px; padding-left: 100px; padding-right: 30px;">
					<img
						src="${pageContext.request.contextPath}/images/photo_test01.jpg"
						alt="..." height="120px" width="120px" class="img-circle"> <strong
						style="padding-left: 20px; font-size: 23px;">用户名在这</strong>
				</div>

				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default"
						style="position: relative; left: 888px;">编辑个人资料</button>
				</div>


			</div>
			<!-- /top card -->
			<!-- LeftItemContainer -->
			<div class="LeftItemContainer">

				<div class="Card LeftItem ">
					<ol class="breadcrumb">
						<li class="active"><a href="#" id="a1">发布</a></li>
						<li><a href="#" id="a2">评论</a></li>
						<li><a href="#" id="a3">收藏</a></li>
					</ol>
				</div>
				<!--card leftItem -->

			<div id="con" >
			
			</div>

				<!-- /card leftItem -->
			</div>
			<!-- leftITem -->
			<!-- RightItem -->
			<div class="RightItemContainer">
				<div class="Card RightItem">
				</div>
				<div class="Card RightItem data">
					<button>
						<div>
							<div>总访问数</div>
							<div></div>
						</div>
					</button>
					<button class="rightButton">
						<div>
							<div>被收藏数</div>
							<div>421</div>
						</div>
					</button>
				</div>

			</div>
		</div>
		<!-- /mainItem -->
	</div>


	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>
	<script >
	
	 $(document).ready(function(){
         //页面加载的时候，内容框默认显示 a.html
         $('#con').load('${pageContext.request.contextPath}/after/center/posts');
         //单击 a 链接，加载 a.html
         $("#a1").click(function(){
             $('#con').load('${pageContext.request.contextPath}/after/center/posts');
             
         });
         //单击 b 链接，加载 b.html
         $("#a2").click(function(){
             $('#con').load('${pageContext.request.contextPath}/view/science_hot');
         });
         $("#a3").click(function(){
             $('#con').load('${pageContext.request.contextPath}/view/science_reply');
         });
     });
	 

	
	</script>
	

</body>
</html>