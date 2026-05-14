/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 *
 * @author LENOVO
 */
public class Payment implements Serializable{
    private String paymentID;
    private double totalBayar;
    private String statusBayar;
    private Date tanggalBayar;
    private Order order;
    private User user;
    private TWallet twallet;
    
    public Payment(String paymentID, double totalBayar, String statusBayar, Date tanggalBayar, Order order, User user, TWallet twallet){
        this.paymentID = paymentID;
        this.totalBayar = totalBayar;
        this.statusBayar = statusBayar;
        this.tanggalBayar = tanggalBayar;
        this.order = order;
        this.user = user;
        this.twallet = twallet;
    }

    /**
     * @return the paymentID
     */
    public String getPaymentID() {
        return paymentID;
    }

    /**
     * @param paymentID the paymentID to set
     */
    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    /**
     * @return the totalBayar
     */
    public double getTotalBayar() {
        return totalBayar;
    }

    /**
     * @param totalBayar the totalBayar to set
     */
    public void setTotalBayar(double totalBayar) {
        this.totalBayar = totalBayar;
    }

    /**
     * @return the statusBayar
     */
    public String getStatusBayar() {
        return statusBayar;
    }

    /**
     * @param statusBayar the statusBayar to set
     */
    public void setStatusBayar(String statusBayar) {
        this.statusBayar = statusBayar;
    }

    /**
     * @return the tanggalBayar
     */
    public Date getTanggalBayar() {
        return tanggalBayar;
    }

    /**
     * @param tanggalBayar the tanggalBayar to set
     */
    public void setTanggalBayar(Date tanggalBayar) {
        this.tanggalBayar = tanggalBayar;
    }

    /**
     * @return the order
     */
    public Order getOrder() {
        return order;
    }

    /**
     * @param order the order to set
     */
    public void setOrder(Order order) {
        this.order = order;
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
     * @return the twallet
     */
    public TWallet getTwallet() {
        return twallet;
    }

    /**
     * @param twallet the twallet to set
     */
    public void setTwallet(TWallet twallet) {
        this.twallet = twallet;
    }
}
