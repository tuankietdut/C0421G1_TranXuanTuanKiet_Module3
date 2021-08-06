<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Create new user</h1>
    <a href="/user">Back to menu</a>
    <p style="color: darkseagreen">${msg}</p>
    <form method="post">
        <table>
<%--            <tr>--%>
<%--                <td>Id user</td>--%>
<%--                <td><input type="number" name="idUser" value="${id}"></td>--%>
<%--            </tr>--%>
            <tr>
                <td>Name user</td>
                <td><input type="text" name="nameUser" ></td>
            </tr>
            <tr>
                <td>Email user</td>
                <td><input type="text" name="emailUser" ></td>

            </tr>
            <tr>
                <td>Country user</td>
                <td><input type="text" name="countryUser" ></td>

            </tr>
            <tr>
                <td><input type="submit" value="Create new user"></td>
            </tr>
        </table>

    </form>
</body>
</html>
