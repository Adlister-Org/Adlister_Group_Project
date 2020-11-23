<%--
  Created by IntelliJ IDEA.
  User: cruzanio
  Date: 11/17/20
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-dark bg-dark mb-5">
    <c:choose>
        <c:when test="${sessionScope.user == null}">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/ads">Joblister</a>
                    <a class="navbar-brand" href="/ads/create">Create Ad</a>
                </div>
                <div class=" navbar-right">
                    <a class="navbar-brand" href="/login">Login</a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/ads">Joblister</a>
                    <a class="navbar-brand" href="/ads/create">Create Ad</a>


                </div>
                <div class=" navbar-right">
                    <p class="navbar-brand">Welcome, <c:out value="${sessionScope.user.username}"/></p>
                    <a class="navbar-brand" href="/profile">Profile</a>
                    <a class="navbar-brand" href="/logout">Logout</a>

                </div>
            </div>
        </c:otherwise>
    </c:choose>
</nav>
