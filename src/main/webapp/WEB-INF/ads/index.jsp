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
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
<<<<<<< HEAD
            <h2><c:out value="${ad.title}"/></h2>
            <p><c:out value="${ad.description}" /></p>
=======
            <a href="<c:url value="/ad">
            <c:param name="id" value="${ad.id}"/>
            </c:url>">
            <c:out value = "${ad.title}"/></a>
            <p><c:out value="${ad.description}"/></p>
>>>>>>> e9f554705bac4b78a68f2f25b9d02255f2125829
        </div>
    </c:forEach>
</div>

</body>
</html>
