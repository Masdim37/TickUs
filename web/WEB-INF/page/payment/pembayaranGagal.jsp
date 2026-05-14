<%-- 
    Document   : PembayaranGagal
    Created on : Jun 10, 2025, 5:22:53 AM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
    <head>
        <title>Pembayaran Berhasil</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <style>
            .status-page {
                text-align: center;
                padding: 40px 20px;
            }
            .status-icon {
                /* Biarkan kosong atau atur margin jika perlu */
                margin-bottom: 20px;
            }
            .status-icon img {
                /* Atur ukuran gambar sesuai keinginan Anda */
                width: 100px;
                height: 100px;
            }
            .status-page h2 {
                margin-bottom: 10px;
            }
            .status-page p {
                color: #666;
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <div class="mobile-container">
            <jsp:include page="../user/navbar.jsp">
                <jsp:param name="page_title" value="Pembayaran Gagal" />
            </jsp:include>
            <div class="main-content" style="padding-top: 70px;">
                <div class="status-page">
                    <div class="status-icon">
                        <img src="${pageContext.request.contextPath}/assets/images/Icon-Gagal.png" alt="Pembayaran Gagal">
                    </div>
                    <h2>PEMBAYARAN GAGAL</h2>
                    <p>Pastikan Saldo T-Wallet Anda Cukup Untuk Melanjutkan Transaksi</p>
                    <a href="controller?action=GoHomeUser" class="action-button btn-confirm">KEMBALI KE BERANDA</a>
                </div>
            </div>
        </div>
    </body>
</html>