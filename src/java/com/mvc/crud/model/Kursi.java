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
public class Kursi implements Serializable{
    private String kursiID;
    private String nomorKursi;
    private String statusIsi;
    private Tiket tiket;
    private RuangBioskop ruangBioskop;
    
    public Kursi(String kursiID, String nomorKursi, String statusIsi, Tiket tiket, RuangBioskop ruangBioskop){
        this.kursiID = kursiID;
        this.nomorKursi = nomorKursi;
        this.statusIsi = statusIsi;
        this.tiket = tiket;
        this.ruangBioskop = ruangBioskop;
    }

    /**
     * @return the kursiID
     */
    public String getKursiID() {
        return kursiID;
    }

    /**
     * @param kursiID the kursiID to set
     */
    public void setKursiID(String kursiID) {
        this.kursiID = kursiID;
    }

    /**
     * @return the nomorKursi
     */
    public String getNomorKursi() {
        return nomorKursi;
    }

    /**
     * @param nomorKursi the nomorKursi to set
     */
    public void setNomorKursi(String nomorKursi) {
        this.nomorKursi = nomorKursi;
    }

    /**
     * @return the statusIsi
     */
    public String getStatusIsi() {
        return statusIsi;
    }

    /**
     * @param statusIsi the statusIsi to set
     */
    public void setStatusIsi(String statusIsi) {
        this.statusIsi = statusIsi;
    }

    /**
     * @return the tiket
     */
    public Tiket getTiket() {
        return tiket;
    }

    /**
     * @param tiket the tiket to set
     */
    public void setTiket(Tiket tiket) {
        this.tiket = tiket;
    }

    /**
     * @return the ruangBioskop
     */
    public RuangBioskop getRuangBioskop() {
        return ruangBioskop;
    }

    /**
     * @param ruangBioskop the ruangBioskop to set
     */
    public void setRuangBioskop(RuangBioskop ruangBioskop) {
        this.ruangBioskop = ruangBioskop;
    }
}
