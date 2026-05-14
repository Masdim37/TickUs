/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// src/java/com/mvc/crud/service/OrderService.java
package com.mvc.crud.service;

import com.mvc.crud.model.Kursi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderService {

    /**
     * Metode untuk mendapatkan detail jadwal spesifik (ID, Ruang, Harga).
     * Ditempatkan di sini karena ini adalah langkah pertama dalam alur
     * pemesanan.
     */
    //method untuk mendapatkan jadwal detail spesifik
    public Map<String, Object> getJadwalDetailSpesifik(String filmID, String bioskopID, Date tanggal, LocalTime jam, String tipeRuang) {
        Map<String, Object> result = new HashMap<>();
        String query = "SELECT jt.jadwalTayangID, jt.ruangID, COALESCE(rr.harga, rp.harga) as harga "
                + "FROM jadwal_tayang jt "
                + "JOIN ruang_bioskop rb ON jt.ruangID = rb.ruangID "
                + "LEFT JOIN ruang_reguler rr ON rb.ruangID = rr.ruangID "
                + "LEFT JOIN ruang_premium rp ON rb.ruangID = rp.ruangID "
                + "WHERE jt.filmID = ? AND rb.bioskopID = ? AND jt.tanggalTayang = ? AND jt.jamTayang = ? AND rb.tipeRuang = ?";
        //query untuk menemukan record jadwal yang cocok
        
        try (Connection conn = DatabaseHelper.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, filmID);
            ps.setString(2, bioskopID);
            ps.setDate(3, new java.sql.Date(tanggal.getTime()));
            ps.setTime(4, Time.valueOf(jam));
            ps.setString(5, tipeRuang);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    result.put("jadwalTayangID", rs.getString("jadwalTayangID"));
                    result.put("ruangID", rs.getString("ruangID"));
                    result.put("harga", rs.getDouble("harga"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * Metode untuk mendapatkan daftar kursi beserta statusnya untuk sebuah
     * jadwal tayang.
     */
    //method untuk mengecek kursi mana saja yang sudah terisi untuk jadwal tayang tersebut
    public List<Kursi> getKursiStatusForJadwal(String ruangID, String jadwalTayangID) {
        List<Kursi> kursiList = new ArrayList<>();
        String query = "SELECT k.kursiID, k.nomorKursi, k.ruangID, "
                + "CASE WHEN t.tiketID IS NOT NULL THEN 'Tidak Tersedia' ELSE 'Tersedia' END as status "
                + "FROM kursi k "
                + "LEFT JOIN tiket t ON k.kursiID = t.kursiID AND t.jadwalTayangID = ? "
                + "WHERE k.ruangID = ? "
                + "ORDER BY SUBSTRING(k.nomorKursi, 1, 1), CAST(SUBSTRING(k.nomorKursi, 2) AS UNSIGNED)";

        try (Connection conn = DatabaseHelper.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, jadwalTayangID);
            ps.setString(2, ruangID);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Kursi kursi = new Kursi(
                            rs.getString("kursiID"),
                            rs.getString("nomorKursi"),
                            rs.getString("status"),
                            null, null
                    );
                    kursiList.add(kursi);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return kursiList;
    }

    public Map<String, Object> getDisplayDetailForJadwal(String jadwalTayangID) {
        Map<String, Object> displayDetail = new HashMap<>();
        String query = "SELECT "
                + "f.judul, f.ratingUsia, jt.jadwalTayangID, "
                + "b.namaBioskop, rb.namaruang, rb.tipeRuang, "
                + "jt.tanggalTayang, jt.jamTayang "
                + "FROM jadwal_tayang jt "
                + "JOIN film f ON jt.filmID = f.filmID "
                + "JOIN ruang_bioskop rb ON jt.ruangID = rb.ruangID "
                + "JOIN bioskop b ON rb.bioskopID = b.bioskopID "
                + "WHERE jt.jadwalTayangID = ?";

        try (Connection conn = DatabaseHelper.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, jadwalTayangID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                displayDetail.put("judulFilm", rs.getString("judul"));
                displayDetail.put("ratingUsia", rs.getString("ratingUsia"));
                displayDetail.put("jadwalTayangID", rs.getString("jadwalTayangID"));
                displayDetail.put("namaBioskop", rs.getString("namaBioskop"));
                displayDetail.put("namaRuang", rs.getString("namaruang"));
                displayDetail.put("tipeRuang", rs.getString("tipeRuang"));
                displayDetail.put("tanggalTayang", rs.getDate("tanggalTayang"));
                displayDetail.put("jamTayang", rs.getTime("jamTayang").toLocalTime().toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return displayDetail;
    }

    public List<String> getNomorKursiByIDs(List<String> kursiIDs) {
        List<String> nomorKursiList = new ArrayList<>();
        if (kursiIDs == null || kursiIDs.isEmpty()) {
            return nomorKursiList;
        }

        // Membuat placeholder (?,?,?) sesuai jumlah ID
        String placeholders = String.join(",", java.util.Collections.nCopies(kursiIDs.size(), "?"));
        String query = "SELECT nomorKursi FROM kursi WHERE kursiID IN (" + placeholders + ")";

        try (Connection conn = DatabaseHelper.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            // Mengisi placeholder dengan ID kursi
            int i = 1;
            for (String id : kursiIDs) {
                ps.setString(i++, id);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                nomorKursiList.add(rs.getString("nomorKursi"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nomorKursiList;
    }
}
