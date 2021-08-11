<%--
  Created by IntelliJ IDEA.
  User: ShouYou
  Date: 10/08/2021
  Time: 3:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
<%--        <a class="navbar-brand" href="#">Logo navbar</a>--%>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto ms-5 mb-lg-0">
                <li class="nav-item me-4">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item me-4">
                    <a class="nav-link" href="/employee">Employee</a>
                </li>
                <li class="nav-item me-4">
                    <a class="nav-link" href="/customer">Customer</a>
                </li>
                <li class="nav-item me-4">
                    <a class="nav-link" href="/service">Service</a>
                </li>
                <li class="nav-item me-4">
                    <a class="nav-link" href="#">Contract</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control ms-5 w-100" type="search" placeholder="Search" aria-label="Search">
<%--                <button class="btn btn-outline-success" type="submit">Search</button>--%>
            </form>
        </div>
    </div>
</nav>
</body>
</html>
