<%-- 
    Document   : topupSukses
    Created on : Jun 10, 2025, 7:53:06 AM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Top Up Berhasil</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .mobile-container {
                background-color: white; /* Latar belakang utama putih */
            }
            .top-navbar-custom {
                justify-content: flex-start;
                align-items: center;
            }
            .top-navbar-custom .back-arrow {
                font-size: 20px;
                color: white;
                text-decoration: none;
                margin-right: 16px;
            }
            .success-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: calc(100vh - 150px);
                text-align: center;
                padding: 20px;
            }
            .success-icon {
                font-size: 60px;
                color: #28a745;
                background-color: #eaf6ec;
                border-radius: 50%;
                width: 100px;
                height: 100px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 30px;
            }
            .success-container h2 {
                font-size: 20px;
                font-weight: 700;
                margin: 0 0 12px 0;
                color: #333;
            }
            .success-container p {
                font-size: 16px;
                color: #666;
                margin: 0;
                line-height: 1.5;
            }
            .bottom-action-bar {
                background-color: white;
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <div class="mobile-container">
            <div class="top-navbar top-navbar-custom">
                <a href="${pageContext.request.contextPath}/controller?action=GoHomeUser" class="back-arrow"><i class="fas fa-arrow-left"></i></a>
                <h1>Halaman Top Up Berhasil</h1>
            </div>

            <div class="main-content" style="padding-top: 70px; padding-bottom: 90px; background-color: white;">
                <div class="success-container">
                    <div class="success-icon">
                        <i class="fas fa-check"></i>
                    </div>
                    <h2>TOP-UP TWALLET BERHASIL</h2>
                    <p>
                        Saldo Sebesar
                        <%-- Menggunakan JSTL fmt untuk format mata uang Rupiah --%>
                        <fmt:setLocale value="in_ID"/>
                        <fmt:formatNumber value="${param.amount}" type="currency" currencySymbol="Rp" maxFractionDigits="2"/>
                        berhasil ditambahkan ke T-Wallet Anda
                    </p>
                </div>
            </div>

            <div class="bottom-action-bar">
                <%-- PERBAIKAN DI SINI: Menambahkan width: 100% dan margin: 0 pada style --%>
                <a href="${pageContext.request.contextPath}/controller?action=GoHomeUser" class="action-button btn-confirm" style="border-radius: 12px; width: 93%; margin: 0;">KEMBALI KE BERANDA</a>
            </div>
        </div>
    </body>
</html>
