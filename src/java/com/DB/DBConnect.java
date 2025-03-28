/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DB;

/**
 *
 * @author User
 */
import java.sql.*;
public class DBConnect {
    private static Connection con; 
    public static Connection getCon(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-book", "root", "");
        }catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }
}


