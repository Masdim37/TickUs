/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.tiket;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.User;
import com.mvc.crud.service.TiketService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public class GoTiketSayaAction implements ActionInterface {
    
    //membuat objek tiketService
    private final TiketService tiketService = new TiketService();

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession(false); //mengambil sesi yang sedang berjalan
        User user = (session != null) ? (User) session.getAttribute("user") : null; //mengambil objek user yang sudah login

        if (user == null) { //jika tidak ada user yang login, maka diarahkan kembali ke halaman login
            return "redirect:controller?action=GoLoginUser";
        }

        //jika user ada, panggil method getTiketForUser dari TiketService dengan mengirim userID 
        List<Map<String, Object>> listTiket = tiketService.getTiketForUser(user.getUserID());
        //hasil methodnya berupa list yang berisi Map data tiket disimpan di atribut request listTiket
        request.setAttribute("listTiket", listTiket);
        
        //mengarahkan ke tiketSaya.jsp
        return "tiket/tiketSaya.jsp";
    }
}
