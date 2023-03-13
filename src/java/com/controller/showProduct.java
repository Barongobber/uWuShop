/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Admin;
import com.bean.Product;
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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tres
 */
public class showProduct extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        
        ArrayList<Product> productList = new ArrayList();
        Product p = new Product();
        
        String user = request.getParameter("user");
        
        
        if (user.equals("ADMIN")){
            Admin ad = (Admin) session.getAttribute("admin");
            
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "uwushop";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String password = "";
            String viewquery = "Select * from product WHERE adminid=?";

            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(showProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection(url, userName, password);
            PreparedStatement st = con.prepareStatement(viewquery);
            st.setInt(1, ad.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                p.setName(rs.getString("productname"));
                p.setQuantity(Integer.parseInt(rs.getString("quantity")));;
                p.setPrice(Double.parseDouble(rs.getString("price")));
                p.setCategory(rs.getString("category"));
                p.setImagesrc(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                productList.add(p);
                p = new Product();
            }
            session.setAttribute("productList", productList);
            st.close();
            con.close();
        } else {
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "uwushop";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String password = "";
            String viewquery = "Select * from product";

            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(showProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection(url, userName, password);
            PreparedStatement st = con.prepareStatement(viewquery);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                p.setProductid(rs.getInt("product_id"));
                p.setName(rs.getString("productname"));
                p.setQuantity(Integer.parseInt(rs.getString("quantity")));;
                p.setPrice(Double.parseDouble(rs.getString("price")));
                p.setCategory(rs.getString("category"));
                p.setImagesrc(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                productList.add(p);
                p = new Product();
            }
            session.setAttribute("productList", productList);
            st.close();
            con.close();
        }
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (user.equals("ADMIN")){
                out.println("<script>window.location.href='admin/product.jsp'</script>");
            } else if (user.equals("CUSTOMER")){
                out.println("<script>window.location.href='product.jsp'</script>");
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
            Logger.getLogger(showProduct.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(showProduct.class.getName()).log(Level.SEVERE, null, ex);
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
