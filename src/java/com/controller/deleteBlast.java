/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gobib
 */
@WebServlet(name = "deleteBlast", urlPatterns = {"/deleteBlast"})
public class deleteBlast extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        HttpSession session = request.getSession();
        //get url info
        String act = request.getParameter("action");
        int id = 0;
        //set database
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "uwushop";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query = "DELETE FROM campaign";
        
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(act.equals("DELETE")){
                id = Integer.parseInt(request.getParameter("id"));
                query += " WHERE campaign_id=?";
                try {
                    Class.forName(driver);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(deleteBlast.class.getName()).log(Level.SEVERE, null, ex);
                }
                Connection con = DriverManager.getConnection(url, userName, password);
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, id);
                ps.execute();
                out.println("<script> alert('Delete Success!!')</script>");
                out.println("<script>window.location.href='showListCampaign'</script>");
                ps.close();
                con.close();
            } else if (act.equals("DELETE_ALL")){
                try {
                    Class.forName(driver);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(deleteBlast.class.getName()).log(Level.SEVERE, null, ex);
                }
                Connection con = DriverManager.getConnection(url, userName, password);
                PreparedStatement ps = con.prepareStatement(query);
                ps.execute();
                out.println("<script> alert('Delete All History Success!!')</script>");
                out.println("<script>window.location.href='showListCampaign'</script>");
                ps.close();
                con.close();
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(deleteBlast.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(deleteBlast.class.getName()).log(Level.SEVERE, null, ex);
        }
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
