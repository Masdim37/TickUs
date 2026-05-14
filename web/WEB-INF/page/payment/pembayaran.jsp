<%-- 
    Document   : pembayaran
    Created on : Jun 9, 2025, 5:20:22 PM
    Author     : LENOVO
--%>

<%-- web/WEB-INF/page/payment/pembayaran.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="id_ID"/>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detail Transaksi</title>
        <link rel="stylesheet" href="assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .payment-container {
                padding: 16px;
            }
            .ticket-summary {
                display: flex;
                gap: 16px;
                margin-bottom: 24px;
                padding-bottom: 24px;
                border-bottom: 1px solid #eee;
            }
            .ticket-summary img {
                width: 170px;
                height: auto;
                border-radius: 8px;
            }
            .ticket-summary .info h4 {
                margin: 0 0 4px 0;
                font-size: 25px;
            }
            .ticket-summary .info p {
                margin: 0;
                font-size: 14px;
                color: #666;
            }
            .section-title {
                font-weight: 700;
                margin-bottom: 8px;
                font-size: 16px;
            }
            .order-details, .payment-details {
                margin-bottom: 24px;
            }
            .detail-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 4px;
            }
            .terms-box {
                display: flex;
                align-items: flex-start;
                gap: 12px;
                background: #f9f9f9;
                padding: 12px;
                border-radius: 8px;
                font-size: 12px;
                color: #666;
            }
            .terms-box input[type="checkbox"] {
                margin-top: 4px;
                transform: scale(1.2);
            }
        </style>
    </head>
    <body>
        <div class="mobile-container">
            <jsp:include page="../user/navbar.jsp">
                <jsp:param name="page_title" value="Detail Transaksi Tiket" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <div class="main-content main-content-with-bottom-bar" style="padding-top: 80px; padding-bottom: 100px;">
                <div class="payment-container">
                    <div class="ticket-summary">
                        <%-- JSTL EL cukup pintar untuk mengakses map key seperti properti objek --%>
                        <img src="assets/images/${sessionScope.pendingOrder.judulFilm}.png" alt="${sessionScope.pendingOrder.judulFilm}">
                        <div class="info">
                            <h4>${sessionScope.pendingOrder.judulFilm} (${sessionScope.pendingOrder.ratingUsia})</h4>
                            <p>${sessionScope.pendingOrder.namaBioskop}</p>
                            <p>${sessionScope.pendingOrder.namaRuang} - ${sessionScope.pendingOrder.tipeRuang}</p>
                            <p>
                            <fmt:formatDate value="${sessionScope.pendingOrder.tanggalTayang}" pattern="EEEE, dd MMM yyyy"/> - 
                            ${sessionScope.pendingOrder.jamTayang.substring(0,5)}
                            </p>
                        </div>
                    </div>

                    <div class="order-details">
                        <p class="section-title">Detail Pesanan</p>
                        <div class="detail-row">
                            <span>${sessionScope.pendingOrder.jumlahTiket} Tiket Kursi ${sessionScope.pendingOrder.tipeRuang}</span>
                            <span>
                                <c:forEach var="kursi" items="${sessionScope.pendingOrder.nomorKursiList}" varStatus="loop">
                                    ${kursi}<c:if test="${!loop.last}">, </c:if>
                                </c:forEach>
                            </span>
                        </div>
                        <div class="detail-row">
                            <span>Total Harga</span>
                            <span style="font-weight: bold;">Rp <fmt:formatNumber value="${sessionScope.pendingOrder.totalHarga}" type="number" maxFractionDigits="0"/></span>
                        </div>
                    </div>

                    <div class="payment-details">
                        <p class="section-title">Metode Pembayaran</p>
                        <div class="detail-row">
                            <span>T-Wallet</span>
                        </div>
                        <div class="detail-row">
                            <span>Saldo Anda</span>
                            <span style="color: #666;">Rp <fmt:formatNumber value="${sessionScope.user.twallet.saldo}" type="number" maxFractionDigits="0"/></span>
                        </div>
                    </div>

                    <form action="controller?action=ProcessPayment" method="POST">
<!--                        <input type="hidden" name="orderID" value="${sessionScope.pendingOrder.orderID}">
                        <input type="hidden" name="totalHarga" value="${sessionScope.pendingOrder.totalHarga}">-->

                        <div class="terms-box">
                            <input type="checkbox" id="terms-checkbox">
                            <label for="terms-checkbox">Dengan ini saya menyetujui bahwa seluruh transaksi pembelian tiket tidak dapat diklaim kembali dalam bentuk apa pun (refund, tukar tiket, dsb).</label>
                        </div>

                        <div class="bottom-action-bar">
                            <button type="submit" class="action-button btn-confirm" id="konfirmasi-btn" disabled>
                                KONFIRMASI PEMBAYARAN
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                const termsCheckbox = document.getElementById('terms-checkbox');
                const konfirmasiBtn = document.getElementById('konfirmasi-btn');

                termsCheckbox.addEventListener('change', function () {
                    konfirmasiBtn.disabled = !this.checked;
                });
            </script>
        </div>
    </body>
</html>
