<%--
  Created by IntelliJ IDEA.
  User: cruzanio
  Date: 11/22/20
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1><c:out value="Viewing All Ads by ${userName}!"/></h1>

<c:forEach var="ad" items="${ads}">
    <div class="card mx-5">
        <div class="card-header">
            <h1><c:out value="${ad.title}"/></h1>
        </div>
        <div class="card-body">
            <h3 class="card-text"><c:out value="${ad.description}"/></h3>
            <br>
            <div>
                <h5>Categories: </h5>
                <ul>
                    <c:forEach var="cat" items="${categories}">
                        <li>${cat.title}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</c:forEach>

</div>
</body>
</html>
