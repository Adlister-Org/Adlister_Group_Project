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
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="col-md-6">
        <form method="post" action="/update">

            <label for="title">Title</label>
            <input id="title" name="title" value="<c:out value="${ad.title}"/>">
            <label for="description">Description</label>
            <textarea id="description" name="description"><c:out value="${ad.description}"/></textarea>
            <c:forEach var="category" items="${categories}">
                <label for="cat-title">${category.title}</label>
                <input id="cat-title"  name="cat-title" type="checkbox" value="${category.id}"/>
            </c:forEach>
            <button type="submit" value="${ad.id}" name="adId">Submit</button>

        </form>
    </div>
</div>

</body>
</html>
