<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-6">
            <img src="https://ncov.moh.gov.vn/o/corona-theme-guest/images/logo_byt.png" alt="Ảnh bộ y tế" height="78">
        </div>
        <div class="col-6 text-end pe-5 pt-3">${userNameLogin}</div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout_menu/navbar.jsp"></jsp:include>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 col-sm-12">
            <jsp:include page="../layout_menu/sidebar.jsp"></jsp:include>
        </div>
        <div class="col-lg-9 col-sm-12">
            Body in here

            <h1 class="display-6 text-center">Create Customer</h1>
            <p style="color: darkred">${msg}</p>
            <form action="/customer" method="post">
                <input type="hidden" name="action" value="create">

                <div class="mb-3">
                    <label for="nameCustomer" class="form-label">Customer_Name</label>
                    <input type="text" class="form-control" id="nameCustomer" name="nameCustomer" aria-describedby=""
                           value="${customer.name}">
                </div>

                <div class="mb-3">
                    <label for="gender" class="form-label">Customer_gender</label>
                    <select class="form-control" name="gender" id="gender">
                        <c:choose>
                            <c:when test="${customer.gender ==0}">
                                <option value="0" selected>Nam</option>
                                <option value="1">Nữ</option>
                            </c:when>
                            <c:when test="${customer.gender ==1}">
                                <option value="0">Nam</option>
                                <option value="1" selected>Nữ</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">Nam</option>
                                <option value="1">Nữ</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="birthDay" class="form-label">Customer_birthday</label>
                    <input type="date" class="form-control" id="birthDay" name="birthDay" value="${customer.birthday}">
                </div>

                <div class="mb-3">
                    <label for="idCard" class="form-label">Customer_idCard</label>
                    <input type="text" class="form-control" id="idCard" name="idCard" value="${customer.idCard}">
                    <div class="form-text text-danger">${errorIdCard}</div>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Customer_phone</label>
                    <input type="number" class="form-control" id="phone" name="phone" value="${customer.phone}">
                    <div class="form-text text-danger">${errorPhone}</div>
                </div>

                <div class="mb-3">
                    <label for="mail" class="form-label">Customer_email</label>
                    <input type="email" class="form-control" id="mail" name="mail" value="${customer.email}">
                    <div class="form-text text-danger ">${errorEmail}</div>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Customer_address</label>
                    <input type="text" class="form-control" id="address" name="address" value="${customer.address}">
                </div>


                <div class="mb-3">
                    <label for="codeCustomer" class="form-label">Customer_code</label>
                    <input type="text" class="form-control" id="codeCustomer" name="codeCustomer"
                           value="${customer.codeCustomer}">
                    <div class="form-text text-danger">${errorCodeCustomer}</div>
                </div>


                <div class="mb-3">
                    <label for="customerType" class="form-label">Customer_type</label>
                    <select class="form-control" name="customerType" id="customerType">
                        <c:forEach items="${customerType}" var="customerType">
                            <c:choose>
                                <c:when test="${customer.typeCustomer == customerType.getId()}">
                                    <option value="${customerType.id}" selected>${customerType.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${customerType.id}">${customerType.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
