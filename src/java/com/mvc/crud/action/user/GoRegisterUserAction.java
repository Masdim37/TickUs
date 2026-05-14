/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;

public class GoRegisterUserAction implements ActionInterface {
    @Override
    public String execute(HttpServletRequest request) {
        return "user/register.jsp";
    }
}