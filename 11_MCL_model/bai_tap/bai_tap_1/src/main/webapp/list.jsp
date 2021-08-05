<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Product</h1>
    <p>
        <a href="/product?action=create">Create new product</a>
    </p>
    <table border="1">
        <tr>
            <td>Id products</td>
            <td>Name products</td>
            <td>Price Products</td>
            <td>Edit</td>
            <td>Delete</td>
        </tr>
        <c:forEach items="${product}" var="productObject">
            <tr>
                <td><a href="/product?action=view&id=${productObject.getId()}">${productObject.getId()}</a></td>
                <td>${productObject.getNameProduct()}</td>
                <td>${productObject.getPrice()}</td>
                <td><a href="/product?action=edit&id=${productObject.getId()}">Edit</a></td>
                <td><a href="/product?action=delete&id=${productObject.getId()}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
