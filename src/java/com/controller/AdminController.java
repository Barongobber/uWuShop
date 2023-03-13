/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Admin;
import com.bean.User;
import com.dao.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author Kroener
 */
public class AdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private AdminDao adminDao;
    HttpSession session;
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
    public void init(){
        adminDao=new AdminDao();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String control=request.getParameter("control");
        out.print(control);
        
        if(control.equals("registerAdmin")){
            String adminname=request.getParameter("adminname");
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            int res;

            Admin admin=new Admin();
            admin.setAdminname(adminname);
            admin.setName(name);
            admin.setPassword(password);
            try{
                res=adminDao.registerAdmin(admin);
                /*if(res==2){
                    out.println("Username exist");
                    RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                    rd.include(request, response);
                }*/
                if(res==0||res==2){
                    RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                    request.setAttribute("alert", "Sorry, adminname \""+adminname+"\" is taken");
       
                    rd.forward(request, response);
                }
                else{
                    response.sendRedirect("index.jsp");
                }


            }
            catch(Exception e){
                e.printStackTrace();
            }}
        
        if(control.equals("loginAdmin")){
            
            String adminname=request.getParameter("adminname");
            String password=request.getParameter("password");
            Admin admin=new Admin();
            admin.setAdminname(adminname);
            admin.setPassword(password);
            
            try{
                boolean b=false;
                connectDB();
                String sqls="select * from admintable where adminname=? and password=?";
        
                PreparedStatement ps=conn.prepareStatement(sqls);
                ps.setString(1, admin.getAdminname());
                ps.setString(2, admin.getPassword());
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    admin.setId(rs.getInt("adminid"));
                    admin.setName(rs.getString("name"));
                    admin.setId(rs.getInt("adminid"));
                    b=true;
                }
                ps.close();
                closeDB();
                if(b==true){
                    session=request.getSession(true);
                    session.setAttribute("admin", admin);
                    RequestDispatcher rd=request.getRequestDispatcher("../PurchaseStatus?login=YES&user=ADMIN&id=" + admin.getId() );
                    rd.forward(request, response);
                }
                else{
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                    request.setAttribute("alert", "Wrong adminname or password");
                    rd.forward(request, response);
                }
                
            
            }catch(Exception e){
                e.printStackTrace();}
            
        }
        if(control.equals("logoutAdmin")){
            session = request.getSession();
            session.invalidate();
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        if(control.equals("deleteAccount")){
            Admin admin=(Admin)session.getAttribute("admin");
            try{
            int i;
            connectDB();
            String sqls="DELETE from admintable where adminname=?";
            PreparedStatement ps=conn.prepareStatement(sqls);
            ps.setString(1, admin.getAdminname());
            i=ps.executeUpdate();
            ps.close();
            closeDB();
            if(i==1){
                session = request.getSession();
                session.invalidate();
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);}
            else{
                request.getRequestDispatcher("adminsettings.jsp").forward(request, response);
                
            }
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
        if(control.equals("changePassword")){
            Admin admin=(Admin)session.getAttribute("admin");
            String password=request.getParameter("password");
            out.println(admin.getAdminname());
            out.println(password);
            try{
                int i;
                connectDB();
                
                String sqls="UPDATE admintable SET password=? WHERE adminname=?";
                PreparedStatement ps=conn.prepareStatement(sqls);
                ps.setString(1, password);
                ps.setString(2, admin.getAdminname());
                i=ps.executeUpdate();
                ps.close();
                closeDB();
                if(i!=1){
                    
                    RequestDispatcher rd=request.getRequestDispatcher("usersettings.jsp");
                    request.setAttribute("alert", "Failed to change password");
                    rd.forward(request, response);
                }
                else if(i==1){
                    admin.setPassword(password);
                    session.setAttribute("admin", admin);
                    RequestDispatcher rd=request.getRequestDispatcher("adminsettings.jsp");
                    request.setAttribute("msg", "Your password has been changed");
                    rd.forward(request, response); 
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
