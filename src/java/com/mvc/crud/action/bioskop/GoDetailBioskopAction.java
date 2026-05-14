/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/java/com/mvc/crud/action/bioskop/GoDetailBioskopAction.java
// File: src/java/com/mvc/crud/action/bioskop/GoDetailBioskopAction.java
package com.mvc.crud.action.bioskop;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.Bioskop;
import com.mvc.crud.model.Film;
import com.mvc.crud.service.BioskopService;
import com.mvc.crud.service.DatabaseHelper;
import jakarta.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.List;

public class GoDetailBioskopAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        //mengambil parameter bioskopID
        String bioskopID = request.getParameter("bioskopID");
        //membuat objek BioskopService
        BioskopService service = DatabaseHelper.getBioskopService();

        //ambil detail bioskop dari method getBioskopById berdasarkan bisokopID
        Bioskop bioskop = service.getBioskopById(bioskopID);
        //disimpan dalam atribut bioskop
        request.setAttribute("bioskop", bioskop);

        //Ambil daftar film yang sedang tayang meenggunakan method getFilmsForBioskop, disimpan kedalam list
        java.sql.Date today = java.sql.Date.valueOf(LocalDate.now());
        List<Film> filmList = service.getFilmsForBioskop(bioskopID, today);

        //disimpan kedalam atribut filmList
        request.setAttribute("filmList", filmList);
        
        //arahkan ke detailbioskop.jsp
        return "bioskop/detailbioskop.jsp";
    }
}
