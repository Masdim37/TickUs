// src/java/com/mvc/crud/service/DatabaseHelper.java (PERBAIKAN)
package com.mvc.crud.service;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseHelper {

    private static MysqlDataSource dataSource; // DataSource bisa statis
    private static LoginUserService loginUserService;
    private static UserService userService;
    private static BioskopService bioskopService;
    private static OrderService orderService;
    private static TWalletService tWalletService;
    private static PaymentService paymentService;
    private static TiketService tiketService;

    // Inisialisasi DataSource sekali saja
    static {
        dataSource = new MysqlDataSource();
        dataSource.setUser("root");
        dataSource.setPassword("1234567890");
        dataSource.setServerName("localhost");
        dataSource.setPort(3306);
        dataSource.setDatabaseName("tickus");
    }

    public static LoginUserService getLoginUserService() {
        if (loginUserService == null) {
            loginUserService = new LoginUserService();
        }
        return loginUserService;
    }

    public static UserService getUserService() {
        if (userService == null) {
            userService = new UserService();
        }
        return userService;
    }

    public static BioskopService getBioskopService() {
        if (bioskopService == null) {
            bioskopService = new BioskopService();
        }
        return bioskopService;
    }

    public static OrderService getOrderService() {
        if (orderService == null) {
            orderService = new OrderService();
        }
        return orderService;
    }

    public static TWalletService getTWalletService() {
        if (tWalletService == null) {
            tWalletService = new TWalletService();
        }
        return tWalletService;
    }

    public static PaymentService getPaymentService() {
        if (paymentService == null) {
            paymentService = new PaymentService();
        }
        return paymentService;
    }

    public static TiketService getTiketService() {
        if (tiketService == null) {
            tiketService = new TiketService();
        }
        return tiketService;
    }
    

    // Method ini sekarang akan selalu mengembalikan koneksi baru yang fresh
    public static Connection getConnection() throws SQLException {
        if (dataSource == null) {
            throw new SQLException("DataSource tidak terinisialisasi.");
        }
        return dataSource.getConnection();
    }
}
