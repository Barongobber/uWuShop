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
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kroener
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
    //End Database Connection functions
    public void init(){
        userDao=new UserDao();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String control=request.getParameter("control");
        out.println(control);
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
                connectDB();
                String sqls="INSERT INTO usertable(username, name, email, address, phonenum, password) values (?, ?, ?, ?, ?, ?);";
        
                int result=0;   
                PreparedStatement cps=conn.prepareStatement("select * from usertable where username=?");
                cps.setString(1,user.getUsername());
                ResultSet rs=cps.executeQuery();
                if(rs.next()){
                    result=2;
                }
                else{
                    PreparedStatement ps=conn.prepareStatement(sqls);
                    
                    ps.setString(1, user.getUsername());
                    ps.setString(2, user.getName());
                    ps.setString(3, user.getEmail());
                    ps.setString(4, user.getAddress());
                    ps.setString(5, user.getPhonenum());
                    ps.setString(6, user.getPassword());
                   
                    
                    result=ps.executeUpdate();
                    ps.close();          
                }
                closeDB();
                if(result==0||result==2){
                    RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                    request.setAttribute("alert", "Sorry, username \""+username+"\" is taken");
                    
                    rd.forward(request, response);
                }
                else{
                    boolean b=false;
                    connectDB();
                    String sqlss="select * from usertable where username=? and password=?";
        
                    PreparedStatement pss=conn.prepareStatement(sqlss);
                    pss.setString(1, user.getUsername());
                    pss.setString(2, user.getPassword());
                    ResultSet rss=pss.executeQuery();
                    while(rss.next()){
                        b=true;
                        user.setId(rss.getInt("userid"));
                        user.setUsername(rss.getString("username"));
                        user.setName(rss.getString("name"));
                        user.setEmail(rss.getString("email"));
                        user.setAddress(rss.getString("address"));
                        user.setPassword(rss.getString("password"));
                        user.setPhonenum(rss.getString("phonenum"));
                    }
                    closeDB();
                    if(b==true){
                        session=request.getSession(true);
                        session.setAttribute("user", user);
                        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                        rd.forward(request, response);
                    }
                    else{
                        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                        request.setAttribute("alert", "Wrong username or password");
                        rd.forward(request, response);
                    }
                }


            }
            catch(Exception e){
                e.printStackTrace();
            }}
        if(control.equals("loginUser")){
            
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            User user=new User();
            user.setUsername(username);
            user.setPassword(password);
            
            try{
                boolean b=false;
                connectDB();
                String sqls="select * from usertable where username=? and password=?";
        
                PreparedStatement ps=conn.prepareStatement(sqls);
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getPassword());
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    b=true;
                    user.setId(rs.getInt("userid"));
                    user.setUsername(rs.getString("username"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setAddress(rs.getString("address"));
                    user.setPassword(rs.getString("password"));
                    user.setPhonenum(rs.getString("phonenum"));
                    user.setCrmsubs(rs.getBoolean("crmsubs"));
                }
                closeDB();
                if(b==true){
                    session=request.getSession(true);
                    session.setAttribute("user", user);
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }
                else{
                    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                    request.setAttribute("alert", "Wrong username or password");
                    rd.forward(request, response);
                }
            
            }catch(Exception e){
                e.printStackTrace();
            }   
        }
        if(control.equals("logoutUser")){
            session = request.getSession();
            session.invalidate();
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        if(control.equals("updateUser")){
            String username=request.getParameter("username");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String phonenum=request.getParameter("phonenum");
            boolean crmsubs=Boolean.parseBoolean(request.getParameter("crmsubs"));
           
            User user=new User();
            user.setUsername(username);
            user.setName(name);
            user.setAddress(address);
            user.setPhonenum(phonenum);
            user.setEmail(email);
            user.setPassword(((User)session.getAttribute("user")).getPassword());
            user.setCrmsubs(crmsubs);
            try{
                int i=0;
                connectDB();
                String sqls="UPDATE usertable SET username=?, name=?, email=?, address=?, phonenum=?, crmsubs=? WHERE username=?";
                PreparedStatement ps=conn.prepareStatement(sqls);
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getName());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getAddress());
                ps.setString(5, user.getPhonenum());
                ps.setBoolean(6, user.isCrmsubs());
                ps.setString(7, ((User)session.getAttribute("user")).getUsername());    
        
                i=ps.executeUpdate();
                ps.close();
                closeDB();
                if(i!=1){
                    
                    RequestDispatcher rd=request.getRequestDispatcher("edituser.jsp");
                    request.setAttribute("alert", "Failed to update user data");
                    rd.forward(request, response);
                }
                else if(i==1){
                    session.setAttribute("user", user);
                    RequestDispatcher rd=request.getRequestDispatcher("user.jsp");
                    request.setAttribute("alert", "User Data updated successfully");
                    rd.forward(request, response);
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
            
        }
        if(control.equals("deleteAccount")){
            User user=(User)session.getAttribute("user");
            try{
            int i;
            connectDB();
            String sqls="DELETE from usertable where username=?";
            PreparedStatement ps=conn.prepareStatement(sqls);
            ps.setString(1, user.getUsername());
            i=ps.executeUpdate();
            ps.close();
            closeDB();
            if(i==1){
                session = request.getSession();
                session.invalidate();
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);}
            else{
                request.getRequestDispatcher("usersettings.jsp").forward(request, response);
                
            }
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
        if(control.equals("changePassword")){
            User user=(User)session.getAttribute("user");
            String password=request.getParameter("password");
            out.println(user.getUsername());
            out.println(password);
            try{
                int i;
                connectDB();
                
                String sqls="UPDATE usertable SET password=? WHERE username=?";
                PreparedStatement ps=conn.prepareStatement(sqls);
                ps.setString(1, password);
                ps.setString(2, user.getUsername());
                i=ps.executeUpdate();
                ps.close();
                closeDB();
                if(i!=1){
                    
                    RequestDispatcher rd=request.getRequestDispatcher("usersettings.jsp");
                    request.setAttribute("alert", "Failed to change password");
                    rd.forward(request, response);
                }
                else if(i==1){
                    user.setPassword(password);
                    session.setAttribute("user", user);
                    RequestDispatcher rd=request.getRequestDispatcher("usersettings.jsp");
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
