<%@page import="com.stars.entity.Thread"%>
<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心-主题编辑</title>
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
					<ul class="nav navbar-nav navbar-right hidden-sm">
						<li><a href="${pageContext.request.contextPath}/after/personalCenter"><img src="${pageContext.request.contextPath}/images/photo_test01.jpg" 
						alt="..." height="30px" width="30px" class="img-circle"></a></li>
						<li><a href="${pageContext.request.contextPath}" class="btn btn-link btn-sm"
							>退出登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
	<%!Thread thread; %>
<% System.out.print("用户id为"+request.getAttribute("uid")); 
thread = (Thread)request.getAttribute("thread") ;

%>

<div class="container">
<h2>编辑</h2>

<form method="post" action="${pageContext.request.contextPath}/after/privateEditing/post">
<br>
<select class="form-control" name="forum" >
  <option>科普讨论</option>
  <option>摄影天地</option>
  <option>电影宇宙</option>
</select>
<br>
<input type="text" class="form-control"  name="title" placeholder="请输入标题"  value="<%=thread.getTitle()%>">
<br>
<div id="editor"><%=thread.getContent()%></div>
<div style="display:none"><textarea id="text" name="content" style="width:100%; height:200px;"></textarea></div>
<input type="text" style="display:none" name="uid" value="${uid}">
<input type="hidden" name="tid" value="<%=thread.getId()%>">
<br>
 <button type="submit" class="btn btn-default" >确认修改</button>
</form>
</div>



	<script src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>
<script>

	  var E = window.wangEditor
      var editor = new E('#editor')
	
      // 或者 var editor = new E( document.getElementById('editor') )
	  var $text = $('#text')
	  editor.customConfig.uploadImgShowBase64 = true
      editor.customConfig.onchange = function (text) {
          // 监控变化，同步更新到 textarea
          $text.val(text)
      }
      editor.create()
      // 初始化 textarea 的值
      $text.val(editor.txt.text());
      
	
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