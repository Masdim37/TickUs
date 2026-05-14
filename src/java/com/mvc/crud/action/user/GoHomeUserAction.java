package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;

public class GoHomeUserAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        // Kamu bisa ambil session atau data lainnya di sini kalau mau
        return "user/home.jsp"; // Arahkan ke file home.jsp
    }
}
