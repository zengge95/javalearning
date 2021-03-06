<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://www.mldn.cn/c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String insertUrl = basePath + "pages/back/admin/goods/GoodsServletBack/insert";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>微商城综合实战</title>
    <link type="text/css" rel="stylesheet" href="css/mldn.css">
    <script type="text/javascript" src="js/mldn.js"></script>
    <script type="text/javascript" src="js/goods.js"></script>
    <style type="text/css">
        #preview, .img, img  {
            width:200px;
            height:200px;
        }
        #preview {
            border:1px solid #000;
        }
    </style>
    <script type="text/javascript">
        function preview(file) {
            var prevDiv = document.getElementById('preview');
            if (file.files && file.files[0]) {
                var reader = new FileReader();
                reader.onload = function(evt) {
                    prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
                }
                reader.readAsDataURL(file.files[0]);
            } else {
                prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
            }
        }
    </script>

</head>
<body>
<div class="mainDiv">
    <form action="<%=insertUrl%>" method="post" onsubmit="return validateGoods()" enctype="multipart/form-data">
        <table border="1" width="100%" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td colspan="4"><span class="title">增加商品信息</span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td style="width: 10%"><strong>商品名称:</strong></td>
                <td style="width: 30%"><input type="text" name="title" id="title" class="init" onblur="validateTitle()">
                </td>
                <td style="width: 40%"><span id="titleMsg"></span></td>
                <td style="width: 20%" rowspan="6">
                    <div id="preview"></div>
                </td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td><strong>所属分类:</strong></td>
                <td>
                    <c:if test="${allItems != null}" var="res">
                        <select name="iid" id="iid">
                            <c:forEach items="${allItems}" var="item">
                                <option value="${item.iid}">${item.title}</option>
                            </c:forEach>
                        </select>
                    </c:if>
                </td>
                <td><span id="iidMsg"></span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td><strong>商品价格:</strong></td>
                <td><input type="text" name="price" id="price" class="init" onblur="validatePrice()">
                </td>
                <td><span id="priceMsg"></span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td><strong>库存数量:</strong></td>
                <td><input type="text" name="amount" id="amount" class="init"
                           onblur="validateAmount()"></td>
                <td><span id="amountMsg"></span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td><strong>商品图片:</strong></td>
                <td><input type="file" name="photo" id="photo" class="init" onchange="preview(this)" onblur="validatePhoto()">
                </td>
                <td><span id="photoMsg"></span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td><strong>发布状态:</strong></td>
                <td>
                    <input type="radio" name="status" id="status" value="0" checked>下架
                    <input type="radio" name="status" id="status" value="1">上架
                </td>
                <td><span id="statusMsg"></span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td><strong>商品描述:</strong></td>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td colspan="4">
                    <textarea name="note" id="note" cols="80" rows="5"></textarea>
                </td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'#F2F2F2')">
                <td colspan="4">
                    <input type="submit" value="发布">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
