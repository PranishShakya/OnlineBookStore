/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.BookDtls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class BookDAOImpl implements BookDAO {

    private Connection con;

    public BookDAOImpl(Connection con) {
        super();
        this.con = con;
    }

    @Override
    public boolean addBooks(BookDtls b) {
        boolean f = false;
        try {
            String sql = "insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, b.getBookname());
            pstmt.setString(2, b.getAuthor());
            pstmt.setString(3, b.getPrice());
            pstmt.setString(4, b.getBookCategory());
            pstmt.setString(5, b.getStatus());
            pstmt.setString(6, b.getPhotoName());
            pstmt.setString(7, b.getEmail());

            int i = pstmt.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<BookDtls> getAllBooks() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls ";
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public BookDtls getBookById(int id) {
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookId=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public boolean updateEditBooks(BookDtls b) {
        boolean f = false;
        try {
            String sql = "update book_dtls set bookname=?, author=?, price=?, status=? where bookId=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, b.getBookname());
            pstmt.setString(2, b.getAuthor());
            pstmt.setString(3, b.getPrice());
            pstmt.setString(4, b.getStatus());
            pstmt.setInt(5, b.getBookId());

            int i = pstmt.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteBooks(int id) {
        boolean f = false;

        try {
            String sql = "delete from book_dtls where bookId=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            int i = pstmt.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<BookDtls> getNewBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "New");
            pstmt.setString(2, "Active");
            ResultSet rs = pstmt.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookDtls> getRecentBooks() {
        List<BookDtls> list1 = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where  status=? order by bookId DESC";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "Active");
            ResultSet rs = pstmt.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list1.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list1;

    }

    public List<BookDtls> getOldBooks() {
        List<BookDtls> list3 = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "Old");
            pstmt.setString(2, "Active");
            ResultSet rs = pstmt.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list3.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list3;
    }

    public List<BookDtls> getAllRecentBook() {
        List<BookDtls> list1 = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where  status=? order by bookId DESC";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "Active");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list1.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list1;
    }

    public List<BookDtls> getAllNewBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "New");
            pstmt.setString(2, "Active");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookDtls> getAllOldBook() {
        List<BookDtls> list3 = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "Old");
            pstmt.setString(2, "Active");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list3.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list3;
    }

    public List<BookDtls> getBookByOld(String email, String cate) {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {

            String sql = "select * from book_dtls where email=? and bookCategory=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, cate);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean oldBookDelete(String email, String cat, int id) {
        boolean f = false;
        try {
            String sql = "delete from book_dtls where email=? and bookCategory=? and bookId=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, cat);
            pstmt.setInt(3, id);
            int i = pstmt.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public List<BookDtls> getBookBySearch(String ch){
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {

            String sql = "select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+ch+"%");
            pstmt.setString(2, "%"+ch+"%");
            pstmt.setString(3, "%"+ch+"%");
            pstmt.setString(4, "Active");

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookname(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
