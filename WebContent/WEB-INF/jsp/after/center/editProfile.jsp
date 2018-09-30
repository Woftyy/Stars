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
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weblib/uploadify/uploadify.css">
</head>
<body>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <table class="stable tp0" style="height:500px;width:500px" cellSpacing="0" cellPadding="0" border="0">
            <tr>
                <td width="15%" align="left" colspan="4" style="padding-left: 158px">
  
                    <input type="hidden" id="fileSize" value="0" />
  
                    <div id="custom-queue"></div> 附件：<input id="uploadify" type="file"
                    name="Filedata" />
                </td>
            </tr>
        </table>
                                    
                                    
                                    <script
		src="${pageContext.request.contextPath}/weblib/jquery/jquery.js"></script>
		                              <script
		src="${pageContext.request.contextPath}/weblib/uploadify/jquery.uploadify.js"></script>
		  <script
		src="${pageContext.request.contextPath}/weblib/uploadify/swfobject.js"></script>
	<script
		src="${pageContext.request.contextPath}/weblib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
                              
      <script>
      $(document).ready(function(){
    	   
          $(document).ready(function () {
                $("#uploadify").uploadify({
                    'uploader': '${pageContext.request.contextPath}/weblib/uploadify/uploadify.swf',
                    'script': '${pageContext.request.contextPath}/up_tx',
                    'cancelImg': '${pageContext.request.contextPath}/weblib/uploadify/cancel.png',
                    'folder': 'upload',
                    'queueID' : 'custom-queue',
                    'auto':true,
                    'multi':true,
                    'fileDataName':'Filedata',
                     'onCancel' : function(file) { 
                    },
                    'onUploadError' : function(file, errorCode, errorMsg, errorString) { 
                        alert(456); 
                    }
                });
            });
      });
</script>
</body>
</html>