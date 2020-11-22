<%--
  Created by IntelliJ IDEA.
  User: sarsi
  Date: 11/16/20
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing ${ad.title}" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
        <div class="col-md-6">
            <h1><c:out value="${ad.title}"/></h1>
            <p><c:out value="${ad.description}"/></p>
        </div>
</div>
<div class="container">
    <div class="col-md-6">
        <p>Categories: </p>
        <ul>
            <c:forEach var="cat" items="${categories}">
                <li>
                    ${cat.title}
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="container">
    <p>Created By: <c:out value="${userAd.username}"/></p>
</div>


</body>
</html>

