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
<title>天上星河-科普讨论</title>
<!-- 引入Bootstrap核心样式表文件 -->
<link href="${pageContext.request.contextPath}/weblib/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/science.css" type="text/css">


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
						<li ><a href="${pageContext.request.contextPath}">首页</a></li>
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
						<li><a href="${pageContext.request.contextPath}/register" class="btn btn-link btn-sm">注册</a></li>
						<li><a href="${pageContext.request.contextPath}/login" class="btn btn-link btn-sm">登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
	<!-- 主要内容 -->
	<div class="container">
		<div id="mainItem">
			<!-- 左边卡片 -->
			<!-- 介绍 -->
			<div class="Card LeftItem introduction">
				<div class="media">
					<div class="media-left">
						<a href="#"> <img class="media-object img-circle"
							src="${pageContext.request.contextPath}/images/photo_test01.jpg" alt="...">
						</a>
					</div>
					<div class="media-body">
						<h2 class="media-heading">科普讨论</h2>
						...
					</div>
				</div>

			</div>
			
<div class="Card LeftItem TagButton">
	<ul class="nav nav-pills nav-justified">
	 <li role="presentation" class="active"><a href="#" id="a1">最新主题</a></li>
	 <li role="presentation"><a href="#"  id="a2">最热</a></li>
  <li role="presentation" ><a href="#" id="a3">最新回复</a></li>
 
  
</ul>


</div>
<div  class="LeftItem" >
<div id="editor"></div>
<div></div>
</div>

			<div id="con" >
			
			</div>

		
			<!-- 右边卡片 -->
			<div class="Card RightItem ">

				<div class="post">
				<button onclick="CreateEditor()">
				<span class="glyphicon glyphicon-pencil"> </span><strong>发帖</strong>
				</button>
					
				</div>
			</div>
			<div class="Card RightItem data">
				<button>
					<div>
						<div>总访问数</div>
						<div>21321421</div>
					</div>
				</button>
				<button class="rightButton">
					<div>
						<div>主题数</div>
						<div>421</div>
					</div>
				</button>
			</div>
			<div class="Card RightItem">
				<div class="positive">
					<strong>活跃用户</strong>
					<hr />
					<ul>
						<li><img class="img-circle"
							src="${pageContext.request.contextPath}/images/photo_test01.jpg" alt="...">名字在这
						</li>
						<li><img class="img-circle"
							src="${pageContext.request.contextPath}/images/photo_test01.jpg" alt="...">名字在这</li>
						<li><img class="img-circle"
							src="${pageContext.request.contextPath}/images/photo_test01.jpg" alt="...">名字在这</li>
					</ul>
				</div>
			</div>
			<div class="Card RightItem">
				<div class="hotForum">
					<strong>热门板块</strong>
					<hr />
					<ul>
						<li><p>
								<a href="${pageContext.request.contextPath}/view/science">科普讨论</a>
							</p></li>
						<li><p>
								<a href="#">摄影天地</a>
							</p></li>
						<li><p>
								<a href="#">电影宇宙</a>
							</p></li>
					</ul>
				</div>
			</div>
			<!-- /右边卡片 -->
		</div>
		<!-- /mainItem -->
	</div>
	<!-- /主要内容 -->

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>
	<script>

	
	
	 $(document).ready(function(){
         //页面加载的时候，内容框默认显示 a.html
         $('#con').load('${pageContext.request.contextPath}/view/science_theme');
         //单击 a 链接，加载 a.html
         $("#a1").click(function(){
             $('#con').load('${pageContext.request.contextPath}/view/science_theme');
             
         });
         //单击 b 链接，加载 b.html
         $("#a2").click(function(){
             $('#con').load('${pageContext.request.contextPath}/view/science_hot');
         });
         $("#a3").click(function(){
             $('#con').load('${pageContext.request.contextPath}/view/science_reply');
         });
     });
	 
	 $(".TagButton ul li").click(function(){
         $(".TagButton ul li").removeClass("active");
         $(this).addClass("active");
})

function CreateEditor(){
		  var E = window.wangEditor
	        var editor = new E('#editor')
		  var content = $("#editor").html();
	        // 或者 var editor = new E( document.getElementById('editor') )
		  if(content == null || content.length == 0){
			  editor.create();
		  }else{
			  editor.innerHtml="";
		  }
	        
		 
	 }
	</script>
	 
</body>
</html>