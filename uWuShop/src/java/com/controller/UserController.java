/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.User;
import com.dao.UserDao;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author User
 */
public class UserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private UserDao userDao;
    
    public void init(){
        userDao=new UserDao();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String control=request.getParameter("control");
        out.print(control);
        if(control.equals("registerUser")){
            String username=request.getParameter("username");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String phonenum=request.getParameter("phonenum");
            String password=request.getParameter("password");
            int res;

            User user=new User();
            user.setUsername(username);
            user.setName(name);
            user.setAddress(address);
            user.setPhonenum(phonenum);
            user.setEmail(email);
            user.setPassword(password);


            try{
                res=userDao.registerUser(user);
                /*if(res==2){
                    out.println("Username exist");
                    RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                    rd.include(request, response);
                }*/
                if(res==0||res==2){
                    RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                    request.setAttribute("alert", "Sorry, username \""+username+"\" is taken");
       
                    rd.forward(request, response);
                }
                else{
                    response.sendRedirect("index.jsp");
                }


            }
            catch(Exception e){
                e.printStackTrace();
            }}
        else if(control.equals("loginUser")){
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            User user=new User();
            user.setUsername(username);
            user.setPassword(password);
            
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
