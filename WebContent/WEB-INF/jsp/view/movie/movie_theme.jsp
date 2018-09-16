
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<!-- 设置当前HTML 文件字符编码 -->
<meta charset="utf-8">
<!-- 设置浏览器兼容性 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 视口，声明当前网页在移动浏览器中device-width根据设备宽度  最小缩放minimum-scale,最大缩放maximum-scale -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>Bootstrap 101 Template</title>
<!-- 引入Bootstrap核心样式表文件 -->
<link href="${pageContext.request.contextPath}/weblib/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/science.css" rel="stylesheet">
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!-- 条件注释   1 让浏览器识别html5 2respond让低版本浏览器可以使用css3媒体查询-->
<!--[if lt IE 9]>
	      <script src="weblib/html5shiv/html5shiv.min.js"></script>  
	      <script src="weblib/respond/respond.min.js"></script>
	    <![endif]-->


</head>
<body>
	<%
				for (int i = 0; i <= 4; i++) {
			%>
			<div class="Card LeftItem">
				<div class="UserItem">
					<img src="${pageContext.request.contextPath}/images/photo_test01.jpg" alt="..." class="img-circle"><strong
						class="name">用户名在这里</strong>
				</div>
				<div class="ContentItem">
					<strong class="title">这是标题</strong>
					<p>
						<%
							String s = "内容再循环对对对大幅度放单费三番四复身份度放单费三番四复度放单费三番四复度放单费三番" + "四复度放单费三番四复度放单费三番四复度放单费三番四复"
										+ "度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复"
										+ "度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复"
										+ "度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复"
										+ "度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复度放单费三番四复";
								if (s.length() <= 70) {
									out.println(s);
								} else {
									out.println(s.substring(0, 70) + "...");
								}
						%>
					</p>
                   <button type="button" class="comment_button">
  <span class="glyphicon glyphicon-comment" aria-hidden="true">18条新评论</span>
</button>
					<span><a href="#">显示全文</a></span>
				</div>

			</div>
			<!-- /左边卡片 -->
			<%
				}
			%>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>