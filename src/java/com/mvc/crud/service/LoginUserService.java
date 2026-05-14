/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
 /*
 * File: TubesPBO/src/java/com/mvc/crud/service/LoginUserService.java
 */
package com.mvc.crud.service;

import com.mvc.crud.model.User;
import com.mvc.crud.model.TWallet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginUserService {

    private final String SELECT_USER_SQL = "SELECT * FROM User WHERE username = ? AND password = ?";
    private final String SELECT_WALLET_SQL = "SELECT walletID, saldo FROM t_wallet WHERE userID = ?";

    public User login(String usernameInput, String passwordInput) {
        User user = null;
        // Blok try-with-resources utama untuk koneksi database
        try (Connection connection = DatabaseHelper.getConnection()) {

            // Blok try-with-resources untuk mengambil data user
            try (PreparedStatement userStatement = connection.prepareStatement(SELECT_USER_SQL)) {
                userStatement.setString(1, usernameInput);
                userStatement.setString(2, passwordInput);

                try (ResultSet userResultSet = userStatement.executeQuery()) {
                    if (userResultSet.next()) {
                        // User ditemukan, buat objek User
                        user = new User();
                        user.setUserID(userResultSet.getString("userID"));
                        user.setNamaUser(userResultSet.getString("namaUser"));
                        user.setNoTelp(userResultSet.getString("noTelp"));
                        user.setEmail(userResultSet.getString("email"));
                        user.setJenisKelamin(userResultSet.getBoolean("jenisKelamin"));
                        user.setTanggalLahir(userResultSet.getDate("tanggalLahir"));
                        user.setUsername(userResultSet.getString("username"));
                        user.setPassword(userResultSet.getString("password"));

                        // Setelah user ditemukan, gunakan userID untuk mencari wallet-nya
                        try (PreparedStatement walletStatement = connection.prepareStatement(SELECT_WALLET_SQL)) {
                            walletStatement.setString(1, user.getUserID());

                            try (ResultSet walletResultSet = walletStatement.executeQuery()) {
                                if (walletResultSet.next()) {
                                    // Wallet ditemukan, buat objek TWallet
                                    TWallet wallet = new TWallet(
                                            walletResultSet.getString("walletID"),
                                            walletResultSet.getDouble("saldo"),
                                            null, // Asumsi password wallet tidak diambil saat ini
                                            user
                                    );
                                    // Set wallet ke dalam objek user
                                    user.setTwallet(wallet);
                                }
                            } // Kurung kurawal untuk 'walletResultSet' ditutup di sini
                        } // Kurung kurawal untuk 'walletStatement' ditutup di sini
                    }
                } // Kurung kurawal untuk 'userResultSet' ditutup di sini
            } // Kurung kurawal untuk 'userStatement' ditutup di sini

        } catch (SQLException e) { // Blok catch yang benar, menangani semua SQLException di dalam try utama
            e.printStackTrace();
        }
        // Return user di luar blok try-catch
        return user;
    } // Kurung kurawal penutup untuk method 'login'
}
