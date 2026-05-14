/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;
import com.mvc.crud.service.DatabaseHelper;
import com.mvc.crud.service.LoginUserService;

public class GoLoginUserAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        LoginUserService service = DatabaseHelper.getLoginUserService();
        // Hanya mengarahkan ke halaman login
        return "user/login.jsp";
    }
}
