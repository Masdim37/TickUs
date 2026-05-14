/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.twallet;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;

public class GoTopUpSuksesAction implements ActionInterface {
    @Override
    public String execute(HttpServletRequest request) {
        // Mengarahkan ke JSP sukses di dalam folder 'twallet'
        return "twallet/topupSukses.jsp";
    }
}