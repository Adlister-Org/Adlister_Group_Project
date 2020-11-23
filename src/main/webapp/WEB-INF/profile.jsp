<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<div>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="text-center" >
    <div class="row justify-content-between">
        <h1 class="col-5"><c:out value="Welcome, ${sessionScope.user.username}!"/></h1>
        <h4><a class="col-5" href="/info">Account Settings</a></h4>
    </div>
    <img src="<c:out value="${sessionScope.user.image}"></c:out>" alt="box">
    <br>
    <br>


    <div class="row justify-content-center">
        <c:forEach var="ad" items="${ads}">
            <div class="card col-3 m-1" style="width: 18rem;>
                    <a href="<c:url value="/ad">
                        <c:param name="id" value="${ad.id}"/>
                        </c:url>">
                    </a>
                    <img src="${ad.image}" class="card-img-top" alt="Joblister">
                    <div class="card-body">
                        <h5 class="card-title"><c:out value = "${ad.title}"/></h5>
                        <p class="card-text" ><c:out value="${ad.description}"/></p>

                    </div>

                <div class="col-12">
                    <a class="btn btn-primary col-4" href="<c:url value="/ad"  >
                    <c:param name="id" value="${ad.id}"/>
                    </c:url>">View</a>
                    <form action="/update" method="get">
                        <button class="btn btn-primary col-4" type="submit" value="${ad.id}" name="adId">Update</button>
                    </form>
                    <form action="/delete" method="post">
                        <button class="btn btn-primary col-4" type="submit" value="${ad.id}" name="adId">Delete</button>
                    </form>

                </div>
            </div>


        </c:forEach>
    </div>
</div>

</div>


</body>
</html>
