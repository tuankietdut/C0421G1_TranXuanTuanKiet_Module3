<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Product View</h1>
    <p><a href="/product">Back to menu</a></p>
    <table border="1">
        <tr>
            <td>Id của sản phẩm</td>
            <td>${viewProduct.getId()}</td>
        </tr>
        <tr>
            <td>Tên sản phẩm</td>
            <td>${viewProduct.getNameProduct()}</td>
        </tr>
        <tr>
            <td>Giá của sản phẩm</td>
            <td>${viewProduct.getPrice()}</td>
        </tr>
        <tr>
            <td>Mô tả của sản phẩm</td>
            <td>${viewProduct.getDescribe()}</td>
        </tr>
        <tr>
            <td>Nhà sản xuất</td>
            <td>${viewProduct.getMadeBy()}</td>
        </tr>
    </table>
</body>
</html>
