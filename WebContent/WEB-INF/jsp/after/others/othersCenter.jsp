<%@page import="com.stars.entity.User"%>
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
<%
      User LoginUser = (User) request.getAttribute("LoginUser");
  


%>
	<!-- 头部区域 -->
	<header id="header">
		<!-- <div class="topbar hidden-sm hidden-xs"> -->
		<nav class="navbar navbar-itcast navbar-static-top" 
			>
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
								src="${pageContext.request.contextPath}/images<%=LoginUser.getSrc() %>"
								alt="..." height="30px" width="30px" class="img-circle"></a></li>
						<li><a href="#" class="btn btn-link btn-sm"
							data-toggle="modal" data-target="#login_form">退出登录</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- /头部区域 -->
	<%
	User user = (User)request.getAttribute("user");
	
	
	%>
	<div class="container">
		<!-- mainItem -->
		<div id="mainItem">
			<!-- top card -->
			<div class="top Card" style="height: 100%;">

				<div
					style="padding-top: 40px; padding-left: 100px; padding-right: 30px;">
					<img
						src="${pageContext.request.contextPath}/images/photo_test01.jpg"
						alt="..." height="120px" width="120px" class="img-circle"> <strong
						style="padding-left: 20px; font-size: 23px;"><%=user.getNickname() %></strong>
				</div>
                 <div class="panel" style=""> 
  
     <div id="collapseOne" class="panel-collapse collapse"> 
     <div class="panel-body"> 
         <div>
         <table style="position:relative;left:250px;width:500px;padding:20px;">
         <tr style="">
         <td style="width:50px;padding-bottom:20px;"><strong>性别</strong></td>
           <td style="width:100px;font-color:grey;padding-bottom:20px;font-size:15px;"><%=user.getSex() %></td>
         </tr>
           <tr>
         <td style="width:50px;"><strong>email</strong></td>
           <td style="width:100px;font-color:grey;"><%=user.getEmail() %></td>
         </tr>
         </table>
         </div>
     </div> 
     </div> 
        <div class="panel-heading" style="position:relative;left:500px;"> 
     <a data-toggle="collapse" data-parent="#accordion"  
        href="#collapseOne" class="myCollapse" onclick="changeSpan()"> 
                             <span id="change" class="glyphicon glyphicon-chevron-down" aria-hidden="true">点击查看资料 </span> 
     </a> 
     </div> 
     </div>

			</div>
			<!-- /top card -->
			<!-- LeftItemContainer -->
			<div class="LeftItemContainer">

				<div class="Card LeftItem ">
					<ol class="breadcrumb">
						<li class="active"><a href="#" id="a1">发布</a></li>
						<li><a href="#" id="a2"></a></li>
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
					<div class="hotForum">
						<strong>热门板块</strong>
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
         $('#con').load('${pageContext.request.contextPath}/after/others/posts');
         //单击 a 链接，加载 a.html
         $("#a1").click(function(){
             $('#con').load('${pageContext.request.contextPath}/after/others/posts');
             
         });
         //单击 b 链接，加载 b.html
         $("#a2").click(function(){
             $('#con').load('${pageContext.request.contextPath}/after/others/comments');
         });
       
     });
	 
	 $(function () { 
		    //修复collapse不能正常折叠的问题 
		    $(".myCollapse").click(function () {// .myCollapse 根据实际情况 
		        var itemHref = $(this).attr("href"); 
		        var itemClass = $(itemHref).attr("class"); 
		        if (itemClass === "panel-collapse collapse") { 
		            $(itemHref).attr("class", "panel-collapse collapse in").css("height", "auto"); 
		        } else { 
		            $(itemHref).attr("class", "panel-collapse collapse").css("height", "0px"); 
		        } 
		        return false;//停止运行bootstrap自带的函数 
		    }); 
		}) 
	
		function changeSpan(){
		 var itemClass = $("#change").attr("class");
		 var itemHtml= $("#change").html();
		 if(itemClass=="glyphicon glyphicon-chevron-down"){
			 $("#change").attr("class","glyphicon glyphicon-chevron-up")
			 $("#change").html("点击收起");
		 }else{
			 $("#change").attr("class","glyphicon glyphicon-chevron-down")
			 $("#change").html("点击查看资料");
		 }
		 
	 }
	</script>
	

</body>
</html>