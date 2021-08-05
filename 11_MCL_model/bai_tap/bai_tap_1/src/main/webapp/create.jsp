<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Create new Product</h1>
    <p><a href="/product">Back to menu</a></p>
    <form method="post">
        <table>
            <tr>
                <td>Nhập id sản phẩm</td>
                <td><input type="text" name="idProduct"></td>
            </tr>
            <tr>
                <td>Nhập tên sản phẩm</td>
                <td><input type="text" name="nameProduct"></td>
            </tr>
            <tr>
                <td>Nhập giá sản phẩm</td>
                <td><input type="number" name="priceProduct"></td>
            </tr>
            <tr>
                <td>Nhập mô tả sản phẩm</td>
                <td><input type="text" name="desProduct"></td>
            </tr>
            <tr>
                <td>Nhập nhà phân phối</td>
                <td><input type="text" name="madeBy"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Create new Product"></td>
            </tr>
        </table>
    </form>
    <p style="color: darkseagreen">${message}</p>
</body>
</html>
