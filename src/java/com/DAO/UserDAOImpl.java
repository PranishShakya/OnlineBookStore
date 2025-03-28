/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

/**
 *
 * @author User
 */
import com.entity.User;
import java.sql.*;

public class UserDAOImpl implements UserDAO {

    private Connection con;

    public UserDAOImpl(Connection con) {
        super();
        this.con = con;
    }

    public boolean userRegister(User us) {
        boolean f = false;

        try {
            String sql = "insert into user(name,email,phno,password) values(?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, us.getName());
            pstmt.setString(2, us.getEmail());
            pstmt.setString(3, us.getPhno());
            pstmt.setString(4, us.getPassword());

            int i = pstmt.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public User login(String email, String password) {
        User us = null;
        try {
            String sql = "Select * from user where email=? and password=?";

            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setPincode(rs.getString(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

    public boolean checkPassword(int id, String ps) {
        boolean f = false;
        try {
            String sql = "select * from user where id=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, ps);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean updateProfile(User us) {
        boolean f = false;

        try {
            String sql = "update user set name=?,email=?, phno=? where id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, us.getName());
            pstmt.setString(2, us.getEmail());
            pstmt.setString(3, us.getPhno());
            pstmt.setInt(4, us.getId());

            int i = pstmt.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean checkUser(String em) {
        boolean f = true;
        try {
            String sql = "select * from user where email=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, em);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                f=false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
