<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Create Customer</h1>
<form action="/customer" method="post">
    <input type="hidden" name="action" value="create">
    <table>

        <tr>
            <td>Name:</td>
            <td>
                <input type="text" name="nameCustomer">
            </td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td>
                <input type="date" name="birthDay">
            </td>
        </tr>
        <tr>
            <td>Id_card:</td>
            <td>
                <input type="text" name="idCard">
            </td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>
                <select name="gender">
                    <option value="0">Nam</option>
                    <option value="1">Nữ</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td>
                <input type="text" name="phone">
            </td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>
                <input type="text" name="mail">
            </td>
        </tr>
        <tr>
            <td>Address:</td>
            <td>
                <input type="text" name="address">
            </td>
        </tr>
        <tr>
            <td>Customer Type:</td>
            <td>
                <select name="customerType">
                    <c:forEach items="${customerType}" var="customerType">
                        <option value="${customerType.id}">${customerType.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">Create</button>
            </td>
        </tr>
    </table>
</form>
<p style="color: darkred">${msg}</p>
</body>
</html>
