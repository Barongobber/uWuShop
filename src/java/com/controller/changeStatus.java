/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "changeStatus", urlPatterns = {"/changeStatus"})
public class changeStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
 
        HttpSession session = request.getSession();
        Admin ad = (Admin) session.getAttribute("admin");
        String stat = request.getParameter("status");
        String id = request.getParameter("orderID");
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "uwushop";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query = "UPDATE `uwushop`.`order` SET status =? WHERE order_id = ?";
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(changeStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Connection con = DriverManager.getConnection(url, userName, password);
        PreparedStatement ps = con.prepareStatement(query);
        int x = Integer.parseInt(id);
        ps.setString(1, stat);
        ps.setInt(2, x);
        ps.executeUpdate();
        ps.close();
        if(stat.equals("Cancelled")){
            int order_qty=0;
            int pid = 0;
            int product_qty=0;
            String orderquery="select * from `order` where order_id=? ";
            String productquery="select quantity from product where product_id=?";
            String updatequery="update product set quantity=? where product_id=?";
            PreparedStatement pss= con.prepareStatement(orderquery);
            PreparedStatement psss= con.prepareStatement(productquery);
            PreparedStatement statement= con.prepareStatement(updatequery);
            pss.setInt(1, x);
            ResultSet rs=pss.executeQuery();
            while(rs.next()){
                order_qty=rs.getInt("qty_order");
                pid=rs.getInt("product_id");
            }
            psss.setInt(1, pid);
            rs=psss.executeQuery();
            while(rs.next()){
                product_qty=rs.getInt("quantity");
            }
            statement.setInt(1, (order_qty+product_qty));
            statement.setInt(2, pid);
            statement.executeUpdate();
        }
        
        con.close();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<script>window.location.href='PurchaseStatus?login=NO&user=ADMIN&id=" + ad.getId() + "'</script>");
            //out.println("<script>window.location.href='PurchaseStatus?login=NO&user=ADMIN&id=" + ad.getId() + "'</script>");
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
            Logger.getLogger(changeStatus.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(changeStatus.class.getName()).log(Level.SEVERE, null, ex);
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
