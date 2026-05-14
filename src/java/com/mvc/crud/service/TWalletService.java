/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TWalletService {

    public boolean topUp(String walletID, double amount) {
        String query = "UPDATE t_wallet SET saldo = saldo + ? WHERE walletID = ?";
        try (Connection connection = DatabaseHelper.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setDouble(1, amount);
            statement.setString(2, walletID);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
