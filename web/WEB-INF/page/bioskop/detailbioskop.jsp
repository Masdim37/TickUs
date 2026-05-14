<%-- 
    Document   : detailbioskop
    Created on : Jun 9, 2025, 7:44:10 AM
    Author     : LENOVO
--%>

<%-- File: webapp/WEB-INF/page/bioskop/detailbioskop.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${bioskop.namaBioskop} - TickUs</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>
    <body>
        <div class="mobile-container">
            <jsp:include page="../user/navbar.jsp">
                <jsp:param name="page_title" value="Bioskop" />
                <jsp:param name="show_logo" value="true" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <main class="main-content" style="padding: 0; padding-top: 60px; padding-bottom: 60px;">
                <%-- Banner dan Detail Bioskop --%>
                <c:if test="${not empty bioskop}">
<!--                ambil data dari parameter bioskop-->
                    <img src="${pageContext.request.contextPath}/assets/images/${bioskop.namaBioskop}.png" alt="${bioskop.namaBioskop}" class="cinema-banner">
                    <div class="cinema-details">
                        <h2>${bioskop.namaBioskop}</h2>
                        <p>${bioskop.brandBioskop}</p>
                        <p><i class="fa-solid fa-location-dot"></i>${bioskop.lokasiBioskop}</p>
                    </div>
                </c:if>

                <%-- =================================================================== --%>
                <%-- ================== AWAL BAGIAN YANG DIUBAH TOTAL ================== --%>
                <%-- =================================================================== --%>
                <div class="movie-list-container">
                    <div class="section-header">
                        <i class="fa-solid fa-clapperboard"></i>
                        <span>Sedang Tayang</span>
                    </div>

                    <c:if test="${empty filmList}">
                        <div style="text-align: center; padding: 40px; color: #666;">
                            <p>Maaf, tidak ada film yang sedang tayang.</p>
                        </div>
                    </c:if>

                    <c:forEach var="film" items="${filmList}">
<!--                    ambil data dari parameter filmList-->
                        <div class="movie-item-detailed">
                            <a href="controller?action=GoDetailFilm&filmID=${film.filmID}&bioskopID=${bioskop.bioskopID}" class="poster-link">
                                <img src="${pageContext.request.contextPath}/assets/images/${film.judul}.png" alt="${film.judul}" class="poster">
                            </a>
                            <div class="details">
                                <h3>${film.judul}</h3>
                                <table class="movie-details-table">
                                    <tr>
                                        <td>Judul</td>
                                        <td>: ${film.judul}</td>
                                    </tr>
                                    <tr>
                                        <td>Sutradara</td>
                                        <td>: ${film.sutradara}</td>
                                    </tr>
                                    <tr>
                                        <td>Durasi</td>
                                        <td>: ${film.durasi} Menit</td>
                                    </tr>
                                    <tr>
                                        <td>Rating Usia</td>
                                        <td>: ${film.ratingUsia}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <%-- =================================================================== --%>
                <%-- =================== AKHIR BAGIAN YANG DIUBAH TOTAL ================== --%>
                <%-- =================================================================== --%>

            </main>

            <jsp:include page="../user/footer.jsp" />
        </div>
         </body>
</html>