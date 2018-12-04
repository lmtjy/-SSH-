<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'foods.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/index.css" type="text/css" rel="Stylesheet" />
<link href="css/catering.css" type="text/css" rel="Stylesheet" />
<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.css">
<script src="js/jquery-1.11.3.js"></script>
<script src="js/intro.js"></script>
<script src="js/catering.js"></script>

</head>

<body>
<div id="cainter">
<div class="details">	
	<s:iterator value="list">
		<div>
			<img alt="" src="<s:property value="fimg" />">
			<div id="type_title">
				<s:property value="fname" />
			</div>
		</div>
	</s:iterator>
	</div>
	</div>
	<div id="pages">
	<tr align="center">
	 <td colspan="4">
		  第<s:property value="foodspage.page"/>/<s:property value="foodspage.totalPage"/>页     
		    <s:if test="foodspage.page!=1">
		       <a href="${pageContext.request.contextPath }/foods_queryByHQLPage.action?page=1">首页</a>|     
		       <a href="${pageContext.request.contextPath }/foods_queryByHQLPage.action?page=<s:property value="foodspage.page-1"/>">上一页</a>| 
		    </s:if>
		    <s:if test="foodspage.page!=foodspage.totalPage">
		       <a href="${pageContext.request.contextPath }/foods_queryByHQLPage.action?page=<s:property value="foodspage.page+1"/>">下一页</a>| 
		       <a href="${pageContext.request.contextPath }/foods_queryByHQLPage.action?page=<s:property value="foodspage.totalPage"/>">尾页</a>            
		    </s:if>
	 </td>
</tr>
</div>
</body>
</html>
