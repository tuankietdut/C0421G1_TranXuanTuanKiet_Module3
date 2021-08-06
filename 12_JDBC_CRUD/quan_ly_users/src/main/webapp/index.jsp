<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
<h1>User Management</h1>
<a href="/user?action=create">Create new user</a>
<c:if test="${mes2 != null}">
    <a href="/user">Back to menu</a>
</c:if>
<p style="color: darkseagreen">${msg}</p>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="2">Actions</th>
    </tr>
    <c:forEach items="${userList}" var="userObject">
        <tr>
            <td>${userObject.getId()}</td>
            <td>${userObject.getName()}</td>
            <td>${userObject.getEmail()}</td>
            <td>${userObject.getCountry()}</td>
            <td><a href="/user?action=edit&id=${userObject.getId()}">Edit</a></td>
            <td>
                <button onclick="deleteElement(${userObject.getId()})" type="button" class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form method="get">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure about delete this user?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-secondary">Delete</button>
                    </div>
                </div>
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" id="idElement">
            </form>
        </div>
    </div>
</table>
<br>
<form>
    <input type="hidden" name="action" value="findByCountry">
    <label>Input Country</label>
    <input type="text" name="nameCountry">
    <input type="submit" value="lets go">
</form>
<form>
    <input type="hidden" name="action" value="orderBy">
    <label> Order by name </label>
    <input type="submit" value="lets go">
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
        integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
        integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
        crossorigin="anonymous"></script>
<script>
    function deleteElement(id) {
        document.getElementById("idElement").value = id;
    }
</script>
</body>
</html>
