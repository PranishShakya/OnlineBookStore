/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.Book_Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author User
 */
public class BookOrderDAOImpl implements BookOrderDAO {

    private Connection con;

    public BookOrderDAOImpl(Connection con) {
        this.con = con;
    }

    public boolean saveOrder(List<Book_Order> blist) {
        boolean f = false;
        try {
            String sql = "insert into book_order(order_id, user_name, email, address, phno, book_name, author, price, payment) values(?,?,?,?,?,?,?,?,?)";

            con.setAutoCommit(false);
            PreparedStatement pstmt = con.prepareStatement(sql);

            for (Book_Order b : blist) {
                pstmt.setString(1, b.getOrderId());
                pstmt.setString(2, b.getUserName());
                pstmt.setString(3, b.getEmail());
                pstmt.setString(4, b.getFullAdd());
                pstmt.setString(5, b.getPhno());
                pstmt.setString(6, b.getBookName());
                pstmt.setString(7, b.getAuthor());
                pstmt.setString(8, b.getPrice());
                pstmt.setString(9, b.getPaymentType());
                pstmt.addBatch();
            }
            int[] count = pstmt.executeBatch();
            con.commit();
            f = true;
            con.setAutoCommit(true);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<Book_Order> getBook(String email) {

        List<Book_Order> list = new ArrayList<Book_Order>();
        Book_Order o = null;
        try {

            String sql = "select * from book_order where email=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                o = new Book_Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullAdd(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book_Order> getAllOrder() {
        List<Book_Order> list = new ArrayList<Book_Order>();
        Book_Order o = null;
        try {

            String sql = "select * from book_order ";
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                o = new Book_Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullAdd(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }
}
