<%@page import="com.stars.entity.Thread"%>
<%@page import="com.stars.entity.User"%>
<%@page import="java.util.List"%>
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
       List<Thread> threads =  ( List<Thread>) request.getAttribute("threads");
      Thread thread= new Thread();
     User user = (User)request.getAttribute("user");
    for (int i = 0; i<threads.size() ; i++) {
	thread = threads.get(i);
	
%>

	<div class="Card  LeftItem">
					<div class="UserItem">
						<img
							src="${pageContext.request.contextPath}/images<%=user.getSrc() %>"
							alt="..." class="img-circle"><strong class="name"><%=user.getNickname() %></strong><span
							style="position: relative; left: 400px;"><%=(String.valueOf(thread.getTime())).substring(0,19) %></span>
					</div>

					<div class="ContentItem"
						onclick="javascript:window.open('${pageContext.request.contextPath}/after/reading?uid=<%=user.getId()%>&tid=<%=thread.getId()%>','_blank')">
						<strong class="title"><%=thread.getTitle() %></strong>
						
						<p></p>
						<button type="button" class="comment_button">
							<span class="glyphicon glyphicon-comment" aria-hidden="true"><%=thread.getReplyNum() %>条评论</span>
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="comment_button">
							<span class="glyphicon glyphicon-eye-open" aria-hidden="true"><%=thread.getViews() %>查看</span>
						</button>
					</div>
				</div>
				<%} %>
				
	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
				
</body>
</html>