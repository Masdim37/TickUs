/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.service;

import com.mvc.crud.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class PaymentService {

    public String executeFullTransaction(User user, Map<String, Object> pendingOrder) {
        Connection conn = null;
        // Ambil semua data yang dibutuhkan dari Map
        double totalHarga = (Double) pendingOrder.get("totalHarga");
        String jadwalTayangID = (String) pendingOrder.get("jadwalTayangID");
        List<String> kursiIDs = (List<String>) pendingOrder.get("kursiIDs"); // Pastikan key ini benar

        // PERBAIKAN 1: Hitung harga per tiket
        double hargaPerTiket = totalHarga / kursiIDs.size();

        try {
            conn = DatabaseHelper.getConnection();
            conn.setAutoCommit(false);

            // 1. Cek Saldo
            double currentSaldo = -1;
            try (PreparedStatement psCheck = conn.prepareStatement("SELECT saldo FROM t_wallet WHERE userID = ? FOR UPDATE")) {
                psCheck.setString(1, user.getUserID());
                ResultSet rs = psCheck.executeQuery();
                if (rs.next()) {
                    currentSaldo = rs.getDouble("saldo");
                }
            }
            if (currentSaldo < totalHarga) {
                conn.rollback();
                return "INSUFFICIENT_FUNDS";
            }

            // 2. Buat Order Baru
            String newOrderID = "ord" + UUID.randomUUID().toString().substring(0, 4).toUpperCase();
            try (PreparedStatement psOrder = conn.prepareStatement(
                    "INSERT INTO `order` (orderID, tanggalOrder, userID, totalHarga) VALUES (?, CURDATE(), ?, ?)")) {
                psOrder.setString(1, newOrderID);
                psOrder.setString(2, user.getUserID());
                psOrder.setDouble(3, totalHarga);
                psOrder.executeUpdate();
            }

            // 3. Buat Tiket-tiket baru
            String newTiketIDBase = "tk" + UUID.randomUUID().toString().substring(0, 3);
            String tiketSQL = "INSERT INTO tiket (tiketID, totalHarga, jadwalTayangID, kursiID, orderID) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement psTiket = conn.prepareStatement(tiketSQL)) {
                int i = 1;
                for (String kursiID : kursiIDs) {
                    String newTiketID = newTiketIDBase + i++;
                    psTiket.setString(1, newTiketID);
                    psTiket.setDouble(2, hargaPerTiket); // Gunakan harga per tiket
                    psTiket.setString(3, jadwalTayangID);
                    psTiket.setString(4, kursiID);
                    psTiket.setString(5, newOrderID);
                    psTiket.addBatch();
                }
                psTiket.executeBatch();
            }

            // 4. Kurangi Saldo Wallet
            try (PreparedStatement psUpdate = conn.prepareStatement("UPDATE t_wallet SET saldo = saldo - ? WHERE userID = ?")) {
                psUpdate.setDouble(1, totalHarga);
                psUpdate.setString(2, user.getUserID());
                psUpdate.executeUpdate();
            }

            // 5. Catat Pembayaran
            String paymentID = "pay" + UUID.randomUUID().toString().substring(0, 4).toUpperCase();
            try (PreparedStatement psInsert = conn.prepareStatement(
                    "INSERT INTO payment (paymentID, tanggalbayar, totalBayar, statusBayar, userID, orderID, walletID) VALUES (?, CURDATE(), ?, ?, ?, ?, ?)")) {
                psInsert.setString(1, paymentID);
                psInsert.setDouble(2, totalHarga);
                psInsert.setString(3, "Lunas");
                psInsert.setString(4, user.getUserID());
                // PERBAIKAN 2: Gunakan newOrderID, bukan orderID
                psInsert.setString(5, newOrderID);
                psInsert.setString(6, user.getTwallet().getWalletID());
                psInsert.executeUpdate();
            }

            conn.commit(); // SEMUA SUKSES, COMMIT!
            user.getTwallet().setSaldo(currentSaldo - totalHarga);
            return "SUCCESS";

        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return "ERROR";
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
