/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.model;

import java.io.Serializable;
import java.util.Date;
import java.time.LocalTime;
import java.util.Objects;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class Film implements Serializable{
    private String filmID;
    private String judul;
    private String sutradara;
    private String ratingUsia;
    private int durasi;
    private ArrayList<JadwalTayang> jadwalTayangList;
    private ArrayList<Bioskop> bioskopList;
    
    public Film(String filmID, String judul, String sutradara, String ratingUsia, int durasi){
        this.filmID = filmID;
        this.judul = judul;
        this.sutradara = sutradara;
        this.ratingUsia = ratingUsia;
        this.durasi = durasi;
        this.jadwalTayangList = new ArrayList<>();
        this.bioskopList = new ArrayList<>();
    }

    /**
     * @return the filmID
     */
    public String getFilmID() {
        return filmID;
    }

    /**
     * @param filmID the filmID to set
     */
    public void setFilmID(String filmID) {
        this.filmID = filmID;
    }

    /**
     * @return the judul
     */
    public String getJudul() {
        return judul;
    }

    /**
     * @param judul the judul to set
     */
    public void setJudul(String judul) {
        this.judul = judul;
    }

    /**
     * @return the sutradara
     */
    public String getSutradara() {
        return sutradara;
    }

    /**
     * @param sutradara the sutradara to set
     */
    public void setSutradara(String sutradara) {
        this.sutradara = sutradara;
    }

    /**
     * @return the ratingUsia
     */
    public String getRatingUsia() {
        return ratingUsia;
    }

    /**
     * @param ratingUsia the ratingUsia to set
     */
    public void setRatingUsia(String ratingUsia) {
        this.ratingUsia = ratingUsia;
    }

    /**
     * @return the durasi
     */
    public int getDurasi() {
        return durasi;
    }

    /**
     * @param durasi the durasi to set
     */
    public void setDurasi(int durasi) {
        this.durasi = durasi;
    }

    /**
     * @return the jadwalTayangList
     */
    public ArrayList<JadwalTayang> getJadwalTayangList() {
        return jadwalTayangList;
    }

    /**
     * @param jadwalTayangList the jadwalTayangList to set
     */
    public void setJadwalTayangList(ArrayList<JadwalTayang> jadwalTayangList) {
        this.jadwalTayangList = jadwalTayangList;
    }

    /**
     * @return the bioskopList
     */
    public ArrayList<Bioskop> getBioskopList() {
        return bioskopList;
    }

    /**
     * @param bioskopList the bioskopList to set
     */
    public void setBioskopList(ArrayList<Bioskop> bioskopList) {
        this.bioskopList = bioskopList;
    }
}
