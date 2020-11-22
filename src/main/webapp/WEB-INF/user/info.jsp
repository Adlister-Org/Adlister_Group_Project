<%--
  Created by IntelliJ IDEA.
  User: cruzanio
  Date: 11/19/20
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Account Settings"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="col-md-6">

        <c:if test="${requestScope.errors != null}">
                <c:forEach var="e" items="${errors}">
                    <div class="alert alert-danger" role="alert">
                            ${e}
                    </div>
                </c:forEach>
        </c:if>

        <form method="post" action="/info">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<c:out value="${sessionScope.user.email}"/>" class="form-control">
            </div>
            <div class="form-group">
                <label for="password">New Password</label>
                <input type="password" id="password" name="password" placeholder="Enter new password" class="form-control">
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="re-enter new password" class="form-control">
            </div>
            <button type="submit" value="${sessionScope.user.id}" name="userId" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>
</div>

</body>
</html>
