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
    <h1><c:out value="Welcome, ${sessionScope.user.username}!"/></h1>
    <div><a href="/info">Account Settings</a></div>
    <br>
    <c:forEach var="ad" items="${ads}">
        <div class="card mx-5">
            <div class="card-header">
                <h3><a href="<c:url value="/ad">
                <c:param name="id" value="${ad.id}"/>
                </c:url>"><c:out value="${ad.title}"/></a>
                </h3>
            </div>
            <div class="card-body">
                <p class="card-text"><c:out value="${ad.description}"/></p>
            </div>
            <div class="card-footer">
                <form action="/update" method="get">
                    <button type="submit" value="${ad.id}" name="adId">Update</button>
                </form>
                <form action="/delete" method="post">
                    <button type="submit" value="${ad.id}" name="adId">Delete</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>
</div>
</body>
</html>
