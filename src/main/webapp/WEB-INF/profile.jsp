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

<div class="container my-3">
    <h1>Welcome, <c:out value="${sessionScope.user.username}"/></h1>
    <br>
    <a class="btn btn-dark" href="/info" role="button">Account Settings</a>
    <div class="row my-3">
    <c:forEach var="ad" items="${ads}">
        <div class="card col-3 m-1 mx-auto p-0" style="border: 1px solid black">
            <img src="${ad.imgUrl}" class="" alt="image unavailable" style="width: 100%; height: 150px">
            <div class="card-body">
                <h5 class="card-title"><c:out value = "${ad.title}"/></h5>
                <p class="card-text" ><c:out value="${ad.description}"/></p>
                <div class="d-flex justify-content-around">
                    <form action="/update" method="get">
                        <button class="btn btn-dark" type="submit" value="${ad.id}" name="adId">Update</button>
                    </form>
                    <form action="/delete" method="post">
                        <button class="btn btn-danger" type="submit" value="${ad.id}" name="adId">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
    </div>
</div>
</div>
</body>
</html>
