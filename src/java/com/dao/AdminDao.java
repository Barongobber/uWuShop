/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.bean.Admin;
import java.sql.*;
import com.sun.istack.logging.Logger;
import java.util.logging.Level;
import sun.util.logging.PlatformLogger;

/**
 *
 * @author User
 */
public class AdminDao {
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
        public int registerAdmin(Admin admin) throws SQLException{
        connectDB();
        String sqls="INSERT INTO admintable(adminname, name, password) values (?, ?, ?);";
        
        int result=0;   
        PreparedStatement cps=conn.prepareStatement("select * from admintable where adminname=?");
        cps.setString(1,admin.getAdminname());
        ResultSet rs=cps.executeQuery();
        if(rs.next()){
            result=2;
        }
        else{
            PreparedStatement ps=conn.prepareStatement(sqls);
                    
                    ps.setString(1, admin.getAdminname());
                    ps.setString(2, admin.getName());
                    ps.setString(3, admin.getPassword());
                   
                    
                    result=ps.executeUpdate();
                    ps.close();          
        }
        closeDB();
        return result;
    }
    public boolean loginAdmin(Admin admin)throws SQLException{
        
        boolean b=false;
        connectDB();
        String sqls="select * from admintable where adminname=? and password=?";
        
        PreparedStatement ps=conn.prepareStatement(sqls);
        ps.setString(1, admin.getAdminname());
        ps.setString(2, admin.getPassword());
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
            b=true;
        }
        
        return b;
    }
    
        public Admin getAdminDetails(Admin admin)throws SQLException{
        connectDB();
        String sqls="select * from admintable where adminname=?";
        
        PreparedStatement ps=conn.prepareStatement(sqls);
        ps.setString(1, admin.getAdminname());
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
        admin.setId(rs.getInt("adminid"));
        admin.setName(rs.getString("name"));
        admin.setId(rs.getInt("adminid"));
        }
        return admin;
    }
}
