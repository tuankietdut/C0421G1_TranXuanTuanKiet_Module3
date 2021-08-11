<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="col-6 text-end pe-5 pt-3">Nguyễn Văn A</div>
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

            <h1>Customer List</h1>

            <a class="btn btn-success mb-2" href="/customer?action=create" role="button">Create</a>
            <c:if test="${empty customerList}">
                <h3 style="color: red">Customer List Empty!</h3>
            </c:if>

            <c:if test="${not empty customerList}">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Birthday</th>
                        <th>Gender</th>
                        <th>id_card</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>typeCustomer</th>
                        <th colspan="2">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${customerList}" var="customer">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.name}</td>
                            <td>${customer.birthday}</td>
                            <c:choose>
                                <c:when test="${customer.gender == 0}">
                                    <td>Nam</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Nữ</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${customer.idCard}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.email}</td>
                            <td>${customer.address}</td>
                            <td>${customer.typeCustomer}</td>
                            <td>
                                <a href="/customer?action=edit&id=${customer.id}" class="btn btn-danger">Edit</a>
                            </td>
                            <td>
                                <button onclick="onDelete(${customer.id})" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Delete
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <p style="color: darkred">${msg}</p>


            <!-- Button trigger modal -->


            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Confirm delete</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="/customer" method="get">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="" id="idCustomerDel">
                            <div class="modal-body">
                                ...
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Ok</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
<script>
    function onDelete(id) {
        document.getElementById("idCustomerDel").value = id;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
