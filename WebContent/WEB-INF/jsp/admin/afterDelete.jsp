<%@page import="com.stars.entity.Thread"%>
<%@page import="com.stars.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ch">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>后台管理</title>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script>
            $(function() {
                $(".meun-item").click(function() {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
                $("#topAD").click(function() {
                    $("#topA").toggleClass(" glyphicon-triangle-right");
                    $("#topA").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topBD").click(function() {
                    $("#topB").toggleClass(" glyphicon-triangle-right");
                    $("#topB").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topCD").click(function() {
                    $("#topC").toggleClass(" glyphicon-triangle-right");
                    $("#topC").toggleClass(" glyphicon-triangle-bottom");
                });
                $(".toggle-btn").click(function() {
                    $("#leftMeun").toggleClass("show");
                    $("#rightContent").toggleClass("pd0px");
                })
            })
        </script>
        <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
<![endif]-->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.nouislider.css">
    </head>

    <body>
        <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <div class="leftMeun" id="leftMeun">
                <div id="logoDiv">
                    <p id="logoP"><a href="${pageContext.request.contextPath}">返回首页</a><span></span></p>
                </div>
             
             <!--     <div class="meun-title">账号管理</div>
                <div class="meun-item meun-item-active" href="#sour" aria-controls="sour" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/images/icon_source.png">资源管理</div>
                <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/images/icon_chara_grey.png">权限管理</div>
                <div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/images/icon_user_grey.png">用户管理</div>
                <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/images/icon_change_grey.png">修改密码</div>
                -->
                <div class="meun-title">后台管理</div>
                <div class="meun-item " href="#scho" aria-controls="scho" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/images/icon_house_grey.png">用户管理</div>
                <div class="meun-item meun-item-active" href="#thd" aria-controls="thd" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/images/icon_rule_grey.png">主题管理</div>
              <!--    <div class="meun-item" href="#stud" aria-controls="stud" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/images/icon_card_grey.png">管理</div>
                <div class="meun-item" href="#sitt" aria-controls="sitt" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/images/icon_char_grey.png">座位管理</div>-->
            </div>
            <!-- 右侧具体内容栏目 -->
            <div id="rightContent">
                <a class="toggle-btn" id="nimei">
                    <i class="glyphicon glyphicon-align-justify"></i>
                </a>
                <!-- Tab panes -->
                <div class="tab-content">
            <!--用户管理模块-->
            <div role="tabpanel" class="tab-pane " id="scho">

                <div class="check-div form-inline">
                    <div class="col-xs-3">
                      
                    </div>
                    <div class="col-lg-4 col-xs-5">
                        <input type="text" class=" form-control input-sm " placeholder="输入文字搜索">
                        <button class="btn btn-white btn-xs ">查 询 </button>
                    </div>
                  
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-1 ">
                            id
                        </div>
                        <div class="col-xs-2 ">
                           用户名
                        </div>
                        <div class="col-xs-2">
                            昵称
                        </div>
                        <div class="col-xs-2">
                            密码
                        </div>
                        <div class="col-xs-2">
                            email
                        </div>
                        <div class="col-xs-1">
                           性别
                        </div>
                         
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>
                    <% List<User> users = (List<User>) request.getAttribute("users");
                    User user = new User();
                    for (int i=0;i< users.size();i++){
                    	
                     user = users.get(i);
                    %>
                    <div class="tablebody">

                        <div class="row">
                                        <div class="col-xs-1 ">
                            <%=user.getId() %>
                        </div>
                        <div class="col-xs-2 ">
                          <%=user.getName() %>
                        </div>
                        <div class="col-xs-2">
                           <%=user.getNickname() %>
                        </div>
                        <div class="col-xs-2">
                         <%=user.getPassword() %>
                        </div>
                        <div class="col-xs-2">
                         <%=user.getEmail() %>
                        </div>
                        <div class="col-xs-1">
                         <%=user.getSex() %>
                        </div>
                            
                        <div class="col-xs-2">
                           <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseSchool<%=i %>">修改</button>
                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSchool<%=i %>">删除</button>
                        </div>
                           
                           
                        </div>

                    </div>
                    
                       <!--弹出删除用户警告窗口-->
                <div class="modal fade" id="deleteSchool<%=i%>" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该用户？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-danger">保 存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                                 <!--弹出修改用户窗口-->
                <div class="modal fade" id="reviseSchool<%=i %>" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">修改密码</label>
                                            <div class="col-xs-8 ">
                                                <input type="password" class="form-control input-sm duiqi" id="sName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">经度：</label>
                                            <div class="col-xs-8 ">
                                                <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">纬度：</label>
                                            <div class="col-xs-8 ">
                                                <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                            </div>
                                        </div>
                                       
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-green">保 存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                    
                 <%} %>
                </div>
                <!--页码块-->
                <footer class="footer">
                    <ul class="pagination">
                        <li>
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                            页
                        </li>
                        <li class="gray">
                            共20页
                        </li>
                        <li>
                            <i class="glyphicon glyphicon-menu-left">
                            </i>
                        </li>
                        <li>
                            <i class="glyphicon glyphicon-menu-right">
                            </i>
                        </li>
                    </ul>
                </footer>

                <!--弹出添加用户窗口-->
                <div class="modal fade" id="addSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加地区</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">地区名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">经度：</label>
                                            <div class="col-xs-8 ">
                                                <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">纬度：</label>
                                            <div class="col-xs-8 ">
                                                <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">简称：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-green">保 存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

   
             

            </div>
            <!-- 主题管理模块 -->
            
           <div role="tabpanel" class="tab-pane active" id="thd">

                <div class="check-div form-inline">
                    <div class="col-xs-3">
                      
                    </div>
                    <div class="col-lg-4 col-xs-5">
                        <input type="text" class=" form-control input-sm " placeholder="输入文字搜索">
                        <button class="btn btn-white btn-xs ">查 询 </button>
                    </div>
                  
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-1 ">
                            主题id
                        </div>
                        <div class="col-xs-1 ">
               版块id         
                        </div>
     
                       
                        <div class="col-xs-1">
                        用户id
                         </div>
                                 <div class="col-xs-3">
                        标题  
                        </div>
                        <div class="col-xs-1">
                        内容  
                        </div>
                        <div class="col-xs-3">
                          创建时间
                        </div>
                         
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>
                    <% 
                    	List<Thread> threads = (List<Thread>) request.getAttribute("threads");
                                            		Thread thread = new Thread();
                        for(int i=0; i<threads.size();i++){
                                           thread= threads.get(i); 			
                                            		
                    %>
                    <div class="tablebody">

                        <div class="row">
                                        <div class="col-xs-1 ">
                                       <%=thread.getId() %>
                        </div>
                        <div class="col-xs-1 ">
                        <%=thread.getFid() %>
                        </div>
                        <div class="col-xs-1">
                       <%=thread.getUid() %>
                        </div>
                        <div class="col-xs-3">
                         <input type="text" value="<%=thread.getTitle() %>" style="height:20px;width:250px;border: 0px;outline:none;">
                        </div>
                        <div class="col-xs-1">
                   <button class="btn btn-success btn-xs" onclick="javascript:window.open('${pageContext.request.contextPath}/admin/reading?uid=<%=thread.getUid()%>&tid=<%=thread.getId()%>','_blank')">查看</button> 
                        </div>
                        <div class="col-xs-3">
                        <%=(String.valueOf(thread.getTime())).substring(0, 19)%>
                        </div>
                            
                        <div class="col-xs-2">
                              <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteThread<%=i%>">删除</button>
                        </div>
                           
                           
                        </div>
       <!--弹出删除主题警告窗口-->
                <div class="modal fade" id="deleteThread<%=i%>" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该主题？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-danger" onclick="window.location='${pageContext.request.contextPath}/admin/AdminDeleteThread?tid=<%=thread.getId() %>'">确 定</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                    </div>
                    <%} %>
                
                    
                </div>
                <!--页码块-->
                <footer class="footer">
                    <ul class="pagination">
                        <li>
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                            页
                        </li>
                        <li class="gray">
                            共20页
                        </li>
                        <li>
                            <i class="glyphicon glyphicon-menu-left">
                            </i>
                        </li>
                        <li>
                            <i class="glyphicon glyphicon-menu-right">
                            </i>
                        </li>
                    </ul>
                </footer>

                <!--弹出添加用户窗口-->
                <div class="modal fade" id="addSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加地区</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">地区名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">经度：</label>
                                            <div class="col-xs-8 ">
                                                <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">纬度：</label>
                                            <div class="col-xs-8 ">
                                                <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">简称：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-green">保 存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

            	<div id="myModal" class="modal fade bs-example-modal-sm"
				tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<br>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;删除成功!&nbsp;&nbsp;</p>
						<br>
					</div>
				</div>
			</div>
          
        
        </div>
    </div>
</div>
<!-- 滑块js -->
<!--	<script type="text/javascript">
        scale = function(btn, bar, title, unit) {
                this.btn = document.getElementById(btn);
                this.bar = document.getElementById(bar);
                this.title = document.getElementById(title);
                this.step = this.bar.getElementsByTagName("div")[0];
                this.unit = unit;
                this.init();
        };
        scale.prototype = {
                init: function() {
                        var f = this,
                                g = document,
                                b = window,
                                m = Math;
                        f.btn.onmousedown = function(e) {
                                var x = (e || b.event).clientX;
                                var l = this.offsetLeft;
//						var max = f.bar.offsetWidth - this.offsetWidth;
                                var max = f.bar.offsetWidth-20 ;
                                g.onmousemove = function(e) {
                                        var thisX = (e || b.event).clientX;
                                        var to = m.min(max, m.max(-2, l + (thisX - x)));
                                        f.btn.style.left = to+ 'px';
                                        f.ondrag(m.round(m.max(0, to / max) * 100), to);
                                        b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
                                };
                                g.onmouseup = new Function('this.onmousemove=null');
                        };
                },
                ondrag: function(pos, x) {
                        this.step.style.width = Math.max(0, x) +2+ 'px';
                        this.title.innerHTML = pos / 10 + this.unit + "";
                }
        }
        new scale('btn0', 'bar0', 'title0', "分钟");
        new scale('btn1', 'bar1', 'title1', "分钟");
        new scale('btn2', 'bar2', 'title2', "天");
        new scale('btn3', 'bar3', 'title3', "次");
</script>
-->
<script src="${pageContext.request.contextPath}/js/jquery.nouislider.js"></script>

<!-- this page specific inline scripts -->
<script>
                                          function deleteThread(tid){
                                        	  $.ajax({
                                        			url:"${pageContext.request.contextPath}/admin/AdminDeleteThread",
                                    				type:"post",
                                    				data:{"tid":tid},//json数据格式的用户名从jsp传递给controller
                                    				dataType:"json",
                                    				async:false,//让ajax执行代码顺序同步
                                    				success:function(data){
                                    					
                                    				}
                                    				
                                          })
                                          $('#myModal').modal('show');
                           		      	   return false;
                                          }
</script>
</body>

</html>