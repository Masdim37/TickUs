<%-- 
    Document   : pilihkursi
    Created on : Jun 9, 2025, 4:32:59 PM
    Author     : LENOVO
--%>

<%-- web/WEB-INF/page/order/pilihkursi.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="id_ID"/>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pilih Kursi - ${film.judul}</title>
        <link rel="stylesheet" href="assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <%-- CSS Khusus untuk halaman ini --%>
        <style>
            .seat-selection-container {
                padding: 16px;
            }
            .screen {
                width: 80%;
                /* Ubah 24px menjadi 40px atau sesuai selera Anda */
                margin: 0 auto 100px auto;
                background: #333;
                color: white;
                text-align: center;
                padding: 8px;
                border-radius: 4px;
                font-weight: bold;
            }
            .seat-grid {
                display: grid;
                grid-template-columns: repeat(8, 1fr);
                gap: 8px;
                justify-items: center;
            }
            .seat {
                width: 35px;
                height: 35px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 4px;
                cursor: pointer;
                font-weight: 500;
                font-size: 12px;
            }
            .seat.tersedia {
                background-color: #d6d6d6;
                border: 1px solid #a0a0a0;
            }
            .seat.tersedia:hover {
                background-color: #c0c0c0;
            }
            .seat.dipilih {
                background-color: #2a6dd4;
                color: white;
                border: 1px solid #1e4b94;
            }
            .seat.tidak-tersedia {
                background-color: #e74c3c;
                border: 1px solid #c0392b;
                cursor: not-allowed;
            }
            .legend {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin-bottom: 24px;
            }
            .legend-item {
                display: flex;
                align-items: center;
                gap: 8px;
            }
            .legend-item .box {
                width: 20px;
                height: 20px;
                border-radius: 2px;
            }
            .summary-bar {
                position: fixed;
                bottom: 82px; /* Disesuaikan agar pas di atas tombol konfirmasi */
                left: 50%;
                transform: translateX(-50%);

                /* INI KUNCI PERBAIKANNYA */
                width: 100%;
                max-width: 420px; /* Samakan dengan max-width .mobile-container */
                box-sizing: border-box; /* Pastikan padding tidak menambah lebar */

                background: #fff;
                padding: 16px;
                border-top: 1px solid #e0e0e0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                z-index: 1001; /* Pastikan di atas konten lain */
            }
            .summary-item {
                flex-basis: 50%;
            }
            .summary-item .label {
                font-size: 14px;
                color: #666;
            }
            .summary-item .value {
                font-size: 20px;
                font-weight: 700;
            }
            #pilihan-kursi-display {
                color: #2a6dd4;
            }
            #total-harga-display {
                color: #c00000;
            }
            .main-content-with-bottom-bar {
                padding-bottom: 200px !important;
            }
        </style>
    </head>
    <body>
        <div class="mobile-container">
            <jsp:include page="../user/navbar.jsp">
                <jsp:param name="page_title" value="Pilih Kursi" />
                <jsp:param name="show_logo" value="true" />
                <jsp:param name="back_url" value="javascript:history.back()" />
            </jsp:include>

            <div class="main-content main-content-with-bottom-bar" style="padding-top: 80px;">
                <div class="seat-selection-container">
                    <div class="legend">
                        <div class="legend-item"><div class="box" style="background: #d6d6d6;"></div> Tersedia</div>
                        <div class="legend-item"><div class="box" style="background: #2a6dd4;"></div> Dipilih</div>
                        <div class="legend-item"><div class="box" style="background: #e74c3c;"></div> Tidak Tersedia</div>
                    </div>

                    <div class="screen">LAYAR</div>

                    <div class="seat-grid">
                        <c:forEach var="kursi" items="${kursiList}">
                            <div class="seat ${kursi.statusIsi.toLowerCase().replace(' ', '-')}" 
                                 data-kursi-id="${kursi.kursiID}" 
                                 data-nomor-kursi="${kursi.nomorKursi}"
                                 data-status="${kursi.statusIsi}">
                                ${kursi.nomorKursi}
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <form id="order-form" action="controller?action=GoToPayment" method="POST">
                <input type="hidden" name="jadwalTayangID" value="${jadwalTayangID}">
                <input type="hidden" id="hargaPerTiket" name="hargaPerTiket" value="${hargaPerTiket}">
                <%-- Input ini akan diisi oleh JavaScript --%>
                <input type="hidden" id="selected-seats-input" name="selectedSeats">

                <div class="summary-bar">
                    <div class="summary-item">
                        <div class="label">Total Harga</div>
                        <div class="value" id="total-harga-display">Rp 0</div>
                    </div>
                    <div class="summary-item">
                        <div class="label">Pilihan Kursi</div>
                        <div class="value" id="pilihan-kursi-display">-</div>
                    </div>
                </div>

                <div class="bottom-action-bar">
                    <button type="submit" class="action-button btn-confirm" id="konfirmasi-btn" disabled>
                        <i class=""></i> KONFIRMASI PEMBELIAN
                    </button>
                </div>
            </form>
        </div>

        <script>
            const hargaPerTiket = parseFloat(document.getElementById('hargaPerTiket').value);
            const kursiGrid = document.querySelector('.seat-grid');
            const totalHargaDisplay = document.getElementById('total-harga-display');
            const pilihanKursiDisplay = document.getElementById('pilihan-kursi-display');
            const konfirmasiBtn = document.getElementById('konfirmasi-btn');
            const selectedSeatsInput = document.getElementById('selected-seats-input');

            let selectedSeats = new Map(); // Menggunakan Map untuk menyimpan ID dan nomor kursi

            kursiGrid.addEventListener('click', function (e) {
                const seat = e.target.closest('.seat');
                if (!seat || seat.dataset.status !== 'Tersedia') {
                    return; // Abaikan jika bukan kursi tersedia yang diklik
                }

                const kursiId = seat.dataset.kursiId;
                const nomorKursi = seat.dataset.nomorKursi;

                // Toggle pemilihan kursi
                if (seat.classList.contains('dipilih')) {
                    seat.classList.remove('dipilih');
                    selectedSeats.delete(kursiId);
                } else {
                    seat.classList.add('dipilih');
                    selectedSeats.set(kursiId, nomorKursi);
                }

                updateSummary();
            });

            function updateSummary() {
                const totalHarga = selectedSeats.size * hargaPerTiket;
                const kursiArray = Array.from(selectedSeats.values()).sort();

                // Update tampilan total harga
                totalHargaDisplay.textContent = 'Rp ' + new Intl.NumberFormat('id-ID').format(totalHarga);

                // Update tampilan pilihan kursi
                if (kursiArray.length > 0) {
                    pilihanKursiDisplay.textContent = kursiArray.join(', ');
                } else {
                    pilihanKursiDisplay.textContent = '-';
                }

                // Update input hidden untuk form
                selectedSeatsInput.value = Array.from(selectedSeats.keys()).join(',');

                // Aktifkan/nonaktifkan tombol konfirmasi
                konfirmasiBtn.disabled = selectedSeats.size === 0;
            }
        </script>
    </body>
</html>