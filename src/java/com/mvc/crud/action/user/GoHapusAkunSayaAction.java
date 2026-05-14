package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import com.mvc.crud.model.User;
import com.mvc.crud.service.DatabaseHelper;
import com.mvc.crud.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

// Nama kelas diubah sesuai nama file
public class GoHapusAkunSayaAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession(false); 

        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            UserService userService = DatabaseHelper.getUserService();

            boolean success = userService.deleteUser(user.getUserID());

            if (success) {
                session.invalidate(); 
                return "redirect:controller?action=GoLoginUser&message=Akun+Anda+telah+berhasil+dihapus.";
            } else {
                request.setAttribute("deleteError", "Gagal menghapus akun. Silakan coba lagi.");
                return "user/akunsaya.jsp";
            }
        }

        return "redirect:controller?action=GoLoginUser";
    }
}