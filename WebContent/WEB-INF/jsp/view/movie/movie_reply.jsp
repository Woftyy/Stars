<%@page import="com.alibaba.druid.sql.visitor.functions.Substring"%>
<%@page import="com.stars.entity.Forum"%>
<%@page import="com.stars.entity.User"%>
<%@page import="com.stars.entity.Thread"%>
<%@page import="java.util.List"%>
<%@page import="com.stars.service.ThreadService"%>
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
	 List<Thread> threads = (List<Thread>) request.getAttribute("threads");
	List<Forum> forums = (List<Forum>) request.getAttribute("forums");
	List<User> users = (List<User>) request.getAttribute("users");
	User user = new User();
	Forum forum = new Forum();
	Thread thread= new Thread();
		for (int i = 0; i<threads.size(); i++) {
			thread = threads.get(i);
			forum=forums.get(i);
			user = users.get(i);
			%>
			<div class="Card LeftItem">
				<div class="UserItem">
					<img src="${pageContext.request.contextPath}/images<%=user.getSrc() %>" alt="..." class="img-circle"><strong
						class="name"><%=user.getNickname() %></strong>
				</div>
				<div class="ContentItem" onclick="window.location.href='${pageContext.request.contextPath}/login'">
					<strong class="title"><%=thread.getTitle()%></strong>
					<p>
				
					</p>
                   <button type="button" class="comment_button">
  <span class="glyphicon glyphicon-comment" aria-hidden="true"><%=thread.getReplyNum()%>条评论</span>
</button>
					<button type="button" class="comment_button">
  <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><%=thread.getViews()%>查看</span>
</button>
				</div>

			</div>
			<!-- /左边卡片 -->
			<%
				}
			%>

</body>
</html>