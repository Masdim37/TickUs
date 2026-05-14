/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import com.mvc.crud.model.Bioskop;
import com.mvc.crud.model.Film;

import java.util.HashMap;
import java.time.LocalTime;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class BioskopService {

    /**
     * Mengambil semua data bioskop dari database.
     */
    //method ini digunakan untuk mengambil semua data bioskop dari database
    public List<Bioskop> getAllBioskop() {
        //disimpan kedalam arraylist
        List<Bioskop> bioskopList = new ArrayList<>();
        // Query untuk mengambil semua data dari tabel bioskop
        String query = "SELECT bioskopID, namaBioskop, lokasiBioskop, brandBioskop, jumlahRuangan FROM bioskop";

        try (Connection connection = DatabaseHelper.getConnection(); PreparedStatement statement = connection.prepareStatement(query); ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                // Membuat objek Bioskop untuk setiap baris data
                Bioskop bioskop = new Bioskop(
                        rs.getString("bioskopID"),
                        rs.getString("namaBioskop"),
                        rs.getString("lokasiBioskop"),
                        rs.getString("brandBioskop"),
                        rs.getInt("jumlahRuangan")
                );
                bioskopList.add(bioskop);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //mereturn List bioskopList
        return bioskopList;
    }

    //method untuk menampilkan data bioskop dari bioskopID
    public Bioskop getBioskopById(String bioskopID) {
        Bioskop bioskop = null;
        String query = "SELECT * FROM bioskop WHERE bioskopID = ?";
        try (Connection connection = DatabaseHelper.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, bioskopID);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    bioskop = new Bioskop(
                            rs.getString("bioskopID"),
                            rs.getString("namaBioskop"),
                            rs.getString("lokasiBioskop"),
                            rs.getString("brandBioskop"),
                            rs.getInt("jumlahRuangan")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bioskop;
    }

    //mengambil film yang sedang tayang dari bioskopID berdasarkan jadwal
    public List<Film> getFilmsForBioskop(String bioskopID, java.sql.Date tanggal) {
        List<Film> filmList = new ArrayList<>();
        //query ini mengambil data film yang unik (DISTINCT) berdasarkan jadwal yang ada
        String query = "SELECT DISTINCT f.filmID, f.judul, f.sutradara, f.durasi, f.ratingUsia "
                + "FROM film f "
                + "JOIN jadwal_tayang jt ON f.filmID = jt.filmID "
                + "JOIN ruang_bioskop rb ON jt.ruangID = rb.ruangID "
                + "WHERE rb.bioskopID = ? AND jt.tanggalTayang = ?";

        try (Connection connection = DatabaseHelper.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, bioskopID);
            statement.setDate(2, tanggal);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Film film = new Film(
                            rs.getString("filmID"),
                            rs.getString("judul"),
                            rs.getString("sutradara"),
                            rs.getString("ratingUsia"),
                            rs.getInt("durasi")
                    );
                    filmList.add(film);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return filmList;
    }

    //method untuk mengambil semua semua jadwal, tipe ruang, jam, dan harga
    public Map<Date, Map<String, Map<String, Object>>> getLengkapJadwal(String filmID, String bioskopID) {
        Map<Date, Map<String, Map<String, Object>>> jadwalLengkap = new LinkedHashMap<>();

        String query = "SELECT "
                + "jt.tanggalTayang, "
                + "rb.tipeRuang, "
                + "jt.jamTayang, "
                + "COALESCE(rr.harga, rp.harga) as harga "
                + "FROM jadwal_tayang jt "
                + "JOIN ruang_bioskop rb ON jt.ruangID = rb.ruangID "
                + "LEFT JOIN ruang_reguler rr ON rb.ruangID = rr.ruangID "
                + "LEFT JOIN ruang_premium rp ON rb.ruangID = rp.ruangID "
                + "WHERE jt.filmID = ? "
                + "  AND rb.bioskopID = ? "
                + "  AND jt.tanggalTayang >= CURDATE() "
                + "ORDER BY jt.tanggalTayang, rb.tipeRuang, jt.jamTayang";

        try (Connection connection = DatabaseHelper.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, filmID);
            statement.setString(2, bioskopID);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Date tanggal = rs.getDate("tanggalTayang");
                    String tipeRuang = rs.getString("tipeRuang");
                    LocalTime jam = rs.getTime("jamTayang").toLocalTime();
                    double harga = rs.getDouble("harga");

                    //Langkah 1: Dapatkan atau buat Map untuk tanggal
                    Map<String, Map<String, Object>> jadwalPerRuang = jadwalLengkap.computeIfAbsent(tanggal, k -> new LinkedHashMap<>());

                    //Langkah 2: Dapatkan atau buat Map untuk tipe ruang
                    Map<String, Object> detail = jadwalPerRuang.computeIfAbsent(tipeRuang, k -> new HashMap<>());

                    //Langkah 3: Isi data harga dan jam tayang
                    detail.put("harga", harga); // Simpan harga

                    //Dapatkan atau buat list untuk jam tayang
                    List<LocalTime> listJam = (List<LocalTime>) detail.computeIfAbsent("jam", k -> new ArrayList<>());
                    listJam.add(jam); // Tambahkan jam ke list
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jadwalLengkap;
    }

// Anda juga perlu metode untuk mengambil detail satu film saja
    public Film getFilmById(String filmID) {
        Film film = null;
        String query = "SELECT * FROM film WHERE filmID = ?";
        try (Connection connection = DatabaseHelper.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, filmID);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    film = new Film(
                            rs.getString("filmID"),
                            rs.getString("judul"),
                            rs.getString("sutradara"),
                            rs.getString("ratingUsia"),
                            rs.getInt("durasi")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return film;
    }
}
