<%-- 
    Document   : hoe
    Created on : Jun 8, 2025, 11:50:10 AM
    Author     : LENOVO
--%>

<%-- File: webapp/WEB-INF/page/user/beranda.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Beranda - TickUs</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>
    <body>

        <%-- ===== PEMBUNGKUS UTAMA UNTUK TAMPILAN PONSEL ===== --%>
        <div class="mobile-container">

            <%-- Header Halaman Beranda --%>
            <header class="header">
                <div class="profile-summary">
                    <%-- Membuat inisial nama dari huruf pertama --%>
                    <c:set var="nama" value="${sessionScope.user.namaUser}"/>
                    <c:set var="inisial" value="${nama.substring(0, 1)}"/>
                    <div class="profile-pic">${inisial}</div>

                    <div class="profile-info">
                        <p class="welcome">Selamat Datang</p>
                        <p class="username">${sessionScope.user.namaUser}</p>
                    </div>
                </div>

                <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="TickUs Logo" class="logo">
            </header>

            <main class="main-content-home">
                <section class="wallet-card">
                    <div class="wallet-info">
                        <p class="balance-title">T-Wallet</p>
                        <p class="balance-amount">
                            <fmt:setLocale value="id_ID"/>
                            <c:choose>
                                <c:when test="${not empty sessionScope.user.twallet}">
                                    <%-- Format saldo jika T-Wallet ada --%>
                                    <fmt:formatNumber value="${sessionScope.user.twallet.saldo}" type="currency" currencySymbol="Rp " maxFractionDigits="0"/>
                                </c:when>
                                <c:otherwise>
                                    <%-- Tampilkan "Rp 0" jika T-Wallet tidak ada atau saldo kosong --%>
                                    Rp 0
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                    <a href="${pageContext.request.contextPath}/controller?action=GoTopUp" class="top-up-btn">
                        <div class="icon-circle">
                            <i class="fa-solid fa-plus"></i>
                        </div>
                        <span>Top up</span>
                    </a>
                </section>

                <section class="movie-section">
                    <h2 class="section-title">
                        <i class="fa-solid fa-film"></i>
                        <span>Sedang Tayang</span>
                    </h2>
                    <div class="movie-scroller">
                        <div class="movie-card">
                            <img src="${pageContext.request.contextPath}/assets/images/LILO & STITCH.png" class = "movie-poster" alt="Lilo & Stitch">
                            <p class="movie-title">Lilo & Stitch</p>
                            <p class="movie-rating">SU</p>
                        </div>
                        <div class="movie-card">
                            <img src="${pageContext.request.contextPath}/assets/images/JUMBO.png" class = "movie-poster" alt="Jumbo">
                            <p class="movie-title">JUMBO</p>
                            <p class="movie-rating">SU</p>
                        </div>
                        <div class="movie-card">
                            <img src="${pageContext.request.contextPath}/assets/images/final-destination.jpg" class = "movie-poster" alt="Final Destination">
                            <p class="movie-title">Final Destination</p>
                            <p class="movie-rating">R13+</p>
                        </div>
                        <%-- Tambahkan movie card lainnya jika ada --%>
                    </div>
                </section>
            </main>

            <jsp:include page="footer.jsp" />

        </div> <%-- Penutup .mobile-container --%>

    </body>
</html>