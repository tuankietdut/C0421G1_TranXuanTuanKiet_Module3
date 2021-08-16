<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-6">
                <img src="https://ncov.moh.gov.vn/o/corona-theme-guest/images/logo_byt.png" alt="Ảnh bộ y tế" height="78">
            </div>
            <div class="col-6 text-end pe-5 pt-3"></div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="layout_menu/navbar.jsp"></jsp:include>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-sm-12">
                <jsp:include page="layout_menu/sidebar.jsp"></jsp:include>
            </div>
            <div class="col-lg-9 col-sm-12">
                Body in here


                <form action="/login">
                    <div class="mb-3">
                        <label for="userName" class="form-label">User name</label>
                        <input type="text" class="form-control" id="userName" name="userName" value="${username}">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" value="${password}">
                    </div>
<%--                    <div class="mb-3 form-check">--%>
<%--                        <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                        <label class="form-check-label" for="exampleCheck1">Remember me</label>--%>
<%--                    </div>--%>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>

            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                Footer .....
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
