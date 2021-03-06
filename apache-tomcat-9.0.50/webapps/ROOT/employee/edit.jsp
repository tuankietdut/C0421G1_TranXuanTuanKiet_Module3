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

            <h1 class="display-6 text-center">Edit Employee</h1>
            <p style="color: darkred">${msg}</p>
            <form action="/employee" method="post">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id" value="${employee.id}">

                <div class="mb-3">
                    <label for="nameEmployee" class="form-label">Employee_name</label>
                    <input type="text" class="form-control" id="nameEmployee" name="nameEmployee" value="${employee.name}">
                </div>

                <div class="mb-3">
                    <label for="birthDay" class="form-label">Employee_birthday</label>
                    <input type="date" class="form-control" id="birthDay" name="birthDay" value="${employee.birthDay}">
                </div>

                <div class="mb-3">
                    <label for="idCard" class="form-label">Employee_idCard</label>
                    <input type="text" class="form-control" id="idCard" name="idCard" value="${employee.idCard}">
                    <div class="form-text text-danger">${errorIdCard}</div>
                </div>

                <div class="mb-3">
                    <label for="salary" class="form-label">Employee_Salary</label>
                    <input type="number" class="form-control" id="salary" name="salary" value="${employee.salary}">
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Employee_phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${employee.phone}">
                    <div class="form-text text-danger">${errorPhone}</div>
                </div>

                <div class="mb-3">
                    <label for="mail" class="form-label">Employee_email</label>
                    <input type="email" class="form-control" id="mail" name="mail" value="${employee.email}">
                    <div class="form-text text-danger">${errorEmail}</div>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Employee_address</label>
                    <input type="text" class="form-control" id="address" name="address" value="${employee.address}">
                </div>

                <div class="mb-3">
                    <label for="position" class="form-label">Employee_position</label>
                    <select class="form-control" name="position" id="position">
                        <c:forEach items="${positionList}" var="positionObj">
                            <c:choose>
                                <c:when test="${employee.position.equals(positionObj.name)}">
                                    <option value="${positionObj.id}" selected>${positionObj.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${positionObj.id}">${positionObj.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="education" class="form-label">Employee_education</label>
                    <select class="form-control" name="education" id="education">
                        <c:forEach items="${educationList}" var="educationObj">
                            <c:choose>
                                <c:when test="${employee.educationDegree.equals(educationObj.name)}">
                                    <option value="${educationObj.id}" selected>${educationObj.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${educationObj.id}">${educationObj.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="division" class="form-label">Employee_division</label>
                    <select class="form-control" name="division" id="division">
                        <c:forEach items="${divisionList}" var="divisionObj">
                            <c:choose>
                                <c:when test="${employee.division.equals(divisionObj.name)}">
                                    <option value="${divisionObj.id}" selected>${divisionObj.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${divisionObj.id}">${divisionObj.name}</option>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
