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

            <h1>Create Service</h1>
            <form action="/service" method="post">
                <table>
                    <tr>
                        <td>Service_name</td>
                        <td>
                            <input type="text" name="nameService">
                        </td>
                    </tr>
                    <tr>
                        <td>Service_area:</td>
                        <td>
                            <input type="date" name="birthDay">
                        </td>
                    </tr>
                    <tr>
                        <td>service_cost:</td>
                        <td>
                            <input type="text" name="idCard">
                        </td>
                    </tr>
                    <tr>
                        <td>service_max_people:</td>
                        <td>
                            <input type="number" name="">
                        </td>
                    </tr>
                    <tr>
                        <td>standard_room:</td>
                        <td>
                            <input type="text" name="phone">
                        </td>
                    </tr>
                    <tr>
                        <td>description_other_convenience:</td>
                        <td>
                            <input type="text" name="mail">
                        </td>
                    </tr>
                    <tr>
                        <td>pool_area:</td>
                        <td>
                            <input type="text" name="address">
                        </td>
                    </tr>
                    <tr>
                        <td>number_of_floors:</td>
                        <td>
                            <input type="text" name="address">
                        </td>
                    </tr>
                    <tr>
                        <td>service_type_id</td>
                        <td>
                            <select name="serviceType">
                                <c:forEach items="${serviceType}" var="serviceType">
                                    <option value="${serviceType.id}">${serviceType.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit">Create</button>
                        </td>
                    </tr>
                </table>
            </form>
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
