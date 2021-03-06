<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://www.mldn.cn/c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String deleteUrl = basePath + "pages/front/shopcar/ShopcarServletFront/delete?p=p";
    String updateUrl = basePath + "pages/front/shopcar/ShopcarServletFront/update";
    String ordersUrl = basePath + "pages/front/orders/OrdersServletFront/insert";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>微商城综合实战</title>
    <link type="text/css" rel="stylesheet" href="css/mldn.css">
    <script type="text/javascript" src="js/mldn.js"></script>
    <script type="text/javascript" src="js/shopcar.js"></script>
</head>
<body>
<jsp:include page="/pages/header.jsp"/>
<div class="mainDiv">
    <c:if test="${allGoods != null}" var="res">
        <h1>我的购物车</h1>

        <form action="<%=updateUrl%>" method="post">
            <table border="1" width="100%" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
                <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                    <td><input type="checkbox" onclick="checkboxSelect(this,'gid')"></td>
                    <td>图片</td>
                    <td>名称</td>
                    <td>价格</td>
                    <td>数量</td>
                    <td>总价</td>
                </tr>
                <c:forEach items="${allGoods}" var="goods">
                    <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                        <td><input type="checkbox" name="gid" id="gid" value="${goods.gid}"></td>
                        <td><img src="upload/goods/${goods.photo}" style="width: 50px"></td>
                        <td>${goods.title}</td>
                        <td><span id="price-${goods.gid}">${goods.price}</span></td>
                        <td>
                            <input type="button" value="-" onclick="subBut(${goods.gid})">
                            <input type="text" value="${allCars[goods.gid]}" name="${goods.gid}" id="${goods.gid}"
                                   size="5">
                            <input type="button" value="+" onclick="addBut(${goods.gid})">
                        </td>
                        <td>
                            <span id="cal-${goods.gid}"></span>
                            <script type="text/javascript">
                                calGoods(${goods.gid});
                            </script>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <input type="button" value="彻底删除" onclick="deleteAll('<%=deleteUrl%>','ids','gid')">
            <input type="submit" value="修改购买数量">
            <span id="result"></span>
            <a href="<%=ordersUrl%>" style="color: #00FF00">去下单</a>
        </form>
    </c:if>
</div>
<jsp:include page="/pages/footer.jsp"/>
</body>
</html>
