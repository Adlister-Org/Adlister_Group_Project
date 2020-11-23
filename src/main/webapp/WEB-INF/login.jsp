<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
</head>
<body style="background-color: darkgrey">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Please Log In</h1>

    <c:forEach var="e" items="${errors}">
        <div class="alert alert-danger" role="alert">
                ${e}
        </div>
    </c:forEach>

    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" value="${requestScope.enteredUser}" type="text">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn btn-dark btn-block" value="Log In">
    </form>
    <div class="text-center">
        <h3>or</h3>
    </div>
    <div>
        <form action="/register">
            <button type="submit" class="btn btn-dark btn-block" value="Register">Register</button>
        </form>
    </div>
</div>
</body>
</html>
