<%-- 
    Document   : footer
    Created on : Jun 8, 2025, 4:33:09 PM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="bottom-nav">
    <a href="${pageContext.request.contextPath}/controller?action=GoHomeUser" class="nav-item">
        <i class="fa-solid fa-house"></i>
        <span>Beranda</span>
    </a>
    <a href="${pageContext.request.contextPath}/controller?action=GoTiketSaya" class="nav-item">
        <i class="fa-solid fa-ticket"></i>
        <span>Tiket Saya</span>
    </a>
    <a href="${pageContext.request.contextPath}/controller?action=GoListBioskop" class="nav-item">
        <i class="fa-solid fa-clapperboard"></i>
        <span>Bioskop</span>
    </a>
    <a href="${pageContext.request.contextPath}/controller?action=GoAkunSaya" class="nav-item">
        <i class="fa-solid fa-user"></i>
        <span>Akun Saya</span>
    </a>
</footer>