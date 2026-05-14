/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mvc.crud.controller;

import com.mvc.crud.action.ActionInterface;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author dany
 */
@WebServlet(name = "ControllerServlet", urlPatterns = {"/controller"})
public class ControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Properties props = null;
    RequestDispatcher rds = null;

    @Override
    public void init(ServletConfig config)
            throws ServletException {
        try {
            props = new Properties();
            InputStream in = this.getClass().getClassLoader().
                    getResourceAsStream("conf.properties");
            props.load(in);
        } catch (IOException ex) {
            System.err.println("fail to read file");
        }

    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlPath = request.getParameter("action");
        String reqHelperClassName = (String) props.get(urlPath);
        if (reqHelperClassName != null) {
            try {
                ActionInterface helper = (ActionInterface) Class.forName(reqHelperClassName).getConstructor().newInstance();
                String nextView = helper.execute(request);
                
                if (nextView.startsWith("redirect:")) {
                    response.sendRedirect(nextView.substring(9)); // Hapus "redirect:"
                    return; // Hentikan pemrosesan setelah redirect
                }

                if (!nextView.contains("controller")) {
                    nextView = "/WEB-INF/page/" + nextView;
                }
                rds = request.getRequestDispatcher(nextView);
                rds.forward(request, response);
            } catch (Exception ex) {
                System.err.println("Error executing action: " + urlPath);
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Terjadi kesalahan yang tidak terduga: " + ex.getMessage());
                request.getRequestDispatcher("/WEB-INF/page/error.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Aksi yang diminta '" + urlPath + "' tidak ditemukan.");
            request.getRequestDispatcher("/WEB-INF/page/error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
