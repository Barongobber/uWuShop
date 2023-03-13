/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Admin;
import com.bean.Report;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
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
 * @author kroener
 */

public class showReport extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String log = request.getParameter("login");
        HttpSession session = request.getSession();
        Report fr=new Report();
        Admin ad = (Admin) session.getAttribute("admin");
        ArrayList<Report> reportList= new ArrayList();
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "uwushop";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query="select product.productname, order.date, order.qty_order, SUM((order.price*order.qty_order)) AS 'Total Income'"+
                      " from `order` INNER JOIN product ON `order`.product_id=product.product_id WHERE  product.adminid=? AND"  +
                       " `order`.`status` != 'Cancelled' AND `order`.`status` != 'Pending' GROUP BY `order`.date,`order`.product_id ORDER BY date DESC;";
        try {
                Class.forName(driver);
        } catch (ClassNotFoundException ex) {
        Logger.getLogger(showReport.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userName, password);
        PreparedStatement st = con.prepareStatement(query);
        st.setInt(1, ad.getId());
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            fr.setProductName(rs.getString("productname"));
            fr.setDate(rs.getString("date"));
            fr.setQuantity(rs.getInt("qty_order"));
            fr.setPrice(rs.getDouble("Total Income"));
            reportList.add(fr);
            fr=new Report();
        }
        session.setAttribute("reportList", reportList);
        st.close();
        con.close();
        response.sendRedirect("admin/dashboard.jsp");
            
        try (PrintWriter out = response.getWriter()) {
            /*if (log.equals("YES")){

                out.println("<script>window.location.href='dashboard.jsp'</script>");
                } else if (log.equals("NO")){
                out.println("<script>window.location.href='admin/dashboard.jsp'</script>");

                }*/
            
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
            Logger.getLogger(showReport.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(showReport.class.getName()).log(Level.SEVERE, null, ex);
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
