/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/java/com/mvc/crud/action/bioskop/GoListBioskopAction.java
package com.mvc.crud.action.bioskop;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.Bioskop;
import com.mvc.crud.service.BioskopService;
import com.mvc.crud.service.DatabaseHelper;
import jakarta.servlet.http.HttpServletRequest;
import java.util.List;

public class GoListBioskopAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        
        BioskopService bioskopService = DatabaseHelper.getBioskopService();
        //memanggil method getAllBioskop dari bioskopService, dan hasilnya disimpan kedalam list bioskopList
        List<Bioskop> bioskopList = bioskopService.getAllBioskop();

        //hasil methodnya disimpan ke atribut bioskopList
        request.setAttribute("bioskopList", bioskopList);

        //mengarahkan ke listBioskop.jsp
        return "bioskop/listbioskop.jsp";
    }
}
