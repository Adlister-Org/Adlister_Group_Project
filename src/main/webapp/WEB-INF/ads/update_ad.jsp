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
        <jsp:param name="title" value="Updating ${ad.title}"/>
    </jsp:include>
</head>
<body style="background-color: darkgrey">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="col-md-6">
        <h1>Update Ad</h1>
    <c:forEach var="e" items="${errors}">
        <div class="alert alert-danger" role="alert">
                ${e}
        </div>
    </c:forEach>

        <c:choose>
            <c:when test="${errors == null}">
                <form method="post" action="/update">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input class="form-control" id="title" name="title" value="<c:out value="${ad.title}"/>">
                        <label for="description" class="my-3">Description</label>
                        <textarea class="form-control" id="description" name="description"><c:out value="${ad.description}"/></textarea>

                        <label for="imgUrl">Enter image url</label>
                        <input id="imgUrl" name="imgUrl" class="form-control" type="text" value="<c:out value="${ad.imgUrl}"/>">

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
                        <button class="btn btn-dark btn-block" type="submit" value="${ad.id}" name="adId">Update</button>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                <form method="post" action="/update">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input class="form-control" id="title" name="title" value="<c:out value="${title}"/>">
                        <label for="description" class="my-3">Description</label>
                        <textarea class="form-control" id="description" name="description"><c:out value="${description}"/></textarea>

                        <label for="imgUrl">Enter image url</label>
                        <input id="imgUrl" name="imgUrl" class="form-control" type="text" value="<c:out value="${imgUrl}"/>">

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
                        <button class="btn btn-dark btn-block" type="submit" value="${ad.id}" name="adId">Update</button>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>


    </div>
</div>

</body>
</html>
