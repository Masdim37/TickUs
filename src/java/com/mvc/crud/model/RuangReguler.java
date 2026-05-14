/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Objects;

/**
 *
 * @author LENOVO
 */
public class RuangReguler extends RuangBioskop{
//    private String ruangID;
    private int jumlahKursi;
    private double harga;
    
    public RuangReguler(String ruangID, String namaRuang, String tipeRuang, ArrayList<Kursi> kursiList, Bioskop bioskop, int jumlahKursi, double harga){
        super(ruangID, namaRuang, tipeRuang, kursiList, bioskop);
        this.jumlahKursi = jumlahKursi;
        this.harga = harga;
    }

    /**
     * @return the jumlahKursi
     */
    public int getJumlahKursi() {
        return jumlahKursi;
    }

    /**
     * @param jumlahKursi the jumlahKursi to set
     */
    public void setJumlahKursi(int jumlahKursi) {
        this.jumlahKursi = jumlahKursi;
    }

    /**
     * @return the harga
     */
    public double getHarga(){
        return harga;
    }
    
    public void setHarga(double harga){
        this.harga = harga;
    }
}
