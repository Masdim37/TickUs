<%-- 
    Document   : bioskop
    Created on : Jun 9, 2025, 6:51:42 AM
    Author     : LENOVO
--%>

<%-- File: webapp/WEB-INF/page/bioskop/listbioskop.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Daftar Bioskop - TickUs</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>
    <body>
        <div class="mobile-container" style="background: #f0f2f5;">

            <jsp:include page="../user/navbar.jsp">
                <jsp:param name="page_title" value="Bioskop" />
                <jsp:param name="show_logo" value="true" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <main class="main-content" style="padding-top: 90px;">
                <div class="location-filter">
                    <i class="fa-solid fa-location-dot"></i>
                    <span>Purwokerto</span>
                </div>

                <%-- Terapkan class "cinema-list" pada elemen <ul> --%>
                <ul class="cinema-list">
<!--                mengambil data dari atribut bioskopList yang ada di GoListBioskopAction-->
                    <c:forEach var="bioskop" items="${bioskopList}">
                        <%-- Terapkan class "cinema-item" pada elemen <li> --%>
                        <li class="cinema-item">
                            <%-- PERBAIKAN: Arahkan ke action GoDetailBioskop dengan parameter bioskopID --%>
                            <a href="${pageContext.request.contextPath}/controller?action=GoDetailBioskop&bioskopID=${bioskop.bioskopID}">
                                ${bioskop.namaBioskop}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </main>

            <jsp:include page="../user/footer.jsp" />
        </div>
         </body>
</html>