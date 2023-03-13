/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Admin;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author tres
 */
public class addProduct extends HttpServlet {

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
        final String UPLOAD_DIRECTORY = (String) session.getAttribute("path");
        ArrayList<String> al = new ArrayList();
        
        // assign session admin to product
        Admin ad = (Admin) session.getAttribute("admin");
        
        //set dB
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "uwushop";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        
        String createquery = "insert into product (productname, category, price, quantity, description, image, adminid) values (?, ?, ?, ?, ?, ?, ?)";
              
        if(ServletFileUpload.isMultipartContent(request)){
            try{
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        al.add(name);
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                    } else {
                        String name = item.getFieldName();
                        String value = item.getString();
                        al.add(value);
                    }
                }
                // assign id admin into adminid as FK in table product
                String ad_id = Integer.toString(ad.getId());
                al.add(ad_id);
            }
            catch(Exception ex){
                
            }
        }
        
        try{
            Class.forName(driver);
        }catch(ClassNotFoundException ex){
                Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Connection con = DriverManager.getConnection(url, userName, password);
        PreparedStatement ps = con.prepareStatement(createquery);
        
            //insert assigned data into database
            for(int i = 0; i < al.size(); i++){
                String a = (String)al.get(i);
                if(i == 3){
                    int x = Integer.parseInt(a);
                    ps.setInt(i+1, x);
                }
                else if(i == 2){
                    double x = Double.parseDouble(a);
                    ps.setDouble(i+1, x);
                } else if (i == 6){
                    int x = Integer.parseInt(a);
                    ps.setInt(i+1, x);
                }
                else{
                    ps.setString(i+1, a);
                }
            }
        
        int insertStatus = 0;

        ps.executeUpdate();
        System.out.println(insertStatus + "row affected");
        
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            RequestDispatcher rd = request.getRequestDispatcher("showProduct?user=ADMIN");
            rd.forward(request, response);  
        }
        ps.close();
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
            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
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
