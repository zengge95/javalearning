<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
	  <table>
	  	<s:iterator value="slist" var = "c">
		  <tr>
		  	<td>${c.student.sid }</td>
			<td>${c.student.sname}</td>	 		
			<td>${c.classtype.cname}</td>
			<td><a href="Student_findStudentById.action?student.sid=${c.student.sid }">修改</a></td>
		  </tr>
	  	</s:iterator>
  </table>
  	<s:debug/>
  </body>
</html>
