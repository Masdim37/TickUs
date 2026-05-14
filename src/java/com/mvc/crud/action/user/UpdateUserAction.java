package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.User;
import com.mvc.crud.service.DatabaseHelper;
import com.mvc.crud.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UpdateUserAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {

        // Ambil semua data dari form, termasuk username
        String userID = request.getParameter("userID");
        String username = request.getParameter("username"); // PERBAIKAN: Ambil username dari form
        String namaUser = request.getParameter("namaUser");
        String email = request.getParameter("email");
        String noTelp = request.getParameter("noTelp");
        boolean jenisKelamin = Boolean.parseBoolean(request.getParameter("jenisKelamin"));
        String tanggalLahirStr = request.getParameter("tanggalLahir");

        // PERBAIKAN: Deklarasi variabel tanggalLahir di luar try-catch
        Date tanggalLahir = null;
        if (tanggalLahirStr != null && !tanggalLahirStr.isEmpty()) {
            try {
                tanggalLahir = new SimpleDateFormat("yyyy-MM-dd").parse(tanggalLahirStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        HttpSession session = request.getSession();
        User oldUser = (User) session.getAttribute("user");

        // Buat objek user baru dengan semua data yang diperbarui dari form
        User updatedUser = new User();
        updatedUser.setUserID(userID);
        updatedUser.setUsername(username); // PERBAIKAN: Gunakan username baru
        updatedUser.setNamaUser(namaUser);
        updatedUser.setEmail(email);
        updatedUser.setNoTelp(noTelp);
        updatedUser.setJenisKelamin(jenisKelamin);
        updatedUser.setTanggalLahir(tanggalLahir); // PERBAIKAN: Gunakan tanggal lahir baru

        // Salin data yang tidak ada di form (password dan wallet) dari objek lama
        updatedUser.setPassword(oldUser.getPassword());
        updatedUser.setTwallet(oldUser.getTwallet());

        UserService userService = DatabaseHelper.getUserService();
        // PERBAIKAN: Tangkap status sukses dari service
        boolean success = userService.updateUser(updatedUser);

        if (success) {
            // Perbarui sesi HANYA JIKA update database berhasil
            session.setAttribute("user", updatedUser);
        }

        // Setelah update, redirect kembali ke halaman lihat profil
        // TAMBAHKAN "redirect:" DI DEPAN UNTUK MEMBERI SINYAL KE CONTROLLER
        return "controller?action=GoAkunSaya";
    }
}
