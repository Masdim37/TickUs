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
public class Tiket implements Serializable{
    private String tiketID;
    private double totalHarga;
    private Order order;
    private JadwalTayang jadwalTayang;
    private Kursi kursi;
    
    public Tiket(String tiketID, double totalHarga, Order order, JadwalTayang jadwalTayang, Kursi kursi){
        this.tiketID = tiketID;
        this.totalHarga = totalHarga;
        this.order = order;
        this.jadwalTayang = jadwalTayang;
        this.kursi = kursi;
    }

    /**
     * @return the tiketID
     */
    public String getTiketID() {
        return tiketID;
    }

    /**
     * @param tiketID the tiketID to set
     */
    public void setTiketID(String tiketID) {
        this.tiketID = tiketID;
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
     * @return the jadwalTayang
     */
    public JadwalTayang getJadwalTayang() {
        return jadwalTayang;
    }

    /**
     * @param jadwalTayang the jadwalTayang to set
     */
    public void setJadwalTayang(JadwalTayang jadwalTayang) {
        this.jadwalTayang = jadwalTayang;
    }

    /**
     * @return the kursi
     */
    public Kursi getKursi() {
        return kursi;
    }

    /**
     * @param kursi the kursi to set
     */
    public void setKursi(Kursi kursi) {
        this.kursi = kursi;
    }
}
