<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: ShouYou
  Date: 03/08/2021
  Time: 9:45 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Map<String, String> dictionaryMap = new HashMap<>();
        dictionaryMap.put("book", "Sách");
        dictionaryMap.put("how", "Thế nào");
        dictionaryMap.put("book", "Quyển vở");
        dictionaryMap.put("computer", "Máy tính");
        String search = request.getParameter("search");
        String result = dictionaryMap.get(search);
        if (result == null){
            out.println("Not found");
        }else {
            out.println("Word: " + search);
            out.println("Result: " + result);
        }
    %>
</body>
</html>
