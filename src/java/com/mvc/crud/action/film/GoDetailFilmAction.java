/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/java/com/mvc/crud/action/film/GoDetailFilmAction.java
package com.mvc.crud.action.film;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.Bioskop;
import com.mvc.crud.model.Film;
import com.mvc.crud.service.BioskopService;
import com.mvc.crud.service.DatabaseHelper;
import jakarta.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.Map;

import java.util.Date;
public class GoDetailFilmAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        //mengambil parameter filmID dan bioskopID
        String filmID = request.getParameter("filmID");
        String bioskopID = request.getParameter("bioskopID");

        if (filmID == null || bioskopID == null) {
            request.setAttribute("errorMessage", "Film atau Bioskop tidak valid.");
            return "error.jsp";
        }
        
        //membuat objek BioskopService
        BioskopService service = DatabaseHelper.getBioskopService();
        java.sql.Date today = java.sql.Date.valueOf(LocalDate.now());

        //Ambil detail film berdasarkan filmID dari method getFilmById
        Film film = service.getFilmById(filmID);
        if (film == null) {
            request.setAttribute("errorMessage", "Film tidak ditemukan.");
            return "error.jsp";
        }
        //simpan ke atribut film
        request.setAttribute("film", film);

        //Ambil detail bioskop berdasarkan bioskopID dari method getBioskopById
        Bioskop bioskop = service.getBioskopById(bioskopID);
        //simpan ke atribut bioskop
        request.setAttribute("bioskop", bioskop);

        //Ambil jadwal tayang menggunakan method getLengkapJadwal berdasarkan filmID dan bioskopID
        Map<Date, Map<String, Map<String, Object>>> jadwalLengkap = service.getLengkapJadwal(filmID, bioskopID);
        //simpan ke atribut jadwalLengkap
        request.setAttribute("jadwalLengkap", jadwalLengkap);

        //Arahkan ke halaman JSP detail film
        return "film/detailfilm.jsp";      
    }
}
