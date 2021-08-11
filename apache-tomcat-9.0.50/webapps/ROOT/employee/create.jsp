<%--
  Created by IntelliJ IDEA.
  User: ShouYou
  Date: 10/08/2021
  Time: 11:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Create Employee</h1>
<form action="/employee" method="post">
    <input type="hidden" name="action" value="create">
    <table>

        <tr>
            <td>Name:</td>
            <td>
                <input type="text" name="nameEmployee">
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
            <td>Salary:</td>
            <td>
                <input type="number" name="salary">
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
            <td>Position:</td>
            <td>
                <select name="position">
                    <option value="1">Lễ tân</option>
                    <option value="2">Phục vụ</option>
                    <option value="3">Chuyên Viên</option>
                    <option value="4">Giám sát</option>
                    <option value="5">Quản lý</option>
                    <option value="6">Giám đốc</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Education_degree:</td>
            <td>
                <select name="education">
                    <option value="1">Trung Cấp</option>
                    <option value="2">Cao Đẳng</option>
                    <option value="3">Đại học</option>
                    <option value="4">Sau Đại học</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Division:</td>
            <td>
                <select name="division">
                    <option value="1">Sale Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
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
