    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.User;
import com.mvc.crud.service.DatabaseHelper;
import com.mvc.crud.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegisterUserAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String namaUser = request.getParameter("namaUser");
        String email = request.getParameter("email");
        String noTelp = request.getParameter("noTelp");
        boolean jenisKelamin = "1".equals(request.getParameter("jenisKelamin"));
        String tanggalLahirStr = request.getParameter("tanggalLahir");

        if (username == null || username.trim().isEmpty() || password == null || password.isEmpty() || namaUser == null || namaUser.trim().isEmpty()) {
            request.setAttribute("error", "Nama Lengkap, Username, dan Password tidak boleh kosong.");
            return "user/register.jsp";
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Password dan konfirmasi password tidak cocok.");
            return "user/register.jsp";
        }

        Date tanggalLahir = null;
        if (tanggalLahirStr != null && !tanggalLahirStr.isEmpty()) {
            try {
                tanggalLahir = new SimpleDateFormat("yyyy-MM-dd").parse(tanggalLahirStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setNamaUser(namaUser);
        newUser.setEmail(email);
        newUser.setNoTelp(noTelp);
        newUser.setJenisKelamin(jenisKelamin);
        newUser.setTanggalLahir(tanggalLahir);

        UserService userService = DatabaseHelper.getUserService();
        boolean success = userService.registerUser(newUser);

        if (success) {
            request.setAttribute("success", "Pendaftaran berhasil! Silakan login.");
            return "user/login.jsp";
        } else {
            request.setAttribute("error", "Pendaftaran gagal. Username atau email mungkin sudah digunakan.");
            return "user/register.jsp";
        }
    }
}
