/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.payment;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;

/**
 *
 * @author LENOVO
 */
public class PaymentSuksesAction implements ActionInterface{
    @Override
    public String execute(HttpServletRequest request) {
        return "payment/pembayaranSukses.jsp";
    }
}
