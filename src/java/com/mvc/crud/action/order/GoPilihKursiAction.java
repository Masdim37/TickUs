/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// src/java/com/mvc/crud/action/order/GoPilihKursiAction.java
package com.mvc.crud.action.order;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.Kursi;
import com.mvc.crud.service.OrderService;
import com.mvc.crud.service.DatabaseHelper;
import jakarta.servlet.http.HttpServletRequest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class GoPilihKursiAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        try {
            //Ambil semua parameter
            String filmID = request.getParameter("filmID");
            String bioskopID = request.getParameter("bioskopID");
            String tanggalStr = request.getParameter("tanggalTayang");
            String tipeRuang = request.getParameter("tipeRuang");
            String jamStr = request.getParameter("jamTayang");

            //Konversi tipe data tanggal dan jam
            Date tanggal = new SimpleDateFormat("yyyy-MM-dd").parse(tanggalStr);
            LocalTime jam = LocalTime.parse(jamStr);

            //Gunakan OrderService untuk logika terkait pemesanan
            OrderService orderService = DatabaseHelper.getOrderService();
            Map<String, Object> jadwalDetail = orderService.getJadwalDetailSpesifik(filmID, bioskopID, tanggal, jam, tipeRuang);

            if (jadwalDetail.isEmpty()) {
                request.setAttribute("errorMessage", "Jadwal tidak ditemukan.");
                return "error.jsp"; // Halaman error jika jadwal tidak valid
            }
           
            String jadwalTayangID = (String) jadwalDetail.get("jadwalTayangID");
            String ruangID = (String) jadwalDetail.get("ruangID");
            double harga = (double) jadwalDetail.get("harga");

            //Panggil service untuk dapatkan daftar kursi dan statusnya
            List<Kursi> kursiList = orderService.getKursiStatusForJadwal(ruangID, jadwalTayangID);

            //Kirim semua data yang dibutuhkan ke JSP
            request.setAttribute("kursiList", kursiList);
            request.setAttribute("jadwalTayangID", jadwalTayangID);
            request.setAttribute("hargaPerTiket", harga);
            request.setAttribute("film", DatabaseHelper.getBioskopService().getFilmById(filmID));
            
            //arahkan ke pilihkursi.jsp
            return "order/pilihkursi.jsp";

        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Format tanggal atau waktu tidak valid.");
            return "error.jsp";
        }
    }
}
