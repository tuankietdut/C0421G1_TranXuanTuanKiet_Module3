
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Edit Product</h1>
    <p><a href="/product">Back to menu</a></p>
    <form method="post">
        <table>
            <tr>
                <td>Tên sản phẩm</td>
                <td><input type="text" name="nameProduct" value="${product.getNameProduct()}"></td>
            </tr>
            <tr>
                <td>Giá sản phẩm</td>
                <td><input type="number" name="priceProduct" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm</td>
                <td><input type="text" name="desProduct" value="${product.getDescribe()}"></td>
            </tr>
            <tr>
                <td>Nhà phân phối</td>
                <td><input type="text" name="madeBy" value="${product.getMadeBy()}"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Edit Product"></td>
            </tr>
        </table>
    </form>
    <p style="color: darkseagreen">${message}</p>
</body>
</html>
