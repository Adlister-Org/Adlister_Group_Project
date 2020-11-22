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
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Here Are all the jobs!</h1>
    <form action="/ads" method="get">
        <label for="search">Search Ads: </label>
        <input type="text" name="search" id="search" value="${stickySearch}">
        <button type="submit">Search</button>
    </form>

    <div class="row">
        <c:forEach var="ad" items="${ads}">


    <%--        <div class="col-md-6">--%>
    <%--            <a href="<c:url value="/ad">--%>
    <%--            <c:param name="id" value="${ad.id}"/>--%>
    <%--            </c:url>">--%>
    <%--            <c:out value = "${ad.title}"/></a>--%>
    <%--            <p><c:out value="${ad.description}"/></p>--%>
    <%--        </div>--%>

            <div class="card col-3" style="width: 18rem;">
                <img src="https://images-wixmp-530a50041672c69d335ba4cf.wixmp.com/templates/image/b77fe464cfc445da9003a5383a3e1acf.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><c:out value = "${ad.title}"/></h5>
                    <p class="card-text"><c:out value="${ad.description}"/></p>
                    <a class="btn btn-primary" href="<c:url value="/ad" >
                <c:param name="id" value="${ad.id}"/>
                </c:url>">View</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
