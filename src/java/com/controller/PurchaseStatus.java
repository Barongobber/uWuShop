/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "PurchaseStatus", urlPatterns = {"/PurchaseStatus"})
public class PurchaseStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Order or = new Order();
        ArrayList<Order> oL= new ArrayList();
        String log = request.getParameter("login");
        String user = request.getParameter("user");
        int id = Integer.parseInt(request.getParameter("id"));
        
        if(user.equals("ADMIN")){
            
            //set database
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "uwushop";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String password = "";
            String query = "SELECT usertable.`name`, product.productname, `order`.qty_order, `order`.price, " +
    "`order`.shipping_price, `order`.date, `order`.`status`, `order`.order_id, `order`.product_id, " +
    "`order`.pymt_method, product.adminid FROM `order` INNER JOIN usertable ON `order`.userid = usertable.userid " +
    "INNER JOIN product ON `order`.product_id = product.product_id WHERE product.adminid = ?";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(PurchaseStatus.class.getName()).log(Level.SEVERE, null, ex);
            }

            Connection con = DriverManager.getConnection(url, userName, password);
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

                while(rs.next()){
                    or.setBuyer(rs.getString("name"));
                    or.setProductname(rs.getString("productname"));
                    or.setOrderid(rs.getInt("order_id"));
                    or.setProductid(rs.getInt("product_id"));
                    or.setStatus(rs.getString("status"));
                    or.setDate(rs.getString("date"));
                    or.setShipping_price(rs.getInt("shipping_price"));
                    or.setQtyOrder(rs.getInt("qty_order"));
                    or.setPymt_method(rs.getString("pymt_method"));
                    or.setAdminid(rs.getInt("adminid"));
                    or.setPrice(rs.getInt("price"));
                    oL.add(or);
                    or = new Order();
                }
                session.setAttribute("orderList", oL);
                st.close();
                con.close();
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                if (log.equals("YES")){

                out.println("<script>window.location.href='dashboard.jsp'</script>");
                } else if (log.equals("NO")){
                out.println("<script>window.location.href='showReport'</script>");

                }
            }
            //if customer
        } else if (user.equals("CUSTOMER")){
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "uwushop";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String password = "";
            String query = "SELECT usertable.`name`, product.productname, `order`.qty_order, `order`.price, " +
    "`order`.shipping_price, `order`.date, `order`.`status`, `order`.order_id, `order`.product_id, " +
    "`order`.pymt_method, product.adminid FROM `order` INNER JOIN usertable ON `order`.userid = usertable.userid " +
    "INNER JOIN product ON `order`.product_id = product.product_id WHERE `order`.userid = ?";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(PurchaseStatus.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            Connection con = DriverManager.getConnection(url, userName, password);
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

                while(rs.next()){
                    or.setBuyer(rs.getString("name"));
                    or.setProductname(rs.getString("productname"));
                    or.setOrderid(rs.getInt("order_id"));
                    or.setProductid(rs.getInt("product_id"));
                    or.setStatus(rs.getString("status"));
                    or.setDate(rs.getString("date"));
                    or.setShipping_price(rs.getInt("shipping_price"));
                    or.setQtyOrder(rs.getInt("qty_order"));
                    or.setPymt_method(rs.getString("pymt_method"));
                    or.setAdminid(rs.getInt("adminid"));
                    or.setPrice(rs.getInt("price"));
                    oL.add(or);
                    or = new Order();
                }
                session.setAttribute("orderList", oL);
                st.close();
                con.close();
                try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<script>window.location.href='purchase-history.jsp'</script>");
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
            Logger.getLogger(PurchaseStatus.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PurchaseStatus.class.getName()).log(Level.SEVERE, null, ex);
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
