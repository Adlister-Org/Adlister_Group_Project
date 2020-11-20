<%--
  Created by IntelliJ IDEA.
  User: cruzanio
  Date: 11/17/20
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
<%--<c:choose>--%>
<%--    <c:when test="${sessionScope.user == null}">--%>
<%--        <div class="container-fluid">--%>
<%--            <!-- Brand and toggle get grouped for better mobile display -->--%>
<%--            <div class="navbar-header">--%>
<%--                <a class="navbar-brand" href="/ads">Adlister</a>--%>
<%--            </div>--%>
<%--            <ul class="nav navbar-nav navbar-right">--%>
<%--                <li><a href="/login">Login</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <!-- /.navbar-collapse -->--%>
<%--        </div><!-- /.container-fluid -->--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--        <div class="container-fluid">--%>
<%--            <!-- Brand and toggle get grouped for better mobile display -->--%>
<%--            <div class="navbar-header">--%>
<%--                <a class="navbar-brand" href="/ads">Adlister</a>--%>
<%--            </div>--%>
<%--            <ul class="nav navbar-nav navbar-right">--%>
<%--                <li><a href="/profile">Profile</a></li>--%>
<%--                <li><a href="/logout">Logout</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <!-- /.navbar-collapse -->--%>
<%--        </div><!-- /.container-fluid -->--%>

<%--    </c:otherwise>--%>
<%--</c:choose>--%>
<%--</nav>--%>



<c:choose>
    <c:when test="${sessionScope.user == null}">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="/ads">Adlister</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/login">Login</a>
                </li>
            </ul>
        </div>
    </c:when>
    <c:otherwise>
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/ads">Adlister</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/info"><c:out value="Welcome back, ${sessionScope.user.username}"/></a>
                </li>
                <li>
                    <a href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </c:otherwise>
</c:choose>
</nav>
