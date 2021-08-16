<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Customer Contract</title>
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

            <h1>Customer Contract List</h1>

            <c:if test="${empty customerContractList}">
                <h3 style="color: red">Customer Contract List Empty!</h3>
            </c:if>

            <c:if test="${not empty customerContractList}">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Name Customer</th>
                        <th>Name Service</th>
                        <th>Attach Service With</th>
                        <th>Quantity of attach service</th>
                        <th>Edit Service</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${customerContractList}" var="customer_contract_obj">
                        <tr>
                            <td>${customer_contract_obj.nameCustomer}</td>
                            <td>${customer_contract_obj.nameService}</td>
                            <c:choose>
                                <c:when test="${customer_contract_obj.nameAttachService != null}">
                                    <td>${customer_contract_obj.nameAttachService}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Khong co dich vu di kem</td>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${customer_contract_obj.quantity != 0}">
                                    <td>${customer_contract_obj.quantity}</td>
                                </c:when>
                                <c:otherwise>
                                    <td></td>
                                </c:otherwise>
                            </c:choose>
                            <td>
                                <a href="/customer_contract?action=edit&id=${customer_contract_obj.serviceId}" class="btn btn-danger">Edit Service</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <p style="color: darkred">${msg}</p>



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
