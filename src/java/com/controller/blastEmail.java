/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Campaign;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
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
 * @author gobib
 */
@WebServlet(name = "blastEmail", urlPatterns = {"/blastEmail"})
public class blastEmail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        ArrayList<String> rec = new ArrayList<String>();
        rec = (ArrayList) session.getAttribute("recipient");
        int total=0;
 
        LocalDate today = LocalDate.now();
        String curDate = today.format(DateTimeFormatter.ofPattern("dd-MMM-yy"));
        String camName = request.getParameter("campaign-name");
        String camSubject = request.getParameter("subject-email");
        String emailContent = request.getParameter("content-email");
        for (int i =0; i < rec.size(); i++){
            total += 1;
        }
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "uwushop";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query = "INSERT INTO campaign(campaign_name, campaign_subject, total_recipients, blasted_on, email_content) VALUES (?,?,?,?,?)";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(blastEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userName, password);
        PreparedStatement st = con.prepareStatement(query);
        

        // Get recipient's email-ID, message & subject-line from index.html page

        final String subject = camSubject;
        final String messg = emailContent;

        // Sender's email ID and password needs to be mentioned
        final String from = "gobberon@gmail.com";
        final String pass = "lkw454da78";

        // Defining the gmail host
        String host = "smtp.gmail.com";

        // Creating Properties object
        Properties props = new Properties();

        // Defining properties
        props.put("mail.smtp.host", host);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.user", from);
        props.put("mail.password", pass);
        props.put("mail.port", "465");

        // Authorized the Session object.
        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            for(int i =0;i<rec.size(); i++){

            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(rec.get(i)));
            }
            // Set Subject: header field
            message.setSubject(subject);
            // Now set the actual message
            message.setText(messg);
            // Send message
            Transport.send(message);

            Campaign c = new Campaign();
            c.setCampaignName(camName);
            c.setCampaignSubject(camSubject);
            c.setBlastedDate(curDate);
            c.setTotalRec(total);
            c.setContentEmail(emailContent);



            st.setString(1, c.getCampaignName());
            st.setString(2, c.getCampaignSubject());
            st.setInt(3, c.getTotalRec());
            st.setString(4, c.getBlastedDate());
            st.setString(5, c.getContentEmail());
            st.executeUpdate();


            try (PrintWriter out = response.getWriter()) {
                out.println("<script>alert('Your Email Has been Sent successfully')</script>");
                out.println("<script>window.location.href='showListCampaign'</script>");
            }


        } catch (MessagingException mex) {

            mex.printStackTrace();
            Campaign c = new Campaign();
            c.setCampaignName(camName);
            c.setCampaignSubject(camSubject);
            c.setBlastedDate(curDate);
            c.setTotalRec(total);
            c.setContentEmail(emailContent);


            st.setString(1, c.getCampaignName());
            st.setString(2, c.getCampaignSubject());
            st.setInt(3, c.getTotalRec());
            st.setString(4, c.getBlastedDate());
            st.setString(5, c.getContentEmail());
            st.executeUpdate();
    
            try (PrintWriter out = response.getWriter()) {
                
                out.println("<script>alert('Your Email Has been Sent successfully!!')</script>");
                out.println("<script>window.location.href='showListCampaign'</script>");
            }
        

    }
        
            /* TODO output your page here. You may use following sample code. */
        
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
            Logger.getLogger(blastEmail.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(blastEmail.class.getName()).log(Level.SEVERE, null, ex);
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
