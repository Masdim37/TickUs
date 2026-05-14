/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.model;

import java.io.Serializable;
import java.util.Date;
import java.time.LocalTime;
import java.util.Objects;


/**
 *
 * @author LENOVO
 */
public class JadwalTayang implements Serializable{
    private String jadwalTayangID;
    private Date tanggalTayang;
    private LocalTime jamTayang;
    private Film film;
    private RuangBioskop ruangBioskop;
    
    public JadwalTayang(String jadwalTayangID, Date tanggalTayang, LocalTime jamTayang, Film film, RuangBioskop ruangBioskop){
        this.jadwalTayangID = jadwalTayangID;
        this.tanggalTayang = tanggalTayang;
        this.jamTayang = jamTayang;
        this.film = film;
        this.ruangBioskop = ruangBioskop;
    }

    /**
     * @return the jadwalTayangID
     */
    public String getJadwalTayangID() {
        return jadwalTayangID;
    }

    /**
     * @param jadwalTayangID the jadwalTayangID to set
     */
    public void setJadwalTayangID(String jadwalTayangID) {
        this.jadwalTayangID = jadwalTayangID;
    }

    /**
     * @return the filmID
     */
//    public String getFilmID() {
//        return filmID;
//    }
//
//    /**
//     * @param filmID the filmID to set
//     */
//    public void setFilmID(String filmID) {
//        this.filmID = filmID;
//    }

    /**
     * @return the tanggalTayang
     */
    public Date getTanggalTayang() {
        return tanggalTayang;
    }

    /**
     * @param tanggalTayang the tanggalTayang to set
     */
    public void setTanggalTayang(Date tanggalTayang) {
        this.tanggalTayang = tanggalTayang;
    }

    /**
     * @return the jamTayang
     */
    public LocalTime getJamTayang() {
        return jamTayang;
    }

    /**
     * @param jamTayang the jamTayang to set
     */
    public void setJamTayang(LocalTime jamTayang) {
        this.jamTayang = jamTayang;
    }

    /**
     * @return the film
     */
    public Film getFilm() {
        return film;
    }

    /**
     * @param film the film to set
     */
    public void setFilm(Film film) {
        this.film = film;
    }

    /**
     * @return the tiket
     */
//    public Tiket getTiket() {
//        return tiket;
//    }
//
//    /**
//     * @param tiket the tiket to set
//     */
//    public void setTiket(Tiket tiket) {
//        this.tiket = tiket;
//    }
    
    public RuangBioskop getRuangBioskop() {
        return ruangBioskop;
    }

    public void setRuangBioskop(RuangBioskop ruangBioskop) {
        this.ruangBioskop = ruangBioskop;
    }
}
