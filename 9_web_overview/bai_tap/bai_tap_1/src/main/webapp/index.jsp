<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>
    Product Discount Calculator
</h1>
<form action="/calculate" method="post">
    <label>Product Description</label> <br>
    <input type="text" name="productDes" placeholder="input here"> <br>
    <label>List Price</label> <br>
    <input type="number" name="listProduct" placeholder="input here"> <br>
    <label>Discount Percent</label> <br>
    <input type="number" name="discountPercent" placeholder="input here"> <br>
    <input type="submit" value="Calculate Discount">
</form>
</body>
</html>
