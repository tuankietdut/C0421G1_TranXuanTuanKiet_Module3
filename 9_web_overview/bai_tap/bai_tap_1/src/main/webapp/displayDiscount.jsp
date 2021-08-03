<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Product Description: <%= request.getParameter("productDes")%></h3>
<h3>List Price: <%= request.getParameter("listProduct")%></h3>
<h3>Discount Percent:  <%= request.getParameter("discountPercent")%></h3>
<h3>Discount Amount <%=request.getAttribute("discountAmount")%></h3>
<h3>Discount Price <%=request.getAttribute("discountPrice")%> </h3>
</body>
</html>
