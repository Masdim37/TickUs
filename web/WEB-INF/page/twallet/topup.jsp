<%-- 
    Document   : topup
    Created on : Jun 10, 2025, 7:50:33 AM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Halaman Top Up</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* Mengatur tata letak navbar atas */
            .top-navbar-custom {
                justify-content: flex-start;
                align-items: center;
            }
            .top-navbar-custom .back-arrow {
                font-size: 20px;
                color: white;
                text-decoration: none;
                margin-right: 16px;
            }

            /* Menghilangkan gaya default dari form container */
            .form-container-topup {
                background-color: white; /* Memberi background putih seperti di gambar */
                box-shadow: none;
                border: none;
                padding: 24px;
                height: calc(100vh - 150px); /* Memastikan form mengisi ruang yang tersedia */
            }

            /* Gaya untuk label form */
            .form-group-topup label {
                font-size: 16px;
                color: #555;
                display: block;
                margin-bottom: 8px;
            }

            /* Gaya untuk input nominal yang menjadi fokus utama */
            .form-group-topup input[type="number"] {
                width: 100%;
                border: none; /* Hilangkan semua border */
                border-bottom: 1px solid #ddd; /* Tambahkan garis bawah tipis */
                border-radius: 0;
                background-color: transparent;
                font-size: 36px; /* Ukuran font lebih besar */
                font-weight: 700; /* Teks tebal */
                padding: 10px 0;
                margin-bottom: 24px; /* Jarak ke elemen berikutnya */
                color: #333;
            }

            /* Hilangkan panah atas/bawah pada input number */
            .form-group-topup input[type=number]::-webkit-inner-spin-button,
            .form-group-topup input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            .form-group-topup input[type=number] {
                -moz-appearance: textfield;
            }

            /* Efek saat input di-klik */
            .form-group-topup input[type="number"]:focus {
                outline: none;
                box-shadow: none;
                border-bottom-color: #c00000; /* Garis bawah menjadi merah */
            }

            /* Gaya untuk checkbox persetujuan */
            .agreement {
                display: flex;
                align-items: center;
                margin-top: 20px;
                color: #555;
            }
            .agreement input[type="checkbox"] {
                margin-right: 12px;
                width: 18px;
                height: 18px;
            }

            /* Gaya untuk pesan error */
            .error-message {
                color: #dc3545;
                text-align: center;
                margin-bottom: 16px;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <div class="mobile-container" style="background-color: white;">
            <div class="top-navbar top-navbar-custom">
                <a href="javascript:history.back()" class="back-arrow"><i class="fas fa-arrow-left"></i></a>
                <h1>Halaman Top Up</h1>
            </div>

            <div class="main-content" style="padding-top: 70px; padding-bottom: 90px;">
                <div class="form-container form-container-topup">
                    <form action="controller?action=ProsesTopUp" method="post">

                        <c:if test="${not empty error}">
                            <p class="error-message">${error}</p>
                        </c:if>

                        <div class="form-group form-group-topup">
                            <label for="amount">Masukkan Nominal Top-Up Anda :</label>
                            <input type="number" id="amount" name="amount" placeholder="isi nominal..." required>
                        </div>

                        <div class="agreement">
                            <input type="checkbox" id="agreement" name="agreement" required>
                            <label for="agreement">Saya menyetujui bahwa nominal yang saya masukkan adalah benar</label>
                        </div>

                        <div class="bottom-action-bar" style="background-color: white; box-shadow: none;">
                            <button type="submit" class="action-button btn-confirm" style="border-radius: 12px;">KONFIRMASI TOP UP</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>