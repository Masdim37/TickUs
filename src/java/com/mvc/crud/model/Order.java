/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import java.util.ArrayList;

import com.mvc.crud.model.User;
import com.mvc.crud.model.Payment;

/**
 *
 * @author LENOVO
 */
public class Order implements Serializable {
    private String orderID;
    private Date tanggalOrder;
    private double totalHarga;
    private User user;
    private Payment payment;
    private ArrayList<Tiket> tiketList;
    
    public Order(String orderID, Date tanggalOrder, double totalHarga, User user, Payment payment){
        this.orderID = orderID;
        this.tanggalOrder = tanggalOrder;
        this.totalHarga = totalHarga;
        this.user = user;
        this.payment = payment;
        this.tiketList = new ArrayList<>();
    }

    /**
     * @return the orderID
     */
    public String getOrderID() {
        return orderID;
    }

    /**
     * @param orderID the orderID to set
     */
    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    /**
     * @return the tanggalOrder
     */
    public Date getTanggalOrder() {
        return tanggalOrder;
    }

    /**
     * @param tanggalOrder the tanggalOrder to set
     */
    public void setTanggalOrder(Date tanggalOrder) {
        this.tanggalOrder = tanggalOrder;
    }

    /**
     * @return the totalHarga
     */
    public double getTotalHarga() {
        return totalHarga;
    }

    /**
     * @param totalHarga the totalHarga to set
     */
    public void setTotalHarga(double totalHarga) {
        this.totalHarga = totalHarga;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the payment
     */
    public Payment getPayment() {
        return payment;
    }

    /**
     * @param payment the payment to set
     */
    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    /**
     * @return the tiketList
     */
    public ArrayList<Tiket> getTiketList() {
        return tiketList;
    }

    /**
     * @param tiketList the tiketList to set
     */
    public void setTiketList(ArrayList<Tiket> tiketList) {
        this.tiketList = tiketList;
    }
}
