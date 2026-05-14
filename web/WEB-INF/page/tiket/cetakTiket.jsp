<%-- 
    Document   : cetakTiket
    Created on : Jun 10, 2025, 12:12:41 PM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="in_ID"/>
<!DOCTYPE html>
<html>
    <head>
        <title>E-Ticket</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .eticket-container {
                background-color: white;
                margin: 16px;
                padding: 20px;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }
            .eticket-header {
                display: flex;
                gap: 16px;
                padding-bottom: 16px;
                border-bottom: 1px dashed #ddd;
            }
            .eticket-poster {
                width: 100px;
                height: 150px;
                object-fit: cover;
                border-radius: 8px;
            }
            .eticket-info h2 {
                margin: 0 0 8px;
                font-size: 18px;
            }
            .eticket-info p {
                margin: 0 0 4px;
                font-size: 14px;
                color: #666;
            }
            .eticket-body {
                padding-top: 16px;
            }
            .eticket-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 12px;
            }
            .eticket-row .label {
                color: #666;
            }
            .eticket-row .value {
                font-weight: 700;
                text-align: right;
            }
        </style>
    </head>
    <body>
        <div class="mobile-container">
            <%-- Sertakan Navbar --%>
            <jsp:include page="../user/navbar.jsp">
                <jsp:param name="page_title" value="Cetak E-Ticket" />
                <jsp:param name="show_logo" value="true" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <div class="main-content">
                <c:if test="${not empty detailTiket}">
<!--                mengambil atribut detailTiket dari GoCetakTiketAction-->
                    <div class="eticket-container">
                        <div class="eticket-header">
                            <img src="${pageContext.request.contextPath}/${detailTiket.posterPath}" alt="Poster" class="eticket-poster">
                            <div class="eticket-info">
                                <h2>${detailTiket.judulFilm} (${detailTiket.ratingUsia})</h2>
                                <p>${detailTiket.namaBioskop}</p>
                                <p>${detailTiket.tipeRuang} - ${detailTiket.namaRuang}</p>
                                <p><fmt:formatDate value="${detailTiket.tanggalTayang}" pattern="EEEE, dd MMM yyyy"/>, ${detailTiket.jamTayang}</p>
                            </div>
                        </div>
                        <div class="eticket-body">
                            <div class="eticket-row">
                                <span class="label">Nomor Order</span>
                                <span class="value">${detailTiket.orderID}</span>
                            </div>
                            <div class="eticket-row">
                                <span class="label">Nomor Pembayaran</span>
                                <span class="value">${detailTiket.paymentID}</span>
                            </div>
                            <div class="eticket-row">
                                <span class="label">Kursi</span>
                                <span class="value"><c:forEach var="kursi" items="${detailTiket.nomorKursi}" varStatus="loop">${kursi}<c:if test="${not loop.last}">, </c:if></c:forEach></span>
                                    </div>
                                    <div class="eticket-row">
                                        <span class="label">Total Harga</span>
                                        <span class="value"><fmt:formatNumber value="${detailTiket.totalHarga}" type="currency"/></span>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>