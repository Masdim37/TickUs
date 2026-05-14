/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.tiket;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.service.TiketService;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Map; // Import Map

public class GoCetakTiketAction implements ActionInterface {
    
    //membuat objek tiketService
    private final TiketService tiketService = new TiketService();

    @Override
    public String execute(HttpServletRequest request) {
        //mengambil parameter orderID
        String orderID = request.getParameter("orderID");
        //jika orderID tidak valid, diarahkan ke error.jsp
        if (orderID == null || orderID.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Order ID tidak valid.");
            return "error.jsp";
        }

        //memanggil method getDetailTiket dari tiketService berdasarkan orderID
        //hasilnya berupa sebuah Map yang berisi detail tiket berdasarakn orderID tersebut
        Map<String, Object> detailTiket = tiketService.getDetailTiket(orderID);
        //hasilnya disimpan ke atribut detailTiket
        request.setAttribute("detailTiket", detailTiket);
        
        //mengarahkan ke cetakTiket.jsp
        return "tiket/cetakTiket.jsp";
    }
}
