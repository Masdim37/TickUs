/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.service;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TiketService {

    // =================================== KODE YANG DIPERBAIKI ===================================
    // Menggunakan ANY_VALUE() untuk setiap kolom yang tidak diagregasi
    // untuk mengatasi error 'only_full_group_by' di MySQL.
    private final String BASE_QUERY = "SELECT "
            + "o.orderID, ANY_VALUE(p.paymentID) AS paymentID, o.totalHarga, "
            + "ANY_VALUE(f.judul) AS judul, ANY_VALUE(f.ratingUsia) AS ratingUsia, ANY_VALUE(f.filmID) AS filmID, "
            + "ANY_VALUE(b.namaBioskop) AS namaBioskop, ANY_VALUE(rb.tipeRuang) AS tipeRuang, ANY_VALUE(rb.namaruang) AS namaruang, "
            + "ANY_VALUE(jt.tanggalTayang) AS tanggalTayang, ANY_VALUE(jt.jamTayang) AS jamTayang, "
            + "GROUP_CONCAT(k.nomorKursi ORDER BY k.nomorKursi SEPARATOR ', ') AS kursi_list "
            + "FROM `order` o "
            + "LEFT JOIN `payment` p ON o.orderID = p.orderID "
            + "JOIN `tiket` t ON o.orderID = t.orderID "
            + "JOIN `kursi` k ON t.kursiID = k.kursiID "
            + "JOIN `jadwal_tayang` jt ON t.jadwalTayangID = jt.jadwalTayangID "
            + "JOIN `film` f ON jt.filmID = f.filmID "
            + "JOIN `ruang_bioskop` rb ON jt.ruangID = rb.ruangID "
            + "JOIN `bioskop` b ON rb.bioskopID = b.bioskopID ";
    // ==========================================================================================
    //query ini intinya melakukan JOIN dari tabel order, payment. tiket, kursi, jadwal tayang, film,
    //ruang bioskop, dan bioskop untuk mengambil data yg diperlukan
    
    //method getTiketForUser untuk mengambil semua data tiket berdasarkan userID tertentu
    public List<Map<String, Object>> getTiketForUser(String userID) {
        List<Map<String, Object>> daftarTiket = new ArrayList<>();
        //lanjutan query disaring berdasarkan userID dan dikelompokkan per orderID
        String query = BASE_QUERY + "WHERE o.userID = ? GROUP BY o.orderID ORDER BY o.tanggalOrder DESC";

        try (Connection conn = DatabaseHelper.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                daftarTiket.add(mapResultSetToMap(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return daftarTiket;
    }
    
    //method getDetailTiket untuk mendapatkan detail tiket yang dipesan berdasarkan orderID tertentu
    public Map<String, Object> getDetailTiket(String orderID) {
        Map<String, Object> tiket = null;
        //lanjutan query disaring berdasarkan orderID dan dikelompokkan per orderID
        String query = BASE_QUERY + "WHERE o.orderID = ? GROUP BY o.orderID";

        try (Connection conn = DatabaseHelper.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, orderID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tiket = mapResultSetToMap(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tiket;
    }
    
    //method ini intinya mengubah baris data hasil query ResultSet menjadi sebua Map
    private Map<String, Object> mapResultSetToMap(ResultSet rs) throws SQLException {
        Map<String, Object> tiketMap = new HashMap<>();
        //memetakan data kedalam Map
        tiketMap.put("orderID", rs.getString("orderID"));
        tiketMap.put("paymentID", rs.getString("paymentID"));
        tiketMap.put("totalHarga", rs.getDouble("totalHarga"));
        tiketMap.put("judulFilm", rs.getString("judul"));
        tiketMap.put("ratingUsia", rs.getString("ratingUsia"));
        tiketMap.put("namaBioskop", rs.getString("namaBioskop"));
        tiketMap.put("namaRuang", rs.getString("namaruang"));
        tiketMap.put("tipeRuang", rs.getString("tipeRuang")); 
        tiketMap.put("tanggalTayang", rs.getDate("tanggalTayang"));
        tiketMap.put("posterPath", "assets/images/" + rs.getString("judul") + ".png");

        java.time.LocalTime jam = rs.getTime("jamTayang").toLocalTime();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        tiketMap.put("jamTayang", jam.format(formatter));

        String kursiListStr = rs.getString("kursi_list");
        if (kursiListStr != null) {
            tiketMap.put("nomorKursi", Arrays.asList(kursiListStr.split(", ")));
        } else {
            tiketMap.put("nomorKursi", new ArrayList<String>());
        }

        return tiketMap;
    }
}
