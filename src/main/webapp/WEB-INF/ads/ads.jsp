<%@ page import="com.codeup.adlister.models.Ad" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body style="background-color: darkgrey">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="container-fluid justify-content-center text-center">
    <h1>Here Are all the jobs!</h1>
    <form action="/ads" method="get">
        <div class="form-group d-flex flex-column align-items-center">
        <label for="search">Search Ads: </label>
        <input class="form-control m-0" type="text" name="search" id="search" style="width: 50%" value="${stickySearch}">
        <button class="btn btn-dark btn-md my-2" type="submit">Search</button>
        </div>
    </form>
    <form action="/ads" method="get" >
        <label for="filter">Filter by Category: </label>
        <select name="filter" id="filter">
            <option value="all">All Categories</option>
            <c:forEach var="cat" items="${categories}">
                <c:choose>
                    <c:when test="${cat.id.toString() == stickyFilter}">
                        <option value="${cat.id}" selected>${cat.title}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${cat.id}">${cat.title}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>

        <button type="submit">Filter</button>
    </form>
    </div>
    <div class="row justify-content-center">
        <c:forEach var="ad" items="${ads}">
            <div class="card col-3 m-1 mx-auto p-0" style="border: 1px solid black">
                <img src="${ad.imgUrl}" class="" alt="image unavailable" style="width: 100%; height: 150px">
                <div class="card-body">
                    <h5 class="card-title"><c:out value = "${ad.title}"/></h5>
                    <p class="card-text" ><c:out value="${ad.description}"/></p>
                    <a class="btn btn-dark" href="<c:url value="/ad" >
                <c:param name="id" value="${ad.id}"/>
                </c:url>">View</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
