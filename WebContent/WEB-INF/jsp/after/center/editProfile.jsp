<%@page import="com.stars.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<link
	href="${pageContext.request.contextPath}/weblib/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/alreadyLogin.css"
	type="text/css">
<link href="${pageContext.request.contextPath}/css/editProfile.css"
	rel="stylesheet">

</head>
<body>
<%   User user = (User) request.getAttribute("user"); %>
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
								src="${pageContext.request.contextPath}/images<%=user.getSrc() %>"
								alt="..." height="30px" width="30px" class="img-circle"></a></li>
						<li><a href="${pageContext.request.contextPath}" class="btn btn-link btn-sm"
							>退出登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
	<div class="container">
		<div class="Card ">
<form action="${pageContext.request.contextPath}/changeProfile"   enctype="multipart/form-data" method="post" >
			<div class="ProfileHeader-main">
				<div class="UserAvatarEditor ProfileHeader-avatar">
			
					<div class="UserAvatar">
						<img
								src="${pageContext.request.contextPath}/images<%=user.getSrc() %>"
								alt="..." height="160px" width="160px" class="img-circle">
					</div>
					<label class="UploadPicture-wrapper">
					
					<input id="fileInput" type="file"  name="file"
						accept="image/png,image/jpeg" class="UploadPicture-input" >
					<div class="Mask UserAvatarEditor-mask">
							<div
								class="Mask-mask Mask-mask--black UserAvatarEditor-maskInner">
								
								</div>
							<div class="Mask-content">
								<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
								<div class="UserAvatarEditor-maskInnerText">修改我的头像</div>
							</div>
						</div>
						</label>
				
				</div>
				
				<div class="ProfileHeader-content">
					<div class="ProfileEdit-fields">
					
						<div class="Field">
							<span class="Field-label">用户名</span>
							<div class="Field-content">
						<span><%=user.getName() %></span>
							</div>
						</div>
						<div class="Field">
							<span class="Field-label">昵称</span>
							<div class="Field-content">
								<input type="text" value="<%=user.getNickname() %>" name="nickname"style="border:none;">
							</div>
						</div>
						<div class="Field">
							<span class="Field-label">性别</span>
							<div class="Field-content">
							 <input type="hidden" id ="sex" value="<%=user.getSex()%>"/>
								<select id="refundReason" name="sex" class="form-control"  >
								<option value="男" >男</option>
								<option  value="女">女</option>
								<option  value="保密">保密</option>
						</select>
							</div>
						</div>
						<div class="Field">
							<span class="Field-label">email</span>
							<div class="Field-content">
								<input type="email" value="<%=user.getEmail() %>" name="email"style="border:none;">
							</div>
						</div>
						<br>
			<div>
				<button  class="btn btn-default"type="submit" aria-label="Left Align">
  <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true">保存</span>
</button>
				
				</div>
				
				
					</div>
				</div>
				<!-- /ProfileHeader-content -->
			</div>
			<!-- / ProfileHeader-main -->
</form>
		</div>
		<!-- /card -->

	</div>
		<!-- 弹出框 -->	
			<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">上传图片</h4>
      </div>
      <div class="modal-body">
      <p>确认更改？</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button  class="btn btn-primary" onclick="">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- /弹出框 -->
	
	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

	<script>

	
	  
	  
	//  $('#fileInput').on('change',function(){
		//  $('#myModal').modal('show');
	 // })
	 
		$(document).ready(function(){  
     var key=$("#sex").val();
     //根据值让option选中 
     $("#refundReason option[value='"+key+"']").attr("selected","selected"); 
}); 


		 
	</script>

</body>
</html>