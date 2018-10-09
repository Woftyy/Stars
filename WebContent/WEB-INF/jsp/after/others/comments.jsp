<%@page import="com.stars.entity.User"%>
<%@page import="com.stars.entity.Thread"%>
<%@page import="com.stars.entity.ReplyThread"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div class="Card LeftItem" id="cardItem">
    
    <% 
      List<ReplyThread> replyThreads = ( List<ReplyThread>)request.getAttribute("replyfromUidLists");
    List<Thread> threads =( List<Thread>) request.getAttribute("whereFromThreads");
    User user=(User)request.getAttribute("user");
    Thread thread = new Thread();
    ReplyThread replyThread = new ReplyThread();
        for(int i=replyThreads.size()-1;i>=0;i--){
        	replyThread =replyThreads.get(i);
        	thread = threads.get(i);
    %>
    <div class="item" >
  	
       	<div>
       	<!--  -->
	  <h5><strong>所在主题：<a onclick="javascript:window.open('${pageContext.request.contextPath}/after/reading?uid=${uid}&tid=<%=thread.getId()%>','_blank')"><%=thread.getTitle() %></a></strong></h5>
	  </div>
       	<div>
								<img
									src="${pageContext.request.contextPath}/images<%=user.getSrc() %>"
									style="height: 28px; width: 28px;" class="img-circle"> <strong
									class="name" style="font-size: 12px;"><%=user.getNickname()%> </strong>
								<span style="float: right; font-size: 13px;"><%=(String.valueOf(replyThread.getTime())).substring(0,19) %></span>
							</div>
							<div>
								<p><%=replyThread.getContent() %></p>
							</div>
    </div>
    <hr>
   	
    
    <% } %>
    

    
    
    </div>


<script>

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