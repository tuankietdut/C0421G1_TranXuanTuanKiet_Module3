
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/convert" method="post">
  <label >Rate</label> <br>
  <input type="text" name="Rate" placeholder="Rate" value="22000"> <br>
  <label >USD</label> <br>
  <input type="text" name="USD" placeholder="USD" value="0"> <br>
  <input type="submit" id="submit" value="Converter">
</form>
</body>
</html>
