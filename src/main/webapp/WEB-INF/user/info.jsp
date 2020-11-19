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
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="col-md-6">
        <form method="post" action="/info">

            <label for="email">Email</label>
            <input id="email" name="email" value="<c:out value="${sessionScope.user.email}"/>">
            <button type="submit" value="${sessionScope.user.id}" name="userId">Submit</button>

            <label for="password">New Password</label>
            <input type="password" id="password" name="password" placeholder="Enter new password">
            <button type="submit" value="${sessionScope.user.id}" name="password">Submit</button>

        </form>
    </div>
</div>

</body>
</html>
