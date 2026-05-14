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
public class Bioskop implements Serializable {
    private String bioskopID;
    private String namaBioskop;
    private String lokasiBioskop;
    private String brandBioskop;
    private int jumlahRuangan;
    private ArrayList<RuangBioskop> ruangBioskopList;
    private ArrayList<Film> filmList;
    
    public Bioskop(String bioskopID, String namaBioskop, String lokasiBioskop, String brandBioskop, int jumlahRuangan){
        this.bioskopID = bioskopID;
        this.namaBioskop = namaBioskop;
        this.lokasiBioskop = lokasiBioskop;
        this.brandBioskop = brandBioskop;
        this.jumlahRuangan = jumlahRuangan;
        this.ruangBioskopList = new ArrayList<>();
        this.filmList = new ArrayList<>();
    }

    /**
     * @return the bioskopID
     */
    public String getBioskopID() {
        return bioskopID;
    }

    /**
     * @param bioskopID the bioskopID to set
     */
    public void setBioskopID(String bioskopID) {
        this.bioskopID = bioskopID;
    }

    /**
     * @return the namaBioskop
     */
    public String getNamaBioskop() {
        return namaBioskop;
    }

    /**
     * @param namaBioskop the namaBioskop to set
     */
    public void setNamaBioskop(String namaBioskop) {
        this.namaBioskop = namaBioskop;
    }

    /**
     * @return the lokasiBioskop
     */
    public String getLokasiBioskop() {
        return lokasiBioskop;
    }

    /**
     * @param lokasiBioskop the lokasiBioskop to set
     */
    public void setLokasiBioskop(String lokasiBioskop) {
        this.lokasiBioskop = lokasiBioskop;
    }

    /**
     * @return the brandBioskop
     */
    public String getBrandBioskop() {
        return brandBioskop;
    }

    /**
     * @param brandBioskop the brandBioskop to set
     */
    public void setBrandBioskop(String brandBioskop) {
        this.brandBioskop = brandBioskop;
    }

    /**
     * @return the jumlahRuangan
     */
    public int getJumlahRuangan() {
        return jumlahRuangan;
    }

    /**
     * @param jumlahRuangan the jumlahRuangan to set
     */
    public void setJumlahRuangan(int jumlahRuangan) {
        this.jumlahRuangan = jumlahRuangan;
    }

    /**
     * @return the ruangBioskopList
     */
    public ArrayList<RuangBioskop> getRuangBioskopList() {
        return ruangBioskopList;
    }

    /**
     * @param ruangBioskopList the ruangBioskopList to set
     */
    public void setRuangBioskopList(ArrayList<RuangBioskop> ruangBioskopList) {
        this.ruangBioskopList = ruangBioskopList;
    }

    /**
     * @return the filmList
     */
    public ArrayList<Film> getFilmList() {
        return filmList;
    }

    /**
     * @param filmList the filmList to set
     */
    public void setFilmList(ArrayList<Film> filmList) {
        this.filmList = filmList;
    }
}
