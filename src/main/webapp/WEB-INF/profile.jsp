<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1> <c:out value="Welcome, ${sessionScope.user.username}!"/></h1>

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
