/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.twallet;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;

public class GoTopUpAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        // Mengarahkan ke JSP yang ada di dalam folder 'twallet'
        return "twallet/topup.jsp";
    }
}
