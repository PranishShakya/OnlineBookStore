/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.entity.User;
import com.DAO.*;
import com.DB.DBConnect;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("fname");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String password = request.getParameter("password");
            String check = request.getParameter("check");

            //  System.out.println(name+" "+email+" "+phno+"  "+password+" "+check);
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(password);

            HttpSession session = request.getSession();
            if (check != null) {

                UserDAOImpl dao = new UserDAOImpl(DBConnect.getCon());
                boolean f2 = dao.checkUser(email);
                if (f2) {
                    boolean f = dao.userRegister(us);
                    if (f) {
                        //System.out.println("User Register Successfully..");
                        session.setAttribute("successMsg", "Registered Successfully..");
                        response.sendRedirect("Register.jsp");
                    } else {
                        // System.out.println("Something Wrong on server..");

                        session.setAttribute("failedMsg", "Something's Wrong!");
                        response.sendRedirect("Register.jsp");
                    }
                } else {
                    session.setAttribute("failedMsg", "User already exist try another email.");
                    response.sendRedirect("Register.jsp");
                }
            } else {
                // System.out.println("Please Check Agree & Terms Condition.");
                session.setAttribute("failedMsg", "Please Check Agree & Terms Condition.");
                response.sendRedirect("Register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
