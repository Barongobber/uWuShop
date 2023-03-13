package com.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bean.User;

/**
 *
 * @author gobib
 */
@WebServlet(name = "showListCustomer", urlPatterns = {"/showListCustomer"})
public class showListCustomer extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        ArrayList<User> custList = new ArrayList();
        User subscribedUser= new User();
        
        //set database
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "uwushop";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query = "SELECT * FROM usertable where crmsubs=?";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(showListCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userName, password);
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, "1");
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            subscribedUser.setName(rs.getString("name"));
            subscribedUser.setUsername(rs.getString("username"));
            subscribedUser.setEmail(rs.getString("email"));
            subscribedUser.setAddress(rs.getString("address"));
            subscribedUser.setPhonenum(rs.getString("phonenum"));
            custList.add(subscribedUser);
            subscribedUser = new User();
        }
        session.setAttribute("custList", custList);
        String action = request.getParameter("action");

        try (PrintWriter out = response.getWriter()) {
        if(action.equals("BLAST")){
            out.println("<script>window.location.href='admin/add-recipient-blasting.jsp'</script>");
        } else {
            out.println("<script>window.location.href='admin/customer.jsp'</script>");
        }
            /* TODO output your page here. You may use following sample code. */
        }
        
        st.close();
        con.close();
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
            Logger.getLogger(showListCustomer.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(showListCustomer.class.getName()).log(Level.SEVERE, null, ex);
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
