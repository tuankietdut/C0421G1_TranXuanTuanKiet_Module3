<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%--2 thông số action & id --%>
<body>
    <h1>Edit User</h1>
    <a href="/user">Back to menu</a>
    <p style="color: darkseagreen">${msg}</p>
    <form method="post">
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="nameUser" value="${user.getName()}"></td>
            </tr>
            <tr>
                <td>email</td>
                <td><input type="text" name="email" value="${user.getEmail()}"></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><input type="text" name="country" value="${user.getCountry()}"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Click to submit"></td>
            </tr>
        </table>
    </form>
</body>
</html>
