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
        <jsp:param name="title" value="Viewing ${ad.title}"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="card mx-5">
    <div class="card-header">
        <h1><c:out value="${ad.title}"/></h1>
    </div>
    <div class="card-body">
        <h3 class="card-text"><c:out value="${ad.description}"/></h3>
        <img src="<c:out value="${ad.image}"></c:out>" alt="https://giantbomb1.cbsistatic.com/uploads/original/15/153607/3075875-mario.png" >
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
    <div class="card-footer">
        Created by:
        <a href="<c:url value="/user" >
                <c:param name="id" value="${userAd.id}"/>
                <c:param name="userName" value="${userAd.username}"/>
                </c:url>"><c:out value="${userAd.username}"/></a>
    </div>
</div>
</body>
</html>

