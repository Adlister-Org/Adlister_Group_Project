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
    <a href="/info">Account Settings</a>
    <br>
    <br>

    <%--TODO: add method to MYSQLDAO that returns a list of ads by a specfic user id --%>

    <c:forEach var="ad" items="${ads}">
        <c:if test="${sessionScope.user.id.equals(ad.userId)}">
            <div class="col-md-6">
                <a href="<c:url value="/ad">
            <c:param name="id" value="${ad.id}"/>
                </c:url>">
                    <c:out value="${ad.title}"/></a>
                <p><c:out value="${ad.description}"/></p>

               <form action="/update" method="get">
                   <button type="submit" value="${ad.id}" name="adId">Update</button>
               </form>
                <form action="/delete" method="post">
                   <button type="submit" value="${ad.id}" name="adId">Delete</button>
                </form>
            </div>
        </c:if>
    </c:forEach>

</div>
</body>
</html>
