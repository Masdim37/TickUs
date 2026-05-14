<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <style>
            .error-container {
                text-align: center;
                padding-top: 50px;
            }
        </style>
    </head>
    <body>
        <div class="mobile-container">
            <div class="top-navbar">
                <h1>Terjadi Kesalahan</h1>
            </div>
            <div class="main-content error-container">
                <h2>Oops! Ada yang tidak beres.</h2>
                <p>Maaf, kami mengalami kendala teknis. Silakan coba lagi nanti.</p>
                <p style="color: #dc3545; font-style: italic;">
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                            out.print(errorMessage);
                        } else if (exception != null) {
                            out.print(exception.getMessage());
                        } else {
                            out.print("Tidak ada detail kesalahan yang tersedia.");
                        }
                    %>
                </p>
                <br>
                <a href="${pageContext.request.contextPath}/controller?action=GoHomeUser" class="action-button btn-confirm" style="text-decoration: none;">Kembali ke Beranda</a>
            </div>
        </div>
    </body>
</html>