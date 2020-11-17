<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-default">
<%--    <p>Logged in: ${sessionScope.size()}</p>--%>
    <c:choose>
        <c:when test="${sessionScope.user == null}">
            <p>Not Logged In!</p>
            <div class="container-fluid bg-primary">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="/ads">Adlister</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/login">Login</a></li>
<%--                    <li><a href="/logout">Logout</a></li>--%>
                </ul>
            </div><!-- /.navbar-collapse -->
        </c:when>
        <c:otherwise>
            <p>Logged In!</p>
            <div class="container-fluid bg-alert">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="/ads">Adlister</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
<%--                    <li><a href="/login">Login</a></li>--%>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </c:otherwise>
    </c:choose>
</nav>
<%--    <div class="container-fluid">--%>
<%--        <!-- Brand and toggle get grouped for better mobile display -->--%>
<%--        <div class="navbar-header">--%>
<%--            <a class="navbar-brand" href="/ads">Adlister</a>--%>
<%--        </div>--%>
<%--        <ul class="nav navbar-nav navbar-right">--%>
<%--            <li><a href="/login">Login</a></li>--%>
<%--            <li><a href="/logout">Logout</a></li>--%>
<%--        </ul>--%>
<%--    </div><!-- /.navbar-collapse -->--%>
    <!-- /.container-fluid -->

