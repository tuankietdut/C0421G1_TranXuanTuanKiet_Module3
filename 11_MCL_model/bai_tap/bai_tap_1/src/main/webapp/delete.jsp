<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Delete Product</h1>
    <p><a href="/product">Back to menu</a></p>
    <form method="post">
        <h3>Are you sure?</h3>
        <table>
            <tr>
                <td>Name</td>
                <td>${product.getNameProduct()}</td>
            </tr>
            <tr>
                <td>Price</td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td>Describe</td>
                <td>${product.getDescribe()}</td>
            </tr>
            <tr>
                <td>Made by</td>
                <td>${product.getMadeBy()}</td>
            </tr>
            <tr>
                <td><a href="/product">Back to menu</a></td>
                <td><input type="submit" value="delete product"></td>
            </tr>
        </table>
    </form>
    <p style="color: darkseagreen">${message}</p>
</body>
</html>
