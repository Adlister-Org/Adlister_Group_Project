<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
</head>
<body class="text-center" style="background-color: darkgrey">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
         <main role="main" class="inner cover">
             <h1 class="cover-header">The Odd job for you!</h1>
             <p class="lead">Find an odd job!</p>
             <p class="lead">
                <button class="btn btn-lg btn-secondary"><a href="/ads" style="color: white">View Jobs</a></button>
             </p>
             <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" data-interval="4000">
                 <div class="carousel-inner">
                     <div class="carousel-item active">
                         <img src="https://ei.marketwatch.com/Multimedia/2019/01/21/Photos/ZH/MW-HC357_WFH_20190121195319_ZH.jpg?uuid=1c14f744-1de0-11e9-8c7a-ac162d7bc1f7" class="d-block w-100" alt="...">
                     </div>
                     <div class="carousel-item">
                         <img src="https://www.nextechacademy.com/wp-content/uploads/blog-B12.jpg" class="d-block w-100" alt="...">
                     </div>
                     <div class="carousel-item">
                         <img src="https://www.rycoinc.net/images/content/large_6cf0308fdf0deb6c54ac71160-20819.jpg" class="d-block w-100" alt="...">
                     </div>
                     <div class="carousel-item">
                         <img src="https://www.prbizonline.com/wp-content/uploads/2017/04/home-cleaning-services-singapore.jpg" class="d-block w-100" alt="...">
                     </div>
                     <div class="carousel-item">
                         <img src="https://world.edu/wp-content/uploads/2017/08/tutoring.jpg" class="d-block w-100" alt="...">
                     </div>
                     <div class="carousel-item">
                         <img src="https://cdn.abcotvs.com/dip/images/5208497_032019-cc-ss-disney-princess-cosplay-img.jpg?w=1600" class="d-block w-100" alt="...">
                     </div>
                     <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                         <span class="sr-only">Previous</span>
                     </a>
                     <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                         <span class="carousel-control-next-icon" aria-hidden="true"></span>
                         <span class="sr-only">Next</span>
                     </a>
                 </div>
             </div>



<%--    <div class="container">--%>
<%--        <h1>Welcome to the Adlister!</h1>--%>
<%--    </div>--%>

     </main>
</div>
</body>
</html>
