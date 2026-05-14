/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.model;

import java.io.Serializable;
import java.util.Objects;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public abstract class RuangBioskop implements Serializable{
    private String ruangID;
    private String namaRuang;
    private String tipeRuang;
    private ArrayList<Kursi> kursiList;
    private Bioskop bioskop;
    private double harga;
    
    public RuangBioskop(String ruangID, String namaRuang, String tipeRuang, ArrayList<Kursi> kursiList, Bioskop bioskop){
        this.ruangID = ruangID;
        this.namaRuang = namaRuang;
        this.tipeRuang = tipeRuang;
        this.kursiList = new ArrayList<>();
        this.bioskop = bioskop;
    }

    /**
     * @return the ruangID
     */
    public String getRuangID() {
        return ruangID;
    }

    /**
     * @param ruangID the ruangID to set
     */
    public void setRuangID(String ruangID) {
        this.ruangID = ruangID;
    }

    /**
     * @return the namaRuang
     */
    public String getNamaRuang() {
        return namaRuang;
    }

    /**
     * @param namaRuang the namaRuang to set
     */
    public void setNamaRuang(String namaRuang) {
        this.namaRuang = namaRuang;
    }

    /**
     * @return the tipeRuang
     */
    public String getTipeRuang() {
        return tipeRuang;
    }

    /**
     * @param tipeRuang the tipeRuang to set
     */
    public void setTipeRuang(String tipeRuang) {
        this.tipeRuang = tipeRuang;
    }

    /**
     * @return the kursiList
     */
    public ArrayList<Kursi> getKursiList() {
        return kursiList;
    }

    /**
     * @param kursiList the kursiList to set
     */
    public void setKursiList(ArrayList<Kursi> kursiList) {
        this.kursiList = kursiList;
    }

    /**
     * @return the bioskop
     */
    public Bioskop getBioskop() {
        return bioskop;
    }

    /**
     * @param bioskop the bioskop to set
     */
    public void setBioskop(Bioskop bioskop) {
        this.bioskop = bioskop;
    }
    
    public double getHarga() {
        return harga;
    }

    // TAMBAHKAN: Setter untuk harga
    public void setHarga(double harga) {
        this.harga = harga;
    }
}
