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
<title>天上星河-注册</title>
<!-- 引入Bootstrap核心样式表文件 -->
<link href="${pageContext.request.contextPath}/weblib/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" type="text/css">

<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!-- 条件注释   1 让浏览器识别html5 2respond让低版本浏览器可以使用css3媒体查询-->
<!--[if lt IE 9]>
	      <script src="weblib/html5shiv/html5shiv.min.js"></script>  
	      <script src="weblib/respond/respond.min.js"></script>
	    <![endif]-->
	
</head>
<body >
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
						<li><a href="${pageContext.request.contextPath}/">首页</a></li>
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
						<li class="active"><a href="#" class="btn btn-link btn-sm">注册</a></li>
						<li><a href="${pageContext.request.contextPath}/login" class="btn btn-link btn-sm"
							>登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
	<div class="container">
		<div id="registerForm">
			<form action="${pageContext.request.contextPath}/register/do" method="post" >
				<table class="tb" align="center">
					<caption>注册</caption>
					<tr>
						<td><input type="text" class="form-control" name="name"
							placeholder="请输入用户名" id="name"  onclick="VoidCheck()" onblur="VoidCheck();checkname()">
							<label id="usermsg" >${msg}</label></td>
							<td></td>
					</tr>
					<tr>
						<td><input type="password" class="form-control"
							name="password" id="pw1" placeholder="请输入密码" onclick="VoidCheck()" onblur="VoidCheck()"   ></td>
							<td></td>
					</tr>
					<tr>
						<td>
						<input type="password" class="form-control" id="pw2"
							placeholder="请再次输入密码" onclick="VoidCheck()" onblur="VoidCheck()"   >
							<label id="warning1" ></label>
							</td>
					</tr>
					<tr>
						<td><select name="sex" class="form-control">
								<option name="sex" value="男" selected="selected">男</option>
								<option name="sex" value="女">女</option>
								<option name="sex" value="保密">保密</option>
						</select></td>
						<td></td>
					</tr>
					<tr>
						<td><input type="email" class="form-control" id="email"
							placeholder="Email" name="email"   onclick="VoidCheck()" onblur="VoidCheck()"></td>
					</tr>
					<tr>
						<td><div id="v_container" style="width: 200px;height: 50px;"></div></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" id="Icode"
							 name="code"  placeholder="请输入上方验证码"  onclick="VoidCheck()" onblur="VoidCheck()" ></td>
					</tr>
					
					<tr>
						<td><label id="warning2" ></label>
						<input type="submit" value="创建账号"  disabled="disabled"  id="create" class="btn btn-warning" ></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/register.js"></script>
	<script type="text/javascript">
	function checkname(){
		var f=false;
		//javascript所有的变量都是以var定义的
		//javascript的变量属于弱类型
		//获取用户输入的用户名
		var name = document.getElementById("name").value;
		//去除字符串两端空格
		name=name.trim();
		//判断是否为空
		if(name==""){
			document.getElementById("usermsg").innerHTML="用户名不能为空";
			document.getElementById("usermsg").style.display="show";
		}else if(name.length<1||name.length>16){
			document.getElementById("usermsg").innerHTML="用户名的长度为1-16位";
		}
		else{
			document.getElementById("usermsg").innerHTML="";
			//校验用户名是否存在
			//使用ajax异步校验用户名
			$.ajax({
				url:"${pageContext.request.contextPath}/register/checkName",
				type:"post",
				data:{"name":name},//json数据格式的用户名从jsp传递给controller
				dataType:"json",
				async:false,//让ajax执行代码顺序同步
				success:function(data){
					if(data.msg=="true"){
						document.getElementById("usermsg").style.display="show";
						document.getElementById("usermsg").innerHTML="用户名已存在";
					}else{
						document.getElementById("usermsg").style.display="show";
						document.getElementById("usermsg").innerHTML="用户名可用";
						f=true;
					}
				}
			});	
			
		}
		return f;
	}
	</script>
</body>
</html>