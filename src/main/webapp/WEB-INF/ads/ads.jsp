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
    <c:when test="${sessionScope.user == null}">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="/ads">Adlister</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/login">Login</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </c:when>
    <c:otherwise>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="/ads">Adlister</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
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
