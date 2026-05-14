/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// TubesPBO/src/java/com/mvc/crud/action/user/LogoutUserAction.java
package com.mvc.crud.action.user;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class LogoutUserAction implements ActionInterface {

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Get existing session, don't create a new one
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }
        // Redirect to the login page.
        // Use "redirect:" prefix to signal ControllerServlet to send a redirect response.
        return "redirect:controller?action=GoLoginUser";
    }
}
