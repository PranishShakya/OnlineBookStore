/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.BookDtls;
import com.entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class CartDAOImpl implements CartDAO {

    private Connection con;

    public CartDAOImpl(Connection con) {
        this.con = con;
    }

    @Override
    public boolean addCart(Cart c) {
        boolean f = false;
        try {
            String sql = "insert into cart(bid,uid,bookName,author,price,total_price)values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, c.getBid());
            pstmt.setInt(2, c.getUserId());
            pstmt.setString(3, c.getBookName());
            pstmt.setString(4, c.getAuthor());
            pstmt.setDouble(5, c.getPrice());
            pstmt.setDouble(6, c.getTotalPrice());

            int i = pstmt.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Cart> getBookByUser(int userId) {
        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        double totalPrice = 0;
        try {
            String sql = "select *from cart where uid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Cart();
                c.setCid(rs.getInt(1));
                c.setBid(rs.getInt(2));
                c.setUserId(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthor(rs.getString(5));
                c.setPrice(rs.getDouble(6));

                totalPrice = totalPrice + rs.getDouble(7);
                c.setTotalPrice(totalPrice);

                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteBook(int bid, int uid, int cid) {
        boolean f = false;
        try {
            String sql = "delete from cart where bid=? and uid=? and cid=?";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, bid);
            pstmt.setInt(2, uid);
            pstmt.setInt(3, cid);
            int i = pstmt.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
