<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body style="background-color: darkgrey">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Create a new Ad</h1>
    <c:forEach var="e" items="${errors}">
        <div class="alert alert-danger" role="alert">
                ${e}
        </div>
    </c:forEach>
    <c:choose>
        <c:when test="${errors == null}">
            <form action="/ads/create" method="post">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" type="text"></textarea>
                </div>
        </c:when>
        <c:otherwise>
            <form action="/ads/create" method="post">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text" value="<c:out value="${title}"/>">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" type="text"><c:out value="${description}"/></textarea>
                </div>
        </c:otherwise>
    </c:choose>
                <div class="form-group">
                    <label for="imgUrl">Enter image url</label>
                    <input id="imgUrl" name="imgUrl" class="form-control" type="text">
                </div>
                <c:forEach var="category" items="${categories}">
                    <label for="cat-title">${category.title}</label>
                    <input id="cat-title"  name="cat-title" type="checkbox" value="${category.id}"/>
                </c:forEach>

                <input type="submit" class="btn btn-block btn-dark">

            </form>

</div>
</body>
</html>
