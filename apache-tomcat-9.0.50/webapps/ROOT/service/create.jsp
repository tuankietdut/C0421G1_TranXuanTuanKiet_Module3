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

            <h1 class="display-6 text-center">Create Service</h1>
            <p style="color: darkred">${msg}</p>
            <form action="/service" method="post">
                <div class="mb-3">
                    <label for="changeService" class="form-label">Service Type</label>
                    <select onchange="onchangeService()"class="form-control" name="serviceType" id="changeService">
                        <c:forEach items="${serviceType}" var="serviceObj">
                            <option value="${serviceObj.id}">${serviceObj.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="Service_name" class="form-label">Service_name</label>
                    <input type="text" class="form-control" id="Service_name" name="Service_name">
                </div>

                <div class="mb-3">
                    <label for="Service_area" class="form-label">Service_area</label>
                    <input type="number" class="form-control" id="Service_area" name="Service_area">
                </div>

                <div class="mb-3">
                    <label for="service_cost" class="form-label">Service_cost</label>
                    <input type="number" class="form-control" id="service_cost" name="service_cost">
                </div>

                <div class="mb-3">
                    <label for="service_max_people" class="form-label">Service_max_people</label>
                    <input type="number" class="form-control" id="service_max_people" name="service_max_people">
                </div>

                <div class="mb-3">
                    <label for="standard_room" class="form-label">Standard_room</label>
                    <input type="text" class="form-control" id="standard_room" name="standard_room">
                </div>

                <div class="mb-3">
                    <label for="description_other_convenience" class="form-label">Description_other_convenience</label>
                    <input type="text" class="form-control" id="description_other_convenience" name="description_other_convenience">
                </div>

                <div class="mb-3">
                    <label for="pool_area" class="form-label">Pool_area</label>
                    <input type="number" class="form-control" id="pool_area" name="pool_area">
                </div>

                <div class="mb-3">
                    <label for="number_of_floors" class="form-label">Number_of_floors</label>
                    <input type="number" class="form-control" id="number_of_floors" name="number_of_floors">
                </div>

                <div class="mb-3">
                    <label for="service_free" class="form-label">Free service with</label>
                    <input type="hidden" class="form-control" id="service_free" name="service_free">
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

<script>
    function onchangeService() {

        let result = document.getElementById("changeService").value;
        switch (result) {
            case "1":
                document.getElementById("pool_area").type ="number" ;
                document.getElementById("description_other_convenience").type = "text";
                document.getElementById("number_of_floors").type = "number";
                document.getElementById("standard_room").type = "text";
                document.getElementById("service_free").type = "hidden";
                break;
            case "2":
                document.getElementById("pool_area").type ="hidden" ;
                document.getElementById("description_other_convenience").type = "text";
                document.getElementById("number_of_floors").type = "number";
                document.getElementById("standard_room").type = "text";
                document.getElementById("service_free").type = "hidden";
                break
            case "3":
                document.getElementById("pool_area").type ="hidden" ;
                document.getElementById("description_other_convenience").type = "hidden";
                document.getElementById("number_of_floors").type = "hidden";
                document.getElementById("standard_room").type = "hidden";
                document.getElementById("service_free").type = "text";
                break;
        }

    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
