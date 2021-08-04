<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<table>
    <tr><h1>Danh sách khách hàng</h1></tr>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${productList}" var="productObj">
        <tr>
            <td><c:out value="${productObj.nameProduct}"></c:out></td>
            <td><c:out value="${productObj.dateOfBirth}"></c:out></td>
            <td><c:out value="${productObj.address}"></c:out></td>
            <td><img src="<c:out value="${productObj.linkImage}"></c:out>" width="30" alt=""></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
