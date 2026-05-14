<%-- 
    Document   : tiketSaya
    Created on : Jun 10, 2025, 12:12:55 PM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="in_ID"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Tiket Saya</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .ticket-card {
                background-color: white;
                border-radius: 12px;
                margin-bottom: 16px;
                padding: 16px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }
            .ticket-header {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                border-bottom: 1px dashed #ddd;
                padding-bottom: 12px;
                margin-bottom: 12px;
            }
            .ticket-info h3 {
                margin: 0 0 4px 0;
                font-size: 16px;
            }
            .ticket-info p {
                margin: 0;
                font-size: 14px;
                color: #666;
            }
            .ticket-datetime {
                text-align: right;
            }
            .ticket-body {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .ticket-seats p {
                margin: 0;
                color: #666;
            }
            .ticket-seats span {
                font-weight: 700;
                color: #333;
            }
            .btn-cetak {
                background-color: #c00000;
                color: white;
                padding: 8px 16px;
                border-radius: 20px;
                text-decoration: none;
                font-size: 14px;
            }
            .no-ticket {
                text-align: center;
                color: #888;
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <div class="mobile-container">
            <%-- Sertakan Navbar --%>
            <jsp:include page="../user/navbar.jsp">
                <jsp:param name="page_title" value="Tiket Saya" />
                <jsp:param name="show_logo" value="true" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <div class="main-content">
                <c:choose>
                    <c:when test="${not empty listTiket}">
<!--                    mengambil atribut listTiket dari GoTiketSayaAction & dilakukan perulangan untuk setiap item di listTiket-->
                        <c:forEach var="tiket" items="${listTiket}">
                            <div class="ticket-card">
                                <div class="ticket-header">
                                    <div class="ticket-info">
                                        <h3>${tiket.judulFilm} (${tiket.ratingUsia})</h3>
                                        <p>${tiket.namaBioskop}</p> 
                                        <p>${tiket.tipeRuang} - ${tiket.namaRuang}</p>
                                    </div>
                                    <div class="ticket-datetime">
                                        <p><fmt:formatDate value="${tiket.tanggalTayang}" pattern="EEEE, dd MMM yyyy"/></p>
                                        <p>${tiket.jamTayang}</p>
                                    </div>
                                </div>
                                <div class="ticket-body">
                                    <div class="ticket-seats">
                                        <p>Kursi: <span><c:forEach var="kursi" items="${tiket.nomorKursi}" varStatus="loop">${kursi}<c:if test="${not loop.last}">, </c:if></c:forEach></span></p>
                                            </div>
<!--                                        tombol cetak e-tiket diarahkan ke GoCetakTiket melalui controller-->
                                            <a href="controller?action=GoCetakTiket&orderID=${tiket.orderID}" class="btn-cetak">CETAK E-TICKET</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="no-ticket">Anda belum memiliki tiket.</p>
                    </c:otherwise>
                </c:choose>
            </div>
            <jsp:include page="../user/footer.jsp"/>
        </div>
    </body>
</html>