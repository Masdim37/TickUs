<%-- 
    Document   : login
    Created on : Jun 8, 2025, 6:14:52 AM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TickUs</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background-color: #ffffff;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .banner-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        .login-content {
            padding: 24px 32px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .logo {
            width: 120px;
            margin-bottom: 16px;
            align-self: flex-end; /* Posisi logo di kanan */
        }

        h1 {
            font-size: 28px;
            font-weight: 700;
            color: #1c1e21;
            margin: 0;
            margin-bottom: 24px;
            width: 100%;
            text-align: left;
        }

        .input-group {
            width: 100%;
            margin-bottom: 16px;
            position: relative;
        }

        .input-group i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #8a8d91;
        }

        .input-group input {
            width: 100%;
            padding: 12px 12px 12px 40px; /* Padding kiri untuk ikon */
            border: 1px solid #dddfe2;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .input-group input:focus {
            outline: none;
            border-color: #c00000;
            box-shadow: 0 0 0 2px rgba(192, 0, 0, 0.2);
        }

        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            box-sizing: border-box;
        }

        .btn-primary {
            background-color: #c00000;
            color: #ffffff;
            margin-bottom: 12px;
        }
        
        .btn-primary:hover {
            background-color: #a00000;
        }

        .btn-secondary {
            background-color: #e4e6eb;
            color: #1c1e21;
        }
        
        .btn-secondary:hover {
            background-color: #d8dbe0;
        }
        
        .error-message {
            color: #c00000;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 16px;
            width: 100%;
            box-sizing: border-box;
            text-align: center;
        }
        
        /* === STYLE BARU UNTUK PESAN SUKSES === */
        .success-message {
            color: #155724; /* Hijau tua */
            background-color: #d4edda; /* Hijau muda */
            border: 1px solid #c3e6cb; /* Border hijau */
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 16px;
            width: 100%;
            box-sizing: border-box;
            text-align: center;
        }

    </style>
</head>
<body>

    <div class="login-container">
        <div class="banner-image">
            <%-- Ganti "path/to/your/cinema.jpg" dengan lokasi gambar Anda --%>
            <img src="${pageContext.request.contextPath}/assets/images/cinema.png" alt="Cinema Banner">
        </div>
        
        <div class="login-content">
            <%-- Ganti "path/to/your/logo.png" dengan lokasi gambar Anda --%>
            <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="TickUs Logo" class="logo">
            
            <h1>Halo Everyone !</h1>
            
            <%-- Form akan mengirim data ke LoginServlet --%>
            <form action="${pageContext.request.contextPath}/login" method="post" style="width: 100%;">
                
                <%-- Bagian untuk menampilkan pesan sukses (setelah logout/hapus akun) --%>
                <c:if test="${not empty param.message}">
                    <div class="success-message">
                        ${param.message}
                    </div>
                </c:if>

                <%-- Bagian untuk menampilkan pesan error dari servlet --%>
                <c:if test="${not empty error}">
                    <div class="error-message">
                        ${error}
                    </div>
                </c:if>

                <div class="input-group">
                    <i class="fa-solid fa-user"></i>
                    <input type="text" name="usernameInput" placeholder="Username" required>
                </div>
                
                <div class="input-group">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" name="passwordInput" placeholder="Password" required>
                </div>
                
                <button type="submit" class="btn btn-primary">Masuk</button>
            </form>
            
            <%-- MODIFIED: "Daftar" button now points to the registration action --%>
            <a href="${pageContext.request.contextPath}/controller?action=GoRegisterUser" class="btn btn-secondary">Daftar</a>
        </div>
    </div>

</body>
</html>