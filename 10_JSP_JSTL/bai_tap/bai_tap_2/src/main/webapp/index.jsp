<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="calculator" method="get">
    <table>
        <tr>
            <td colspan="2">Calculator</td></tr>
        <tr>
            <td>First operand</td>
            <td><input type="number" name="firstNumber"></td>
        </tr>
        <tr>
            <td>Operator</td>
            <td><select name="operator" id="">
                <option value="plus">plus</option>
                <option value="except">except</option>
                <option value="multiply">multiply</option>
                <option value="divide">divide</option>
            </select></td>
        </tr>
        <tr>
            <td>Second operand</td>
            <td><input type="number" name="secondNumber"></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center"><input type="submit" value="Calculator"></td>
        </tr>
    </table>
</form>
<p>Result: ${result}</p>
<p>${textMess}</p>
</body>
</html>
