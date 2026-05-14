<%--
    Document    : akunsaya
    Created on  : Jun 8, 2025, 5:43:47 PM
    Author      : LENOVO
--%>

<%-- /TubesPBO/web/WEB-INF/page/user/akunsaya.jsp --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Akun Saya - TickUs</title>
        <%-- Memastikan path ke all.css sudah benar --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>
    <body>
        <div class="mobile-container" style="background: #f0f2f5;">

            <%-- Sertakan Navbar --%>
            <jsp:include page="navbar.jsp">
                <jsp:param name="page_title" value="Akun Saya" />
                <jsp:param name="show_logo" value="true" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <main class="main-content">
                <div class="profile-summary-akunsaya">
                    <%-- Membuat inisial nama secara dinamis --%>
                    <c:set var="nama" value="${sessionScope.user.namaUser}"/>
                    <c:set var="inisial" value="${nama.substring(0, 1)}"/>

                    <%-- Lingkaran profil dengan bingkai baru --%>
                    <div class="profile-pic">${inisial}</div>

                    <div class="profile-info">
                        <p class="username">${sessionScope.user.namaUser}</p>
                    </div>
                </div>

                <%-- Menampilkan pesan error jika penghapusan gagal --%>
                <%
                    String deleteError = (String) request.getAttribute("deleteError");
                    if (deleteError != null) {
                %>
                <div style="background-color: #f8d7da; color: #721c24; padding: 12px; border-radius: 8px; text-align: center; margin-bottom: 16px;">
                    <%= deleteError%>
                </div>
                <%
                    }
                %>

                <ul class="detail-list">
                    <li>
                        <i class="fa-solid fa-at"></i>
                        <div>
                            <div class="label">Username</div>
                            <div class="value">${sessionScope.user.username}</div>
                        </div>
                    </li>
                    <li>
                        <i class="fa-solid fa-user"></i>
                        <div>
                            <div class="label">Nama Lengkap</div>
                            <div class="value">${sessionScope.user.namaUser}</div>
                        </div>
                    </li>
                    <li>
                        <i class="fa-solid fa-envelope"></i>
                        <div>
                            <div class="label">Email</div>
                            <div class="value">${sessionScope.user.email}</div>
                        </div>
                    </li>
                    <li>
                        <i class="fa-solid fa-phone"></i>
                        <div>
                            <div class="label">Nomor Telepon</div>
                            <div class="value">${sessionScope.user.noTelp}</div>
                        </div>
                    </li>
                    <li>
                        <i class="fa-solid fa-venus-mars"></i>
                        <div>
                            <div class="label">Jenis Kelamin</div>
                            <div class="value">
                                <c:choose>
                                    <c:when test="${sessionScope.user.jenisKelamin}">Laki-Laki</c:when>
                                    <c:otherwise>Perempuan</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </li>
                    <li>
                        <i class="fa-solid fa-calendar-days"></i>
                        <div>
                            <div class="label">Tanggal Lahir</div>
                            <fmt:setLocale value="id_ID"/> 
                            <div class="value"><fmt:formatDate value="${sessionScope.user.tanggalLahir}" pattern="dd MMMM yyyy" /></div>
                        </div>
                    </li>
                </ul>

                <%-- Tombol Aksi --%>
                <ul class="detail-list" style="margin-top: 24px;">
                    <li>
                        <%-- Tombol Keluar (Logout) --%>
                        <form action="${pageContext.request.contextPath}/controller" method="POST" style="display: flex; width: 100%; margin: 0;">
                            <input type="hidden" name="action" value="LogoutUser">
                            <button type="submit" class="list-item-button logout" style="width: 100%;">
                                <i class="fas fa-sign-out-alt"></i>
                                <span>Keluar</span>
                            </button>
                        </form>
                    </li>
                    <li>
                        <%-- Tombol Hapus Akun --%>
                        <form action="${pageContext.request.contextPath}/controller" method="POST" style="display: flex; width: 100%; margin: 0;">
                            <%-- Pastikan value ini sesuai dengan yang ada di conf.properties --%>
                            <input type="hidden" name="action" value="GoHapusAkunSaya">
                            <button type="submit" class="list-item-button delete" style="width: 100%;" onclick="return confirm('Apakah Anda yakin ingin menghapus akun secara permanen? Tindakan ini tidak dapat diurungkan.');">
                                <i class="fa-solid fa-trash-can"></i> Hapus Akun
                            </button>
                        </form>
                    </li>
                </ul>

                <%-- Tombol Ubah Profile --%>
                <a href="${pageContext.request.contextPath}/controller?action=GoUbahProfil" class="action-button btn-edit">Ubah Profile</a>
            </main>

            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>