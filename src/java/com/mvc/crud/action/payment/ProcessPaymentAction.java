/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// src/java/com/mvc/crud/action/payment/ProcessPaymentAction.java
package com.mvc.crud.action.payment;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.User;
import com.mvc.crud.service.DatabaseHelper;
import com.mvc.crud.service.PaymentService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.Map;

// INI BAGIAN PENTING YANG MEMPERBAIKI ERROR ANDA
public class ProcessPaymentAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        // Ambil Map dari session
        Map<String, Object> pendingOrder = (session != null) ? (Map<String, Object>) session.getAttribute("pendingOrder") : null;

        if (user == null || pendingOrder == null) {
            return "redirect:controller?action=GoLoginUser&message=Sesi+Anda+habis.";
        }

        PaymentService paymentService = DatabaseHelper.getPaymentService();
        // Kirim Map ke service
        String status = paymentService.executeFullTransaction(user, pendingOrder);

        session.removeAttribute("pendingOrder");

        if ("SUCCESS".equals(status)) {
            return "redirect:controller?action=PaymentSukses";
        } else {
            // Kita bisa menambahkan status error spesifik di URL jika perlu
            return "redirect:controller?action=PaymentGagal";
        }
    }
}
