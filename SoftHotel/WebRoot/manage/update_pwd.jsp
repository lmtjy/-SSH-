<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>大利来网络预订管理中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


    <link rel="stylesheet" href="manage/css/pintuer.css">
    <link rel="stylesheet" href="manage/css/admin.css">
    <link rel="stylesheet" href="manage/css/base.css">
    <script src="manage/js/jquery-1.11.3.js"></script>
    <script src="manage/js/skip.js"></script>
    <!--<script src="js/wait.js"></script>-->
    <!--<script src="js/management.js"></script>-->
    <!--<script>wait(1)</script>-->
</head>
<body style="background-color:#f2f9fd;"  >
<!--头部-->
<div id="header">

</div>

<!--内容容器-->
<div class="admin">
    <div id="view">
        <div class="panel admin-panel">
            <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>更改信息</strong></div>
            <div class="body-content">
                <form method="post" class="form-x" id="upadmin_form">
                    <div class="form-group">
                        <div class="label">
                            <label>管理员姓名：</label>
                        </div>
                        <div class="field">
                            <input type="text" class="input w50" value="${uuname }"  name="name"  id="base_name"  />
                            <div class="tips"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>请输入原始密码：</label>
                        </div>
                        <div class="field">
                            <input type="" class="input w50" value=""  id="base_pwd" name="pwd"  "/>
                            <div class="tips"></div>
                        </div>
                        <div class="msg"></div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label>请输入新密码：</label>
                        </div>
                        <div class="field">
                            <input type="password" class="input w50 " value="" id="new_pwd" disabled name="pwd1" data-validate="required:请输入" />
                            <div class="tips"></div>
                        </div>
                        <div class="msg"></div>
                    </div>
                    <div class="form-group">
                        <div class="label">
                            <label></label>
                        </div>
                        <div class="field">
                            <button class="button bg-main icon-check-square-o" type="button" id="update_admin" disabled> 修改信息</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div style="text-align:center;">

</div>
<script>
    $(document).ready(function(){
       var name= $("input[name='name']").val();
      // alert(name);
      
        //console.log($("#base_pwd"));
        $("#base_pwd").blur(function(){
        	 var pwd=$("#base_pwd").val();
            $.ajax({
                url:'admin_check',
                data:{name:name,pwd:pwd},
                success:function(data){
                	var str = $(data).html(); 
    				data = JSON.parse(str);
                   // alert(data);
                    if(data=="1"){
                        $("#base_pwd").css("disabled");
                        $("input[name='pwd1']").removeAttr("disabled");
                        $("#update_admin").removeAttr("disabled");
                        $("#base_pwd").next().html("");
                    }else{
                    	if(pwd){
                    		$("#base_pwd").next().html("初始密码输入有误,请重新输入");
                    	}    
                        $("input[name='pwd1']").attr("disabled","true");
                        $("#update_admin").attr("disabled","true");
                    }
                }
            });
        })
        $("#update_admin").click(function(){
        	//alert(name);
        	 var pwd= $("input[name='pwd1']").val();
          //alert(pwd);
            $.ajax({
                url:"updatepwd",
                data:{name:name,pwd:pwd},
                success:function(data){
                	var str = $(data).html(); 
    				data = JSON.parse(str);
                    if(data=="1"){                 
                        alert("修改成功");                     
                    }else if(data=="0"){
                        alert("修改失败");
                    }
                }
            })
        })
    })
</script>
</body>
</html>

