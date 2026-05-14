<%-- 
    Document   : ubahprofil
    Created on : Jun 8, 2025, 5:45:58 PM
    Author     : LENOVO
--%>

<%-- /TubesPBO/web/WEB-INF/page/user/ubahprofil.jsp --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ubah Profil - TickUs</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <%-- Blok <style> sudah dihapus karena semua gaya sekarang ada di all.css --%>
    </head>
    <body>
        <div class="mobile-container" style="background: #f0f2f5;">

            <jsp:include page="navbar.jsp">
                <jsp:param name="page_title" value="Ubah Profil" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <main class="main-content">
                <%-- Bungkus form dengan div .form-container untuk tampilan kartu --%>
                <div class="form-container">
                    <form action="${pageContext.request.contextPath}/controller?action=UpdateUser" method="post">
                        <input type="hidden" name="userID" value="${sessionScope.user.userID}">

                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" value="${sessionScope.user.username}">
                        </div>
                        <div class="form-group">
                            <label for="namaUser">Nama Lengkap</label>
                            <input type="text" id="namaUser" name="namaUser" value="${sessionScope.user.namaUser}">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="${sessionScope.user.email}">
                        </div>
                        <div class="form-group">
                            <label for="noTelp">Nomor Telepon</label>
                            <input type="tel" id="noTelp" name="noTelp" value="${sessionScope.user.noTelp}">
                        </div>
                        <div class="form-group">
                            <label for="jenisKelamin">Jenis Kelamin</label>
                            <select id="jenisKelamin" name="jenisKelamin">
                                <option value="true" ${sessionScope.user.jenisKelamin ? 'selected' : ''}>Laki-Laki</option>
                                <option value="false" ${!sessionScope.user.jenisKelamin ? 'selected' : ''}>Perempuan</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tanggalLahir">Tanggal Lahir</label>
                            <%-- Format tanggal ke yyyy-MM-dd agar bisa ditampilkan di input --%>
                            <fmt:formatDate value='${sessionScope.user.tanggalLahir}' pattern='yyyy-MM-dd' var="formattedDate" />
                            <input type="date" id="tanggalLahir" name="tanggalLahir" value="${formattedDate}">
                        </div>

                        <%-- Tombol ini sekarang menggunakan style dari .action-button dan .btn-confirm --%>
                        <button type="submit" class="action-button btn-confirm">Konfirmasi Perubahan</button>
                    </form>
                </div>
            </main>
        </div>
    </body>
</html>