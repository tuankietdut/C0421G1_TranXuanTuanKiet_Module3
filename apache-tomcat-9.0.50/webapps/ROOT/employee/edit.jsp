<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<h1>Edit Employee</h1>
<form  method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td>
                <input type="text" name="nameEmployee" value="${employee.name}">
            </td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td>
                <input type="date" name="birthDay" value="${employee.birthDay}">
            </td>
        </tr>
        <tr>
            <td>Id_card:</td>
            <td>
                <input type="text" name="idCard" value="${employee.idCard}">
            </td>
        </tr>
        <tr>
            <td>Salary:</td>
            <td>
                <input type="number" name="salary" value="${employee.salary}">
            </td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td>
                <input type="text" name="phone" value="${employee.phone}">
            </td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>
                <input type="text" name="mail" value="${employee.email}">
            </td>
        </tr>
        <tr>
            <td>Address:</td>
            <td>
                <input type="text" name="address" value="${employee.address}">
            </td>
        </tr>
        <tr>
            <td>Position:</td>
            <td>
                <span>
                     Position: of employee: <input type="text" readonly style="color: red; border: none" value="${employee.position}">
                </span>
                <br>
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
                <span>
                    Education_degree of employee: <input type="text" readonly style="color: red; border: none" value="${employee.educationDegree}">
                </span>
                <br>
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
                 <span>
                     Division of employee: <input type="text" readonly style="color: red; border: none" value="${employee.division}">
                </span>
                <br>
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
                <button type="submit">Edit</button>
            </td>
        </tr>
    </table>
</form>
<p style="color: darkred">${msg}</p>

</body>
</html>
