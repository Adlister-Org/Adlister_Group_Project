<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
<<<<<<< HEAD
        <h1><c:out value=" Welcome, ${sessionScope.user.username}!" /></h1>
=======
        <h1> <c:out value="Welcome, ${sessionScope.user.username}!"/></h1>
>>>>>>> e9f554705bac4b78a68f2f25b9d02255f2125829
    </div>

</body>
</html>
