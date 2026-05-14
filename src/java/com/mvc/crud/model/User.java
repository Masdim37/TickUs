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
public class User implements Serializable {
    private String userID;
    private String username;
    private String password;
    private String namaUser;
    private boolean jenisKelamin;
    private Date tanggalLahir;
    private String noTelp;
    private String email;
    private ArrayList<Order> listOrder;
    private ArrayList<Payment> listPayment;
    private TWallet twallet;
    
    public User(String userID, String username, String password, String namaUser, boolean jenisKelamin, Date tanggalLahir, String noTelp, String email, TWallet twallet){
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.namaUser = namaUser;
        this.jenisKelamin = jenisKelamin;
        this.tanggalLahir = tanggalLahir;
        this.noTelp = noTelp;
        this.email = email;
        this.listOrder = new ArrayList<>();
        this.listPayment = new ArrayList<>();
        this.twallet = twallet;
    }
    
    public User(String username, String password){
        this.username = username;
        this.password = password;
    }

    public User() {
    }

    /**
     * @return the userID
     */
    public String getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(String userID) {
        this.userID = userID;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the namaUser
     */
    public String getNamaUser() {
        return namaUser;
    }

    /**
     * @param namaUser the namaUser to set
     */
    public void setNamaUser(String namaUser) {
        this.namaUser = namaUser;
    }

    /**
     * @return the jenisKelamin
     */
    public boolean isJenisKelamin() {
        return jenisKelamin;
    }

    /**
     * @param jenisKelamin the jenisKelamin to set
     */
    public void setJenisKelamin(boolean jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }

    /**
     * @return the tanggalLahir
     */
    public Date getTanggalLahir() {
        return tanggalLahir;
    }

    /**
     * @param tanggalLahir the tanggalLahir to set
     */
    public void setTanggalLahir(Date tanggalLahir) {
        this.tanggalLahir = tanggalLahir;
    }

    /**
     * @return the noTelp
     */
    public String getNoTelp() {
        return noTelp;
    }

    /**
     * @param noTelp the noTelp to set
     */
    public void setNoTelp(String noTelp) {
        this.noTelp = noTelp;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the listOrder
     */
    public ArrayList<Order> getListOrder() {
        return listOrder;
    }

    /**
     * @param listOrder the listOrder to set
     */
    public void setListOrder(ArrayList<Order> listOrder) {
        this.listOrder = listOrder;
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
