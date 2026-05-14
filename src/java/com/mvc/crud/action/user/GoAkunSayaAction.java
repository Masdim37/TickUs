/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;

/**
 *
 * @author LENOVO
 */
public class GoAkunSayaAction implements ActionInterface {
    @Override
    public String execute(HttpServletRequest request) {
        // Kamu bisa ambil session atau data lainnya di sini kalau mau
        return "user/akunsaya.jsp"; // Arahkan ke file akunsaya.jsp
    }
}
