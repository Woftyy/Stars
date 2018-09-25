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

	<div class="Card LeftItem">
					<div class="UserItem">
						<img
							src="${pageContext.request.contextPath}/images/photo_test01.jpg"
							alt="..." class="img-circle"><strong class="name">用户名</strong><span
							style="position: relative; left: 400px;">发表于</span>
					</div>

					<div class="ContentItem"
						onclick="javascript:window.open('${pageContext.request.contextPath}/after/reading?uid=&tid=%>','_blank')">
						<strong class="title">tittle</strong>
						<%-- 	<% System.out.println("alreadyuid="+user.getId()); 
					System.out.println("alreadyuname="+user.getName()); 
					%> --%>
						<p></p>
						<button type="button" class="comment_button">
							<span class="glyphicon glyphicon-comment" aria-hidden="true">18条评论</span>
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="comment_button">
							<span class="glyphicon glyphicon-eye-open" aria-hidden="true">15487查看</span>
						</button>
					</div>
				</div>
				
				
	<script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>
				
</body>
</html>