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

            <h1 class="display-6 text-center">Create ContractDetail</h1>
            <p style="color: darkred">${msg}</p>
            <form action="/contractDetail" method="post">

                <div class="mb-3">
                    <label for="contractId" class="form-label">Contract</label>
                    <select class="form-control" name="contractId" id="contractId">
                        <c:forEach items="${contractList}" var="contractObj">
                            <option value="${contractObj.id}">
                                    idContract = ${contractObj.id} with startDate= ${contractObj.startDate} and endDate = ${contractObj.endDate}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="attach_service" class="form-label">Attach_service</label>
                    <select class="form-control" name="attach_service" id="attach_service">
                        <c:forEach items="${attachList}" var="attachObj">
                            <option value="${attachObj.id}">${attachObj.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity of attach_service</label>
                    <input type="number" class="form-control" name="quantity" id="quantity">
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
