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
<body style="background-color: darkgrey">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="text-center my-4">
        <h1><c:out value="Viewing All Ads by ${userName}!"/></h1>
    </div>
    <div class="text-center" >
        <img src="${user.image}" alt="Image unavailabe" style="max-width: 300px; max-height: 300px">
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
