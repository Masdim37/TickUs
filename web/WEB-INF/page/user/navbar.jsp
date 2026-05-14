<%-- 
    Document   : navbar
    Created on : Jun 8, 2025, 6:55:29 PM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="top-navbar">
    <%-- Tampilkan tombol kembali hanya jika parameter back_url diberikan --%>
    <c:if test="${not empty param.back_url}">
        <a href="${param.back_url}" class="navbar-action"><i class="fa-solid fa-arrow-left"></i></a>
    </c:if>
    
    <%-- Div kosong ini sebagai penyeimbang jika tidak ada tombol kembali --%>
    <c:if test="${empty param.back_url}">
        <div></div>
    </c:if>

    <%-- Tampilkan judul halaman dari parameter --%>
    <h1>${param.page_title}</h1>
    
    <%-- Tampilkan logo hanya jika parameter show_logo bernilai true --%>
    <c:if test="${param.show_logo == 'true'}">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="TickUs Logo" class="navbar-logo">
    </c:if>

    <%-- Div kosong ini sebagai penyeimbang jika tidak ada logo --%>
    <c:if test="${param.show_logo != 'true'}">
        <div></div>
    </c:if>
</header>