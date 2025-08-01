/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
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
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            User us = new User();
            us.setId(id);
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            
            HttpSession session=req.getSession();
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getCon());

            boolean f = dao.checkPassword(id, password);
            if (f) {
                boolean f2 = dao.updateProfile(us);
                if (f2) {
                    session.setAttribute("succMsg", "User Profile Update Successfully..");
                    resp.sendRedirect("edit_profile.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something wrong on server");
                    resp.sendRedirect("edit_profile.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Invalid username and password");
                resp.sendRedirect("edit_profile.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
