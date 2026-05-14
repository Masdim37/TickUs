/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.crud.controller;

import com.mvc.crud.service.LoginUserService;
import com.mvc.crud.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private LoginUserService loginService;

    @Override
    public void init() throws ServletException {
        loginService = new LoginUserService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("usernameInput");
        String password = request.getParameter("passwordInput");

        User user = loginService.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user); // Menyimpan data user ke sesi
            response.sendRedirect(request.getContextPath() + "/controller?action=GoHomeUser"); // ✅ Redirect ke controller // ⬅️ INI bagian yang mengarahkan ke home.jsp
        } else {
            request.setAttribute("error", "Username atau Password salah!");
            // Arahkan ke path lengkap di dalam WEB-INF
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/page/user/login.jsp"); // <-- INI SOLUSINYA
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/login.jsp");
        dispatcher.forward(request, response);
    }
}
