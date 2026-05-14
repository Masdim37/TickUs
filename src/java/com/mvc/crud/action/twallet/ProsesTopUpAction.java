/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.twallet;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.User;
import com.mvc.crud.service.DatabaseHelper;
import com.mvc.crud.service.TWalletService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class ProsesTopUpAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:controller?action=GoLoginUser";
        }

        String amountStr = request.getParameter("amount");
        double amount;
        try {
            amount = Double.parseDouble(amountStr);
            if (amount <= 0) {
                request.setAttribute("error", "Jumlah top up harus lebih dari 0.");
                return "twallet/topup.jsp"; // Kembali ke form topup
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Jumlah top up tidak valid.");
            return "twallet/topup.jsp"; // Kembali ke form topup
        }

        TWalletService tWalletService = DatabaseHelper.getTWalletService();
        boolean success = tWalletService.topUp(user.getTwallet().getWalletID(), amount);

        if (success) {
            // Perbarui saldo di object session
            user.getTwallet().setSaldo(user.getTwallet().getSaldo() + amount);
            session.setAttribute("user", user);

            // Redirect ke halaman sukses dengan amount sebagai parameter
            return "redirect:controller?action=GoTopUpSukses&amount=" + amount;
        } else {
            request.setAttribute("error", "Top up gagal. Silakan coba lagi.");
            return "twallet/topup.jsp";
        }
    }
}
