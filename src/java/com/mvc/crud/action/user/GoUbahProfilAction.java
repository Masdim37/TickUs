package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;

/**
 * Kelas ini HANYA bertugas untuk menavigasikan pengguna
 * ke halaman form ubah profil.
 */
public class GoUbahProfilAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        // Cukup arahkan ke file JSP untuk form edit
        return "user/ubahprofil.jsp";
    }
}