<%--
  Created by IntelliJ IDEA.
  User: austinvarnon
  Date: 11/18/20
  Time: 9:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="col-md-6">
        <h1>Update Ad</h1>
        <form method="post" action="/update">
            <div class="form-group">
                <label for="title">Title</label>
                <input class="form-control" id="title" name="title" value="<c:out value="${ad.title}"/>">
                <label for="description" class="my-3">Description</label>
                <textarea class="form-control" id="description" name="description"><c:out value="${ad.description}"/>
                </textarea>
                    <c:forEach var="category" items="${categories}">
                        <c:choose>
                            <c:when test="${category.checked == 1}">
                                <div>
                                    <input id="cat-title" name="cat-title" type="checkbox" value="${category.id}" checked/>
                                    <label for="cat-title">${category.title}</label>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>
                                    <input id="cat-title" name="cat-title" type="checkbox" value="${category.id}"/>
                                    <label for="cat-title">${category.title}</label>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                <button class="btn btn-primary btn-block" type="submit" value="${ad.id}" name="adId">Update</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
