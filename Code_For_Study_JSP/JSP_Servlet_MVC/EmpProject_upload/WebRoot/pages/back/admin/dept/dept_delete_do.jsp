<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.mldn.oracle.vo.*"%>
<%@ page import="cn.mldn.oracle.factory.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%	// 解决POST请求的乱码
	request.setCharacterEncoding("UTF-8") ;
%>
<html>
<head>
<title>雇员管理程序</title>
</head>

<body>
<%	// 接收要删除数据的编号 
	int deptno = Integer.parseInt(request.getParameter("deptno")) ;
%>
<%
	String msg = "部门信息删除失败！" ;
	if (ServiceBackFactory.getIDeptServiceBackInstance().delete(deptno)) {
		msg = "部门信息删除成功！" ;
	}
%>
<script type="text/javascript">
	alert("<%=msg%>") ;
	window.location = "<%=basePath%>/pages/back/admin/dept/dept_list.jsp" ;
</script>
</body>
</html>
