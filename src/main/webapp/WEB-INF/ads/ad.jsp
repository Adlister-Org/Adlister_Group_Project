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
<body style="background-color: darkgrey">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="row my-5 justify-content-center">
    <div class="col-6">
        <div class="card mx-5 justify-content-center">
            <div class="card-header text-center">
                <h1><c:out value="${ad.title}"/></h1>
            </div>
            <div class="card-body text-center">
                <img src="${ad.imgUrl}" class="" alt="image unavailable" style="width: 35%; height: 200px">
                <h3 class="card-text"><c:out value="${ad.description}"/></h3>
                <br>
                <div>
                    <h5>Categories: </h5>
                    <div class="justify-content-center" style="text-align: center;">
                        <c:forEach var="cat" items="${categories}">
                            <p>${cat.title}</p>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="card-footer text-center">
                Created by:
                <a href="<c:url value="/user" >
                <c:param name="id" value="${userAd.id}"/>
                <c:param name="userName" value="${userAd.username}"/>
                </c:url>"><c:out value="${userAd.username}"/>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>

