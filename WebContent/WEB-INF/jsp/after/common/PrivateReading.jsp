<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.stars.service.impl.UserServiceImpl"%>
<%@page import="com.stars.service.UserService"%>
<%@page import="com.stars.entity.ReplyThread"%>
<%@page import="java.util.List"%>
<%@page import="com.stars.entity.Thread"%>
<%@page import="com.stars.entity.User"%>
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
<%User user = (User) request.getAttribute("user"); %>
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
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Search for..."> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button">搜索</button>
								</span>
							</div> <!-- /input-group -->
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right hidden-sm">
						<li><a
							href="${pageContext.request.contextPath}/after/personalCenter"><img
								src="${pageContext.request.contextPath}/images<%=user.getSrc() %>"
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
			<!--  Top -->
			<%!int uid;%>
			<%
				uid = (int) request.getSession().getAttribute("uid");
				
				User userReply = new User();
				UserService userService = new UserServiceImpl();
				Thread thread = (Thread) request.getAttribute("thread");
				ReplyThread replyThread = new ReplyThread();
				List<ReplyThread> replyThreads = (List<ReplyThread>) request.getAttribute("replyThreads");
				List<User> users = (List<User>) request.getAttribute("users");
				String needToBeEditing= thread.getContent();
			%>
			<div class="Top Card" style="padding: 16px 20px;">
				<div>
					&nbsp;&nbsp;&nbsp;
					<h2><%=thread.getTitle()%></h2>
				</div>
				<br>
				<button type="button" class="comment_button">
					<span class="glyphicon glyphicon-comment" aria-hidden="true"><%=thread.getReplyNum()%>条评论</span>
				</button>
				<button type="button" class="comment_button">
					<span class="glyphicon glyphicon-eye-open" aria-hidden="true"><%=thread.getViews()%>查看</span>
				</button>
				<button type="button" class="comment_button" 
				onclick="window.location='${pageContext.request.contextPath}/after/privateEditing?uid=${uid}&tid=<%=thread.getId()%> '">
					<span class="glyphicon glyphicon-edit" aria-hidden="true"><%=(String.valueOf(thread.getTime())).substring(0, 19)%></span>
				</button>
				<button type="button" class="comment_button" data-toggle="modal" data-target="#delelteComfirm">
					<span class="glyphicon glyphicon-remove" aria-hidden="true">删除</span>
				</button>
			</div>
			
		<!-- 弹出框 -->	
			<div id="delelteComfirm" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">警告</h4>
      </div>
      <div class="modal-body">
        <p>确定删除吗？</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button  class="btn btn-primary" onclick="window.location='${pageContext.request.contextPath}/after/doDeleteThread?tid=<%=thread.getId() %>'">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- /弹出框 -->	
			<!--  /Top -->
			<div class="LeftItemContainer">

				<div class="Card LeftItem">
					<div class="UserItem">
						<img
							src="${pageContext.request.contextPath}/images<%=user.getSrc() %>"
							alt="..." class="img-circle"><strong class="name"><%=user.getNickname()%></strong>
					</div>
					<div class="contents">
						<%=thread.getContent()%>
					</div>
				</div>
				<div class="reviews Card LeftItem">
					<div class="ReviewList" id="ReviewList">
						<strong>评论列表</strong>
						<hr>
						<%
							for (int i = 0; i < replyThreads.size(); i++) {
								replyThread = replyThreads.get(i);
								userReply = users.get(i);
						%>
						<div class="ReviewItem" style="">
							<div>
								<img
									src="${pageContext.request.contextPath}/images<%=userReply.getSrc() %>"
									style="height: 28px; width: 28px;" class="img-circle"> <strong
									class="name" style="font-size: 12px;"><a href="${pageContext.request.contextPath}/after/othersCenter?otherUid=<%=userReply.getId()%>"><%=userReply.getNickname()%></a></strong>
								<span style="float: right; font-size: 13px;"><%=(String.valueOf(replyThread.getTime())).substring(0, 19)%></span>
							</div>
							<div>
								<p><%=replyThread.getContent()%></p>
							</div>
							<div>
								<input type="hidden" value="<%=replyThread.getId()%>"
									id="replyId<%=i%>"> <input type="hidden" value="0"
									id="countId<%=i%>">
							<button type="button" class="btn btn-default btn-sm"
									style="border: 0;" onclick="doThumb(<%=i%>)">
									<span id="num<%=i%>" class="glyphicon glyphicon-thumbs-up"
										aria-hidden="true"><%=replyThread.getNum()%></span>
								</button>
								<button type="button" class="btn btn-default btn-sm"
									style="border: 0;">
									<span class="glyphicon glyphicon-share-alt" aria-hidden="true"
										data-toggle="collapse" data-target="#collapseExample<%=i%>"
										aria-expanded="false" aria-controls="collapseExample">回复</span>
								</button>
								<div class="collapse" id="collapseExample<%=i%>">
									<div class="well" style="padding: 0px;">
										<form id="toReplyUser<%=i%>">
											<div class="input-group">
												<input type="hidden" name="tid" value="<%=thread.getId()%>"> 
												<input type="hidden" name="toUid" value="<%=replyThread.getFromUid()%>"> 
												
												<input type="text"
													name="content" class="form-control" placeholder="回复内容">
												<span class="input-group-btn">
													<button class="btn btn-default" data-toggle="modal"
														data-target="myModal1" onclick="toReplyUser(<%=i%>)" id="Button2">回复</button>
												</span>
											</div>
											<!-- /input-group -->
										</form>
									</div>
								</div>

							</div>

						</div>
						<hr>
						<%
							}
						%>
						
						<%  	
						
						List<ReplyThread> replyUserList = (List<ReplyThread>) request.getAttribute("replyUserList"); 
						List<User> replyUsers = (List<User>) request.getAttribute("replyUsers");
						List<User> beRepliedUsers = (List<User>) request.getAttribute("beRepliedUsers");
						User fromUser = new User();
						       User toUser = new User();
						       ReplyThread replyUser = new ReplyThread();
						
						%>
							<%
							for (int i = 0; i < replyUserList.size(); i++) {
								replyUser = replyUserList.get(i);
								fromUser = replyUsers.get(i);
								toUser=beRepliedUsers.get(i);
						%>
								<!-- 回复用户的Item -->
						<div class="ReplyUserItem">
							<div>
								<img
									src="${pageContext.request.contextPath}/images<%=fromUser.getSrc() %>"
									style="height: 28px; width: 28px;" class="img-circle"> <strong
									class="name" style="font-size: 12px;"><a href="${pageContext.request.contextPath}/after/othersCenter?otherUid=<%=fromUser.getId()%>">
									<%=fromUser.getNickname()%></a>
									&nbsp;&nbsp;回复&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/after/othersCenter?otherUid=<%=toUser.getId()%>"><%=toUser.getNickname()%></a></strong> <span
									style="float: right; font-size: 13px;"><%=(String.valueOf(replyUser.getTime())).substring(0, 19) %></span>
							</div>
							<div>
								<p><%=replyUser.getContent() %></p>
							</div>
							<div>
								<input type="hidden" value="<%=replyUser.getId()%>"
									id="replyId<%=i+10000%>"> <input type="hidden" value="0"
									id="countId<%=i+10000%>">
								<button type="button" class="btn btn-default btn-sm"
									style="border: 0;" onclick="doThumb(<%=i+10000%>)">
									<span id="num<%=i+10000%>" class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><%=replyUser.getNum() %></span>
								</button>
								<button type="button" class="btn btn-default btn-sm"
									style="border: 0;" data-toggle="collapse" data-target="#collapseExample<%=i+10000%>" aria-expanded="false" aria-controls="collapseExample">
									<span class="glyphicon glyphicon-share-alt" aria-hidden="true">回复</span>
								</button>
<div class="collapse" id="collapseExample<%=i+10000%>">
  <div class="well" style="padding: 0px; ">
  	<form id="toReplyUser2<%=i+10000%>">
						<div class="input-group">
							<input type="hidden" name="tid" value="<%=thread.getId()%>"> 
												<input type="hidden" name="toUid" value="<%=replyUser.getFromUid()%>"> 
								<input type="text"
								name="content" class="form-control" placeholder="回复内容">
							<span class="input-group-btn">
								<button class="btn btn-default" data-toggle="modal"
									data-target="#myModal1" onclick="toReplyUser2(<%=i+10000%>)" id="Button2">回复</button>
							</span>
						</div>
						<!-- /input-group -->
					</form>
  </div>
</div>
							</div>
						</div>
						<hr>
						<!--/ 回复用户的Item -->
						<%} %>
					</div>
					<form id="submitRequest">
						<div class="input-group">
							<input type="hidden" name="tid" value="<%=thread.getId()%>">
							<input type="hidden" id="Window_OffsetY" name="Window_OffsetY"
								value="0"> <input type="hidden" id="Window_OffsetX"
								name="Window_OffsetX" value="0"> <input type="text"
								name="content" class="form-control" placeholder="写下你的评论">
							<span class="input-group-btn">
								<button class="btn btn-default" data-toggle="modal"
									data-target="#myModal" onclick="toSubmit()" id="Button1">评论</button>
							</span>
						</div>
						<!-- /input-group -->
					</form>
				</div>
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

			<div id="myModal" class="modal fade bs-example-modal-sm"
				tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<br>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;评论成功!&nbsp;&nbsp;</p>
						<br>
					</div>
				</div>
			</div>
				<div id="myModal1" class="modal fade bs-example-modal-sm"
				tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<br>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;回复成功!&nbsp;&nbsp;</p>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.form.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script>

    function toSubmit(){
        //这里面可以做表单提交前的验证判断
    	 $('#submitRequest').submit(function() {
      	   $(this).ajaxSubmit( {
      	      url : "${pageContext.request.contextPath}/after/reading/doReply ",
      	      success : function() {
      	    	  location.reload(true);
      	    	
      	      }
      	   });
      	 $('#myModal').modal('show');
      	   return false;
      	   });
    }
    
    function toReplyUser(i){
        //这里面可以做表单提交前的验证判断
    	 $('#toReplyUser'+i).submit(function() {
      	   $(this).ajaxSubmit( {
      	      url : "${pageContext.request.contextPath}/after/reading/doReplyUser ",
      	      success : function() {
      	    	  location.reload(true);
      	    	
      	      }
      	   });
      	 $('#myModal1').modal('show');
      	   return false;
      	   });
    }
    function toReplyUser2(i){
        //这里面可以做表单提交前的验证判断
    	 $('#toReplyUser2'+i).submit(function() {
      	   $(this).ajaxSubmit( {
      	      url : "${pageContext.request.contextPath}/after/reading/doReplyUser ",
      	      success : function() {
      	    	  location.reload(true);
      	    	
      	      }
      	   });
      	 $('#myModal1').modal('show');
      	   return false;
      	   });
    }

    function doThumb(i){
    	var replayId= $('#replyId'+i).val();
    	var num= parseInt($('#num'+i).html());
        var countId = $('#countId'+i).val();
    	$.ajax({
			url:"${pageContext.request.contextPath}/after/doThumb?uid=<%=uid%>&rid="+replayId,
			type:"get",
			async:false,//让ajax执行代码顺序同步
			success:function(data){
				
				if(countId==1){
					$("#num"+i).html(num-1)
					$('#countId'+i).val("0");
				}else{
					$("#num"+i).html(num+1)
					$('#countId'+i).val("1");
				}
				
				}
		});
    }
  function toDelete(){
	  
	  $(this).ajaxSubmit( {
  	      url : "${pageContext.request.contextPath}/after/doDeleteThread?tid=<%=thread.getId()%> ",
  	      success : function() {
  	    	  
  	      }
  	   });
  }

   
</script>
</body>
</html>