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
  	  <div style="float: right;"><button type="button" class="comment_button" data-toggle="modal" data-target="#deleteComfirm<%=i%>">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</button>
				</div>
				
       	<div>
       	<!--  -->
	  <h5><strong>主题：<a onclick="javascript:window.open('${pageContext.request.contextPath}/after/reading?uid=${uid}&tid=<%=thread.getId()%>','_blank')"><%=thread.getTitle() %></a></strong></h5>
	  </div>
       	<div>
								<img
									src="${pageContext.request.contextPath}/images/photo_test01.jpg"
									style="height: 28px; width: 28px;" class="img-circle"> <strong
									class="name" style="font-size: 12px;"><%=user.getNickname()%> &nbsp;&nbsp;(我)</strong>
								<span style="float: right; font-size: 13px;"><%=(String.valueOf(replyThread.getTime())).substring(0,19) %></span>
							</div>
							<div>
								<p><%=replyThread.getContent() %></p>
							</div>
                         
    
    </div>
    <hr>
        	<!-- 弹出框 -->	
			<div id="deleteComfirm<%=i %>" class="modal fade" tabindex="-1" role="dialog">
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
        <button  class="btn btn-primary" onclick="window.location='${pageContext.request.contextPath}/after/doDeleteReply?rid=<%=replyThread.getId() %>'">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- /弹出框 -->	
    
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