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
						<li class="active"><a href="alreadyLogin.jsp">首页</a></li>
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
						<li><img src="${pageContext.request.contextPath}/images/photo_test01.jpg" alt="..." height="30px" width="30px" class="img-circle"></li>
						<li><a href="#" class="btn btn-link btn-sm"
							data-toggle="modal" data-target="#login_form">退出登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
<% System.out.print("用户id为"+request.getAttribute("uid")); %>
<div class="container">
<h2>编辑</h2>
<form method="post" action="${pageContext.request.contextPath}/after/editing/post">
<br>
<select class="form-control" name="forum" >
  <option>科普讨论</option>
  <option>摄影天地</option>
  <option>电影宇宙</option>
</select>
<br>
<input type="text" class="form-control"  name="title" placeholder="请输入标题" >
<br>
<div id="editor"></div>
<div style="display:none;"><textarea id="text" name="content" style="width:100%; height:200px;"></textarea></div>
<input type="text" style="display:none" name="uid" value="${uid}">
<br>
 <button type="submit" class="btn btn-default" >发布</button>
</form>
</div>



	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>
<script>

	  var E = window.wangEditor
      var editor = new E('#editor')
      // 或者 var editor = new E( document.getElementById('editor') )
	  var $text = $('#text')
      editor.customConfig.onchange = function (text) {
          // 监控变化，同步更新到 textarea
          $text.val(text)
      }
      editor.create()
      // 初始化 textarea 的值
      $text1.val(editor.txt.text())
      
	



</script>


</body>
</html>