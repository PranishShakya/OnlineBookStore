/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String em = req.getParameter("em");
            int id=Integer.parseInt(req.getParameter("id"));
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());

            boolean f = dao.oldBookDelete(em, "Old", id);
            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "Old Book Delete Successfully.");
                resp.sendRedirect("old_book.jsp");
            } else {
                session.setAttribute("succMsg", "Something wrong on server.");
                resp.sendRedirect("old_book.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
