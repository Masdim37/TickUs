package com.mvc.crud.service;

import com.mvc.crud.model.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class UserService {

    public boolean updateUser(User user) {
        // PERBAIKAN: Tambahkan `username = ?` pada query
        String query = "UPDATE user SET username = ?, namaUser = ?, email = ?, noTelp = ?, jenisKelamin = ?, tanggalLahir = ? WHERE userID = ?";

        try (Connection connection = DatabaseHelper.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {

            // PERBAIKAN: Sesuaikan urutan parameter
            statement.setString(1, user.getUsername()); // Parameter ke-1 untuk username
            statement.setString(2, user.getNamaUser()); // Parameter ke-2 untuk namaUser
            statement.setString(3, user.getEmail());    // Parameter ke-3 untuk email
            statement.setString(4, user.getNoTelp());   // Parameter ke-4 untuk noTelp
            statement.setBoolean(5, user.isJenisKelamin()); // Parameter ke-5 untuk jenisKelamin

            if (user.getTanggalLahir() != null) {
                statement.setDate(6, new Date(user.getTanggalLahir().getTime())); // Parameter ke-6 untuk tanggalLahir
            } else {
                statement.setNull(6, java.sql.Types.DATE);
            }

            statement.setString(7, user.getUserID()); // Parameter ke-7 untuk userID

            int rowsUpdated = statement.executeUpdate();

            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(String userID) {
        // Urutan penghapusan penting karena adanya foreign key constraints.
        String deletePaymentSQL = "DELETE FROM payment WHERE userID = ?";
        String selectOrdersSQL = "SELECT orderID FROM `order` WHERE userID = ?";
        String deleteTicketSQL = "DELETE FROM tiket WHERE orderID = ?";
        String deleteOrderSQL = "DELETE FROM `order` WHERE userID = ?";
        String deleteWalletSQL = "DELETE FROM t_wallet WHERE userID = ?";
        String deleteUserSQL = "DELETE FROM user WHERE userID = ?";

        Connection connection = null;
        try {
            connection = DatabaseHelper.getConnection();
            connection.setAutoCommit(false); // Memulai transaksi

            // 1. Hapus dari tabel 'payment'
            try (PreparedStatement ps = connection.prepareStatement(deletePaymentSQL)) {
                ps.setString(1, userID);
                ps.executeUpdate();
            }

            // 2. Kumpulkan semua orderID milik pengguna
            java.util.List<String> orderIds = new java.util.ArrayList<>();
            try (PreparedStatement ps = connection.prepareStatement(selectOrdersSQL)) {
                ps.setString(1, userID);
                java.sql.ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    orderIds.add(rs.getString("orderID"));
                }
            }

            // 2.1 Hapus dari 'tiket' untuk setiap order
            if (!orderIds.isEmpty()) {
                try (PreparedStatement ps = connection.prepareStatement(deleteTicketSQL)) {
                    for (String orderId : orderIds) {
                        ps.setString(1, orderId);
                        ps.addBatch();
                    }
                    ps.executeBatch();
                }
            }

            // 3. Hapus dari 'order'
            try (PreparedStatement ps = connection.prepareStatement(deleteOrderSQL)) {
                ps.setString(1, userID);
                ps.executeUpdate();
            }

            // 4. Hapus dari 't_wallet'
            try (PreparedStatement ps = connection.prepareStatement(deleteWalletSQL)) {
                ps.setString(1, userID);
                ps.executeUpdate();
            }

            // 5. Hapus pengguna dari tabel 'user'
            int rowsAffected;
            try (PreparedStatement ps = connection.prepareStatement(deleteUserSQL)) {
                ps.setString(1, userID);
                rowsAffected = ps.executeUpdate();
            }

            connection.commit(); // Commit transaksi jika semua berhasil
            return rowsAffected > 0;

        } catch (java.sql.SQLException e) {
            e.printStackTrace();
            if (connection != null) {
                try {
                    connection.rollback(); // Rollback jika terjadi error
                } catch (java.sql.SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true); // Kembalikan ke mode auto-commit
                    connection.close();
                } catch (java.sql.SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // PENAMBAHAN FUNGSI BARU
    public boolean registerUser(User user) {
        String insertUserQuery = "INSERT INTO user (userID, username, password, namaUser, email, noTelp, jenisKelamin, tanggalLahir) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String insertWalletQuery = "INSERT INTO t_wallet (walletID, userID, saldo) VALUES (?, ?, ?)";
        String lastUserIDQuery = "SELECT userID FROM user ORDER BY userID DESC LIMIT 1";

        Connection connection = null;
        try {
            connection = DatabaseHelper.getConnection();
            connection.setAutoCommit(false); // Memulai transaction

            // 1. Membuat userID baru
            String newUserID;
            try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(lastUserIDQuery)) {
                if (rs.next()) {
                    String lastID = rs.getString("userID");
                    int num = Integer.parseInt(lastID.substring(3)) + 1;
                    newUserID = "usr" + String.format("%04d", num);
                } else {
                    newUserID = "usr0001"; // Pengguna pertama
                }
            }
            user.setUserID(newUserID);

            // 2. Membuat walletID baru
            String newWalletID = "wlt" + newUserID.substring(3);

            // 3. Insert ke tabel user
            try (PreparedStatement userStmt = connection.prepareStatement(insertUserQuery)) {
                userStmt.setString(1, user.getUserID());
                userStmt.setString(2, user.getUsername());
                userStmt.setString(3, user.getPassword());
                userStmt.setString(4, user.getNamaUser());
                userStmt.setString(5, user.getEmail());
                userStmt.setString(6, user.getNoTelp());
                userStmt.setBoolean(7, user.isJenisKelamin());
                if (user.getTanggalLahir() != null) {
                    userStmt.setDate(8, new java.sql.Date(user.getTanggalLahir().getTime()));
                } else {
                    userStmt.setNull(8, java.sql.Types.DATE);
                }
                userStmt.executeUpdate();
            }

            // 4. Insert ke tabel t_wallet
            try (PreparedStatement walletStmt = connection.prepareStatement(insertWalletQuery)) {
                walletStmt.setString(1, newWalletID);
                walletStmt.setString(2, user.getUserID());
                walletStmt.setDouble(3, 0.00); // Saldo default dari file .sql
                walletStmt.executeUpdate();
            }

            connection.commit(); // Commit transaction
            return true;

        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback(); // Rollback jika terjadi error
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        }
    }
}
