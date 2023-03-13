/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import java.sql.*;
import com.bean.User;
import com.sun.istack.logging.Logger;
import java.util.logging.Level;
import sun.util.logging.PlatformLogger;

/**
 *
 * @author User
 */
public class UserDao {
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
    
    public int registerUser(User user) throws SQLException{
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
        return result;
    }
    public boolean loginUser(User user)throws SQLException{
        
        boolean b=false;
        connectDB();
        String sqls="select * from usertable where username=? and password=?";
        
        PreparedStatement ps=conn.prepareStatement(sqls);
        ps.setString(1, user.getUsername());
        ps.setString(2, user.getPassword());
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
            b=true;
        }
        closeDB();
        return b;
    }
    public User getUserDetails(User user)throws SQLException{
        connectDB();
        String sqls="select * from usertable where username=?";
        
        PreparedStatement ps=conn.prepareStatement(sqls);
        ps.setString(1, user.getUsername());
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
        user.setId(rs.getInt("userid"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setAddress(rs.getString("address"));
        user.setPhonenum(rs.getString("phonenum"));
        user.setCrmsubs(rs.getBoolean("crmsubs"));}
        closeDB();
        return user;
        
    }
    
    public int updateUser(User user, String u) throws SQLException{
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
        ps.setString(7, u);    
        
        i=ps.executeUpdate();
        ps.close();
        closeDB(); 
        return i;
    }
    public int deleteUser(User user, String u) throws SQLException{
        int i;
        connectDB();
        String sqls="DELETE from usertable where username=?";
        PreparedStatement ps=conn.prepareStatement(sqls);
        ps.setString(1, user.getUsername());
        i=ps.executeUpdate();
        ps.close();
        closeDB();
        return i;
    }
}
