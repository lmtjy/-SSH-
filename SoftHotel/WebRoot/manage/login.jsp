<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title> 
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   
    <link rel="stylesheet" href="manage/css/pintuer.css">
    <link rel="stylesheet" href="manage/css/admin.css">
    <script src="js/jquery-1.11.3.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="js/wait.js"></script>
    <script>wait(1,1);</script>
    <!--<script src="js/management.js"></script>-->
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>
            <p id="alert"></p>
            <form  id="admin">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>大利来后台管理中心</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="name" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="ppwd"  id="pwd" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                </div>
                <div style="padding:30px;"><input type="button" class="button button-block bg-main text-big input-big "  value="登录" id="btn_login"></div>
            </div>
            </form>          
        </div>
    </div>
</div>
<script>
  
    	
        $("#btn_login").click(function(){
        	var name=$("input[name='name']").val();
        	var pwd=$(" input[name='ppwd']").val();
            $.ajax({
                url:'login_login',
                data:{name:name,pwd:pwd},
                success:function(data){
                var str=$(data).html();
                   var data= JSON.parse(str);         
                    if(data=="1"){ 
                    	/* var name="${uuname}";
                        alert(name); */
                        window.location ="login_login2 ";
                    }else{
                        alert("用户名或密码错误");
                    }
                }
            });
        });

 

</script>
</body>
</html>