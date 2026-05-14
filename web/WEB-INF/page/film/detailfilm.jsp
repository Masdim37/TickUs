<%--
    Document   : detailfilm
    Created on : Jun 9, 2025, 3:23:50 PM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Tag library ini WAJIB ditambahkan untuk memformat tanggal dan angka --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Mengatur format tanggal dan angka ke Bahasa Indonesia --%>
<fmt:setLocale value="id_ID"/>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pesan Tiket: ${film.judul}</title>
        <link rel="stylesheet" href="assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <div class="mobile-container">

            <%-- Menggunakan include untuk navbar adalah ide yang bagus. Ini kita pertahankan. --%>
            <jsp:include page="../user/navbar.jsp">
                <jsp:param name="page_title" value="Film" />
                <jsp:param name="show_logo" value="true" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <div class="main-content main-content-with-bottom-bar" style="padding-top: 80px;">

                <div class="film-poster-container">
                    <%-- Menggunakan filmID lebih aman daripada judul untuk nama file gambar --%>
                    <img src="assets/images/${film.judul}.png" alt="${film.judul}">
                </div>

                <div class="film-info-grid">
                    <div class="label">Judul</div>
                    <div class="value">${film.judul}</div>

                    <div class="label">Sutradara</div>
                    <div class="value">${film.sutradara}</div>

                    <div class="label">Durasi</div>
                    <div class="value">${film.durasi} Menit</div>

                    <div class="label">Rating Usia</div>
                    <div class="value">${film.ratingUsia}</div>
                </div>

                <hr style="border: none; border-top: 1px solid #ddd; margin: 24px 0;">

                <h3 class="cinema-location-header">${bioskop.namaBioskop}</h3>

                <form action="controller?action=GoPilihKursi" method="POST" class="schedule-form">
                    <input type="hidden" name="filmID" value="${film.filmID}">
                    <input type="hidden" name="bioskopID" value="${bioskop.bioskopID}">

                    <%-- KOREKSI 1: Urutan dropdown diubah. TANGGAL terlebih dahulu. --%>
                    <div class="form-group">
                        <label for="tanggal-select">Pilih Tanggal Tayang</label>
                        <select id="tanggal-select" name="tanggalTayang">
                            <option value="">Pilih...</option>
                            <%-- Loop ini mengisi dropdown tanggal dari data 'jadwalLengkap' --%>
                            <c:forEach var="entry" items="${jadwalLengkap}">
                                <option value="${entry.key}">
                                    <fmt:formatDate value="${entry.key}" type="date" pattern="EEEE, dd MMM yyyy" />
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="ruang-select">Pilih Kelas Ruangan</label>
                        <select id="ruang-select" name="tipeRuang" disabled>
                            <option value="">Pilih tanggal...</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="jam-select">Pilih Jam Tayang</label>
                        <select id="jam-select" name="jamTayang" disabled>
                            <option value="">Pilih kelas...</option>
                        </select>
                    </div>

                    <%-- INI KODE BARU YANG SUDAH DIPERBAIKI --%>
                    <div id="price-container" class="form-group" style="display: none;">
                        <label>Harga per Tiket</label>
                        <div class="form-control-static">
                            <span id="harga-tiket"></span>
                        </div>
                    </div>

                    <div class="bottom-action-bar">
                        <button type="submit" class="action-button btn-confirm" id="beli-tiket-btn" disabled>
                            <i class="fas fa-ticket-alt"></i> BELI TIKET
                        </button>
                    </div>
                </form>
            </div>

        </div>

        <%-- KOREKSI 3: Seluruh SCRIPT di bawah ini ditulis ulang sesuai logika yang benar --%>
        <script>
            // Data lengkap dari backend diubah menjadi objek JavaScript
            const jadwalLengkapData = {
            <c:forEach var="dateEntry" items="${jadwalLengkap}" varStatus="dateLoop">
            "${dateEntry.key}": {
                <c:forEach var="ruangEntry" items="${dateEntry.value}" varStatus="ruangLoop">
            "${ruangEntry.key}": {
            "harga": ${ruangEntry.value.get('harga')},
                    "jam": [
                    <c:forEach var="jam" items="${ruangEntry.value.get('jam')}" varStatus="jamLoop">
                    "${jam}"<c:if test="${!jamLoop.last}">,</c:if>
                    </c:forEach>
                    ]
            }<c:if test="${!ruangLoop.last}">,</c:if>
                </c:forEach>
            }<c:if test="${!dateLoop.last}">,</c:if>
            </c:forEach>
            };
            // Deklarasi semua elemen form yang akan kita manipulasi
            const tanggalSelect = document.getElementById('tanggal-select');
            const ruangSelect = document.getElementById('ruang-select');
            const jamSelect = document.getElementById('jam-select');
            const priceContainer = document.getElementById('price-container');
            const hargaTiketElem = document.getElementById('harga-tiket');
            const beliBtn = document.getElementById('beli-tiket-btn');
            // Fungsi untuk mereset pilihan di bawahnya
            function resetRuang() {
            ruangSelect.innerHTML = '<option value="">Pilih tanggal...</option>';
            ruangSelect.disabled = true;
            resetJam();
            }
            function resetJam() {
            jamSelect.innerHTML = '<option value="">Pilih kelas...</option>';
            jamSelect.disabled = true;
            priceContainer.style.display = 'none'; // Sembunyikan harga
            beliBtn.disabled = true;
            }

            // === LOGIKA INTI: EVENT LISTENER BERANTAI ===

            // 1. Jika TANGGAL berubah...
            tanggalSelect.addEventListener('change', function() {
            const selectedDate = this.value;
            resetRuang(); // Reset pilihan kelas dan jam

            if (selectedDate && jadwalLengkapData[selectedDate]) {
            ruangSelect.disabled = false;
            ruangSelect.innerHTML = '<option value="">Pilih...</option>';
            const jadwalHariIni = jadwalLengkapData[selectedDate];
            // Isi dropdown kelas ruangan dengan data yang relevan
            for (const tipeRuang in jadwalHariIni) {
            const option = document.createElement('option');
            option.value = tipeRuang;
            option.textContent = tipeRuang;
            ruangSelect.appendChild(option);
            }
            }
            });
            // 2. Jika KELAS RUANGAN berubah...
            ruangSelect.addEventListener('change', function() {
            const selectedDate = tanggalSelect.value;
            const selectedRuang = this.value;
            resetJam(); // Reset pilihan jam

            if (selectedDate && selectedRuang && jadwalLengkapData[selectedDate][selectedRuang]) {
            const detail = jadwalLengkapData[selectedDate][selectedRuang];
            // Tampilkan harga
            hargaTiketElem.textContent = 'Rp. ' + new Intl.NumberFormat('id-ID').format(detail.harga);
            // Pastikan display diatur ke 'flex' karena kita menggunakan .form-group
            priceContainer.style.display = 'flex';
            // Isi dropdown jam tayang
            jamSelect.disabled = false;
            jamSelect.innerHTML = '<option value="">Pilih...</option>';
            detail.jam.forEach(function(jam) {
            const option = document.createElement('option');
            option.value = jam;
            option.textContent = jam.substring(0, 5); // Format HH:MM
            jamSelect.appendChild(option);
            });
            }
            });
            // 3. Jika JAM TAYANG berubah...
            jamSelect.addEventListener('change', function(){
            // Aktifkan tombol "Beli Tiket" hanya jika jam sudah dipilih
            beliBtn.disabled = !this.value;
            });
        </script>
    </body>
</html>