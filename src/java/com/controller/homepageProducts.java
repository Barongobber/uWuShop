/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class homepageProducts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
       
        HttpSession session;
        // Start Database Connection functions
        private String driver="com.mysql.jdbc.Driver";
        private String dbname="uwushop";
        private String url="jdbc:mysql://localhost/"+dbname+"?";
        private String dbuname="root";
        private String dbpw="";
        private Connection conn;
        private void connectDB(){
            try{
                Class.forName(driver);
                conn=DriverManager.getConnection(url, dbuname, dbpw);
            }
            catch(SQLException e){
                e.printStackTrace();
            }
            catch (ClassNotFoundException e) {
                e.printStackTrace();
            } 
        }
    
        private void closeDB() {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }	
        }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         ArrayList<Product> homeProduct=new ArrayList();
        ArrayList<Integer> soldCount = new ArrayList();
        PrintWriter out = response.getWriter();
        Product pro= new Product();
        int count=0;
        try{
            connectDB();
            String sqls="SELECT product.*, SUM(`order`.qty_order) AS 'totalsold' FROM product INNER JOIN `order` ON product.product_id = `order`.product_id \n" +
                        "GROUP BY `order`.product_id ORDER BY `totalsold` DESC LIMIT 2;";
            PreparedStatement ps=conn.prepareStatement(sqls);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                pro.setProductid(rs.getInt("product_id"));
                pro.setName(rs.getString("productname"));
                pro.setQuantity(Integer.parseInt(rs.getString("quantity")));;
                pro.setPrice(Double.parseDouble(rs.getString("price")));
                pro.setCategory(rs.getString("category"));
                pro.setImagesrc(rs.getString("image"));
                pro.setDescription(rs.getString("description"));
                count=rs.getInt("totalsold");
                homeProduct.add(pro);
                soldCount.add(count);
                pro=new Product();
            }
            session=request.getSession(true);
            session.setAttribute("homeProduct", homeProduct);
            session.setAttribute("soldCount", soldCount);
            response.sendRedirect("index.jsp?content=loaded");
            closeDB();
        }
        catch (Exception e){
            e.printStackTrace();
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
