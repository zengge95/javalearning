<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://www.mldn.cn/c" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
  String registUrl = basePath + "pages/MemberServletFront/regist";
%>
<html>
<head>
  <base href="<%=basePath%>">
  <title>微商城综合实战</title>
  <link type="text/css" rel="stylesheet" href="css/mldn.css">
  <script type="text/javascript" src="js/mldn.js"></script>
  <script type="text/javascript" src="js/member.js"></script>
</head>
<body>
<jsp:include page="/pages/header.jsp"/>
<div class="mainDiv">
<form action="<%=registUrl%>" method="post" onsubmit="return validateRegist()">
  <table border="1" width="100%" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
    <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
      <td colspan="3">用户注册</td>
    </tr>
    <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
      <td style="width: 10%">用户ID：</td>
      <td style="width: 60%"><input type="text" name="mid" id="mid" class="init" onblur="validateMid()"></td>
      <td style="width: 30%"><span id="midMsg"></span></td>
    </tr>
    <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
      <td style="width: 10%">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
      <td style="width: 60%"><input type="password" name="password" id="password" class="init" onblur="validatePassword()"></td>
      <td style="width: 30%"><span id="passwordMsg"></span></td>
    </tr>
    <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
      <td colspan="3">
        <input type="submit" value="注册">
        <input type="reset" value="重置">
      </td>
    </tr>
  </table>
</form>
</div>
<jsp:include page="/pages/footer.jsp"/>
</body>
</html>
