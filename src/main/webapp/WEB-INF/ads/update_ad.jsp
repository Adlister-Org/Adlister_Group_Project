<%--
  Created by IntelliJ IDEA.
  User: austinvarnon
  Date: 11/18/20
  Time: 9:41 AM
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
        <form method="post" action="/update">
            <label for="title">Title</label>
            <input id="title" name="title" value="<c:out value="${ad.title}"/>">
            <label for="description">Description</label>
            <input id="description" name="decription" value="<c:out value="${ad.description}"/>">
            <button type="submit">Submit</button>
        </form>
    </div>
</div>

</body>
</html>
