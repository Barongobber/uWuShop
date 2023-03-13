/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 *
 * @author User
 */
public class CarouselController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        ArrayList<String> imgList=new ArrayList();
        ArrayList<Integer> idList=new ArrayList();
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
        PrintWriter out = response.getWriter();
        String control=request.getParameter("control");
        out.print(control);
        String from=request.getParameter("from");
        if(control.equals("loadCarousel")){
            try{
                connectDB();
                String sqls="select * from carouseltable";
                PreparedStatement ps=conn.prepareStatement(sqls);
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    imgList.add("dist/assets/img/" + rs.getString("imgsrc"));
                    idList.add(rs.getInt("carouselID"));
                }
                session=request.getSession(true);
                session.setAttribute("carousel", imgList);
                session.setAttribute("carouselID",idList);
                if(from.equals("admin")){
                    response.sendRedirect("admin/carouselmanager.jsp");
                }
                if(from.equals("user")){
                response.sendRedirect("homepageProducts");}
                ArrayList<String> a=new ArrayList();
                a=(ArrayList<String>)session.getAttribute("carousel");
                for(int i=0; i<a.size(); i++){
                    out.print(a.get(i));
                }
                closeDB();
            }
            catch(Exception e){
                e.printStackTrace();
            }
            
        }
        if(control.equals("addCarousel")){
            session=request.getSession(true);
            String a = request.getRealPath(request.getServletPath());
            final String DIR = "\\web\\dist\\assests\\img";
            String filename="";
            String sqls="INSERT INTO `carouseltable`(`imgsrc`) VALUES (?)";
            out.println(DIR);
            out.println(a);
            ArrayList<String> al = new ArrayList();
            
            try{
                connectDB();
                if(ServletFileUpload.isMultipartContent(request)){
                    try{
                    List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                    for(FileItem item : multiparts){
                            if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        al.add(name);
                        item.write(new File(DIR + File.separator + name));
                    } else {
                        String name = item.getFieldName();
                        String value = item.getString();
                        al.add(value);
                    }
                    }}
                    catch(Exception e){
                        e.printStackTrace();
                    }
                    
                }
                out.println(filename);
                PreparedStatement ps=conn.prepareStatement(sqls);
                ps.setString(1, filename);
                ps.executeUpdate();
                ps.close();
                closeDB();
            
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
        if(control.equals("deleteCarousel")){
            int carouselID= Integer.parseInt(request.getParameter("carouselid"));
            
            String sqlss="DELETE FROM `carouseltable` WHERE `carouselID` = ?";
            try{
                int i;
                connectDB();
                PreparedStatement pss=conn.prepareStatement(sqlss);
                pss.setInt(1,carouselID);
                i=pss.executeUpdate();
                pss.close();
                closeDB();
                if(i==1){
                    response.sendRedirect("CarouselController?control=loadCarousel&from=admin");
                    //response.sendRedirect("carouselmanager.jsp");
                }
                else{
                    request.getRequestDispatcher("admin/carouselmanager.jsp").forward(request, response);
                }
            }
            catch(Exception e){
                e.printStackTrace();
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
