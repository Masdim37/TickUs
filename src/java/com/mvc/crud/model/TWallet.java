/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class TWallet implements Serializable{
    private String walletID;
    private double saldo;
    private String passwordWallet;
    private ArrayList<Payment> listPayment;
    private User user;
    
    public TWallet(String walletID, double saldo, String passwordWallet, User user){
        this.walletID = walletID;
        this.saldo = saldo;
        this.passwordWallet = passwordWallet;
        this.listPayment = new ArrayList<>();
        this.user = user;
    }

    /**
     * @return the walletID
     */
    public String getWalletID() {
        return walletID;
    }

    /**
     * @param walletID the walletID to set
     */
    public void setWalletID(String walletID) {
        this.walletID = walletID;
    }

    /**
     * @return the saldo
     */
    public double getSaldo() {
        return saldo;
    }

    /**
     * @param saldo the saldo to set
     */
    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    /**
     * @return the passwordWallet
     */
    public String getPasswordWallet() {
        return passwordWallet;
    }

    /**
     * @param passwordWallet the passwordWallet to set
     */
    public void setPasswordWallet(String passwordWallet) {
        this.passwordWallet = passwordWallet;
    }

    /**
     * @return the listPayment
     */
    public ArrayList<Payment> getListPayment() {
        return listPayment;
    }

    /**
     * @param listPayment the listPayment to set
     */
    public void setListPayment(ArrayList<Payment> listPayment) {
        this.listPayment = listPayment;
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
    
    
}
