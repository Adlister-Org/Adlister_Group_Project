<%--
  Created by IntelliJ IDEA.
  User: cruzanio
  Date: 11/17/20
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.user == null} ">
        <jsp:include page="loggedOutNav.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="loggedInNav.jsp"/>
    </c:otherwise>
</c:choose>
