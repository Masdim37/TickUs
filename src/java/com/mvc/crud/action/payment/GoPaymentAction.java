/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.payment;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.service.DatabaseHelper;
import com.mvc.crud.service.OrderService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class GoPaymentAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession();

        String jadwalTayangID = request.getParameter("jadwalTayangID");
        String selectedSeatsStr = request.getParameter("selectedSeats");
        double hargaPerTiket = Double.parseDouble(request.getParameter("hargaPerTiket"));

        if (selectedSeatsStr == null || selectedSeatsStr.isEmpty()) {
            request.setAttribute("errorMessage", "Anda belum memilih kursi.");
            return "order/pilihkursi.jsp"; // Kembali jika tidak ada kursi dipilih
        }

        OrderService orderService = DatabaseHelper.getOrderService();
        // Panggil service yang mengembalikan Map
        Map<String, Object> pendingOrder = orderService.getDisplayDetailForJadwal(jadwalTayangID);

        // 1. Ini adalah daftar ID yang kita butuhkan untuk transaksi (sudah benar)
        List<String> kursiIDList = Arrays.asList(selectedSeatsStr.split(","));

        // 2. Panggil metode baru untuk mendapatkan nomor kursi untuk ditampilkan
        List<String> nomorKursiList = orderService.getNomorKursiByIDs(kursiIDList);

        // 3. Simpan KEDUA list ke dalam Map dengan key yang berbeda
        pendingOrder.put("kursiIDs", kursiIDList); // Untuk dikirim ke PaymentService
        pendingOrder.put("nomorKursiList", nomorKursiList); // Untuk ditampilkan di JSP

        // 4. Informasi lainnya tetap sama
        pendingOrder.put("jumlahTiket", kursiIDList.size());
        pendingOrder.put("totalHarga", hargaPerTiket * kursiIDList.size());
        pendingOrder.put("hargaPerTiket", hargaPerTiket); // Simpan juga harga per tiket

        session.setAttribute("pendingOrder", pendingOrder);

        return "payment/pembayaran.jsp";
    }
}
