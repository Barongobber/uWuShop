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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.MailCustomer;

/**
 *
 * @author gobib
 */
@WebServlet(name = "insertListCustomer", urlPatterns = {"/insertListCustomer"})
public class insertListCustomer extends HttpServlet {

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
        
        MailCustomer mc = new MailCustomer();
        
        //get value from the form
        String firstName = request.getParameter("first-name");
        String email = request.getParameter("email");
        String lastName = request.getParameter("last-name");
        String DOB = request.getParameter("date-of-birth");
        String gender = request.getParameter("gender");
        String phone= request.getParameter("phone-no");
        String category = request.getParameter("category");
        String comName = request.getParameter("company-name");
        String industryField = request.getParameter("industry-field");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String province = request.getParameter("province-state");
        String city = request.getParameter("city");
        
        //use model
        mc.setFirstName(firstName);
        mc.setEmail(email);
        mc.setLastName(lastName);
        mc.setAddress(address);
        mc.setDOB(DOB);
        mc.setGender(gender);
        mc.setPhoneNo(phone);
        mc.setIndustryField(industryField);
        mc.setCategoryCompany(category);
        mc.setCompanyName(comName);
        mc.setCountry(country);
        mc.setProvince(province);
        mc.setCity(city);
        
        //set database connection
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "uwushop";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query = "INSERT INTO cust_mail(first_name,last_name, DOB, email, industryField, address, gender, phone, country, province, city, cat_company, company_name) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertListCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userName, password);
        PreparedStatement st = con.prepareStatement(query);
        
//        st.setInt(1, 3);
        st.setString(1, mc.getFirstName());
        st.setString(2, mc.getLastName());
        st.setString(3, mc.getDOB());
        st.setString(4, mc.getEmail());
        st.setString(5, mc.getIndustryField());
        st.setString(6, mc.getAddress());
        st.setString(7, mc.getGender());
        st.setString(8, mc.getPhoneNo());
        st.setString(9, mc.getCountry());
        st.setString(10, mc.getProvince());
        st.setString(11, mc.getCity());
        st.setString(12, mc.getCategoryCompany());
        st.setString(13, mc.getCompanyName());
        
        st.executeUpdate();
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

//            out.println(mc.getFirstName());
//            out.println(mc.getLastName());
//            out.println(mc.getEmail());
//            out.println(mc.getAddress());
//            out.println(mc.getPhoneNo());
//            out.println(mc.getDOB());
//            out.println(mc.getCity());
//            out.println(mc.getCountry());
//            out.println(mc.getProvince());
//            out.println(mc.getCategoryCompany());
//            out.println(mc.getCompanyName());
//            out.println(mc.getGender());
//            out.println(mc.getIndustryField());
        RequestDispatcher rd = request.getRequestDispatcher("showListCustomer?action=customer");
        rd.forward(request, response);
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
            Logger.getLogger(insertListCustomer.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insertListCustomer.class.getName()).log(Level.SEVERE, null, ex);
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
