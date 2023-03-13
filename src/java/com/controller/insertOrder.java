/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
@WebServlet(name = "insertOrder", urlPatterns = {"/insertOrder"})
public class insertOrder extends HttpServlet {

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
        User us = (User) session.getAttribute("user");
        int userid = us.getId();
        double pricehold = Double.parseDouble(request.getParameter("priceItem"));
        int price = (int) Math.round(pricehold);
        int prodID = Integer.parseInt(request.getParameter("prodid"));
        int ship = Integer.parseInt(request.getParameter("shipping"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        String pay = request.getParameter("payMethod");
        LocalDate today = LocalDate.now();
        String curDate = today.format(DateTimeFormatter.ofPattern("dd-MMM-yy"));
        String stat = "Pending";
        
        int quantity = 0;
                
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "uwushop";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String createquery = "INSERT INTO `uwushop`.`order` (product_id, price, qty_order, pymt_method, shipping_price, date, status, userid) values (?, ?, ?, ?, ?, ?, ?, ?)";
        String query="select quantity from product where product_id=?";
        String updatequery="update product set quantity=? where product_id=?";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Connection con = DriverManager.getConnection(url, userName, password);
        PreparedStatement ps = con.prepareStatement(createquery);
        PreparedStatement pss= con.prepareStatement(query);
        PreparedStatement psss= con.prepareStatement(updatequery);
        ps.setInt(1, prodID);
        ps.setInt(2, price);
        ps.setInt(3, qty);
        ps.setString(4, pay);
        ps.setInt(5, ship);
        ps.setString(6, curDate);
        ps.setString(7, stat);
        ps.setInt(8, userid);
        ps.executeUpdate();
        ps.close();
        
        pss.setInt(1, prodID);
        ResultSet rs=pss.executeQuery();
        while(rs.next()){
            quantity=rs.getInt("quantity");
        }
        psss.setInt(1, (quantity-qty));
        psss.setInt(2, prodID);
        psss.executeUpdate();
        con.close();
        session.setAttribute("prodID", prodID);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            RequestDispatcher rd=request.getRequestDispatcher("PurchaseStatus?login=YES&user=CUSTOMER&id=" + us.getId());
            rd.forward(request, response);
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
            Logger.getLogger(insertOrder.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insertOrder.class.getName()).log(Level.SEVERE, null, ex);
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
