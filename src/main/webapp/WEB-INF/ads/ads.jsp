<%@ page import="com.codeup.adlister.models.Ad" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<c:choose>
    <c:when test="${sessionScope.user.username == null} ">
        <jsp:include page="/WEB-INF/partials/loggedOutNav.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="/WEB-INF/partials/loggedInNav.jsp"/>
    </c:otherwise>
</c:choose>

<div class="container">
    <h1>Here Are all the ads!</h1>
    <form action="/ads" method="get">
        <label for="search">Search Ads: </label>
        <input type="text" name="search" id="search">
        <button type="submit">Search</button>
    </form>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <a href="<c:url value="/ad">
            <c:param name="id" value="${ad.id}"/>
            </c:url>">
            <c:out value = "${ad.title}"/></a>
            <p><c:out value="${ad.description}"/></p>
        </div>
    </c:forEach>
</div>

</body>
</html>
