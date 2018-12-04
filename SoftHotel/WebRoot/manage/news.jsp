<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
    <script src="manage/js/layer/layer.js"></script>
    <script src="manage/js/skip.js"></script>
    <script src="manage/js/new.js"></script>
    <!--<script src="js/management.js"></script>-->

</head>
<body style="background-color:#f2f9fd;"  >
<!--头部-->
<div id="header">

</div>
<script >
	var msg='${msg}';
	if(msg!=""){
		alert(msg);
	}
	function fenye(page) {
		var url = 'news/news_queryAll?page=' + page;
		location = url;
	}
	function addnews(chose){
		var url = 'news/news_beforeadd?chose=' + chose;
		location = url;
	}
</script>
<!--内容容器-->
<div class="admin">
    <div id="view">
        <form method="post" action="news/news_deleteMany">
            <div class="panel admin-panel">
                <div class="panel-head"><strong class="icon-reorder"> 全部菜单</strong></div>
                <div class="padding border-bottom">
                    <ul class="search">
                        <li>
                            <button type="button"  class="button border-green" id="checkall" ><span class="icon-check"></span> 全选</button>
                            <button type="submit" class="button border-red" onclick="DelSelect()" ><span class="icon-trash-o"></span> 批量删除</button>
                        </li>
                        <li class="rt">
                        	<!-- <a onclick="addnews(1)" class="button border-green " id="add" >添加主题</a> -->
                            <a onclick="addnews(2)" class="button border-green " id="add" >添加活动</a>
                            <a onclick="addnews(3)" class="button border-green " id="add" >修改招聘</a>
                        </li>
                    </ul>
                </div>
                <table class="table table-hover text-center" id="all_new">
                    <thead>
                        <tr >
                            <th width="120">ID</th>
                            <th>海报</th>
                            <th width="25%">标题</th>
                            <th>详情</th>
                            <th  width="100">内容分类</th>
                            <th width="120">发布时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>

                    <tbody>
                   	<s:set value="list" var="l"></s:set>
                   	<s:iterator value="list">
                    	<tr >
	                        <td><input type="checkbox" name="delMany" data-nid="<s:property value="newId"/>" value="<s:property value="newId"/>" />
	                            <s:property value="newId"/></td>
	                        <td class="fImg"><img src="<s:property value="newImg"/>" alt=""/></td>
	                        <td>
	                            <textarea><s:property value="newTitle"/></textarea>
	                        </td>
	                        <td>
	                            <textarea><s:property value="details"/></textarea>
	                        </td>
	                        <td><s:property value="newType"/></td>
	                        <td><s:property value="relTime"/></td>
	                        <td>
	                        	<div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="return del(<s:property value="newId"/>)"><span class="icon-trash-o"></span> 删除</a> </div>
	                        	<div class="button-group"> <a class="button border-green" href="javascript:void(0)" onclick="return update(<s:property value="newId"/>)"><span>&nbsp;&nbsp;</span> 修改 </a> </div>
	                        </td>
	                    </tr>
                   	</s:iterator>
                    </tbody>
                     <tfoot>
                         <tr>
                             <td colspan="8">
                                 <div class="pagelist">
                                 	<a onclick="fenye(1)">首页</a>
                                    <a onclick="fenye(${news.page }-1)">上一页</a>
                                    <div class="page">
                                    	<s:set value="news" var="n"></s:set>
                                    	<s:if test="#n.page < 2">
                                    		<a class="current">1</a>
                                    		<s:if test="#n.pagecount > 1">
	                                    		<a onclick="fenye(2)">2</a>
	                                    		<s:if test="#n.pagecount > 2">
	                                    			<a onclick="fenye(3)">3</a>
	                                    		</s:if>
                                    		</s:if>
                                    	</s:if>
                                    	<s:if test="#n.page > 1 && #n.page < #n.pagecount">
                                    		<a onclick="fenye(${news.page }-1)"><s:property value="news.page-1"/></a>
                                    		<a class="current">${news.page }</a>
                                    		<a onclick="fenye(${news.page }+1)"><s:property value="news.page+1"/></a>
                                   		</s:if>
                                   		<s:if test="#n.page == #n.pagecount">
                                    		<a onclick="fenye(${news.page }-2)"><s:property value="news.page-2"/></a>
                                    		<a onclick="fenye(${news.page }-1)"><s:property value="news.page-1"/></a>
                                   			<a class="current">${news.page }</a>
                                   		</s:if>
                                    </div>
                                    <a onclick="fenye(${news.page }+1)">下一页</a>
                                    <a onclick="fenye(${news.pagecount})">尾页</a>
                                 </div></td>
                         </tr>
                     </tfoot>

                </table>
            </div>
        </form>
        
        <script type="text/javascript">
	        var page = '${news.page }';
            function del(id){
                if(confirm("您确定要删除吗?")){
                	var url = 'news/news_delete?newId=' + id + '&&page=' + page;
            		location = url;
                }
            }
            function update(id){
               	var url = 'news/news_beforeupdate?newId=' + id + '&&page=' + page;
           		location = url;
            }

            $("#checkall").click(function(){
                $("input[name='delMany']").each(function(){
                    if (this.checked) {
                        this.checked = false;
                    }
                    else {
                        this.checked = true;
                    }
                });
            })

            function DelSelect(){
                var Checkbox=false;
               	var n = document.getElementsByName("delMany");
               	var nId = "";
                $("input[name='delMany']").each(function(){
                    if (this.checked==true) {
                        Checkbox=true;
                    }
                });
                if (Checkbox){
                	var t=confirm("您确认要删除选中的内容吗？");
                    if (t==false) return false;
                }else{
                    alert("请选择您要删除的内容!");
                    return false;
                };
            };
        </script>
    </div>
</div>
<div style="text-align:center;">
</div>
</body>
</html>

