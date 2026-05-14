<%-- 
    Document   : register
    Created on : 9 Jun 2025, 12.09.06
    Author     : CHRISTOBA JOSHUA H
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pendaftaran - TickUs</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            .message-box {
                padding: 10px;
                border-radius: 8px;
                margin-bottom: 16px;
                border: 1px solid transparent;
                text-align: center;
                background-color: #f8d7da;
                color: #721c24;
                border-color: #f5c6cb;
            }
        </style>
    </head>
    <body>
        <div class="mobile-container">
            <div class="top-navbar">
                <a href="${pageContext.request.contextPath}/controller?action=GoLoginUser" class="navbar-action">
                    <i class="fas fa-arrow-left"></i>
                </a>
                <h1>Pendaftaran Akun</h1>
                <span style="width: 20px;"></span>
            </div>
            <div class="main-content">
                <% String error = (String) request.getAttribute("error");
               if (error != null) { %>
                <div class="message-box"><%= error %></div>
                <% } %>
                <div class="form-container">
                    <form action="${pageContext.request.contextPath}/controller" method="post">
                        <input type="hidden" name="action" value="RegisterUser">
                        <div class="form-group">
                            <label for="namaUser">Nama Lengkap</label>
                            <input type="text" id="namaUser" name="namaUser" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Konfirmasi Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="noTelp">No. Telepon</label>
                            <input type="tel" id="noTelp" name="noTelp">
                        </div>
                        <div class="form-group">
                            <label>Jenis Kelamin</label>
                            <select name="jenisKelamin">
                                <option value="1" selected>Laki-laki</option>
                                <option value="0">Perempuan</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tanggalLahir">Tanggal Lahir</label>
                            <input type="date" id="tanggalLahir" name="tanggalLahir">
                        </div>
                        <button type="submit" class="action-button btn-confirm" style="width: 100%;">Daftar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>