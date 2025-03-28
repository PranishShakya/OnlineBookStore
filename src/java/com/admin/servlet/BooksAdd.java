package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = req.getParameter("categories");
            String status = req.getParameter("status");
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();

            BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, "admin");
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());

            ServletContext context = getServletContext();

            boolean f = dao.addBooks(b);
            HttpSession session = req.getSession();

            if (f) {
                String path = "C:/Users/User/OneDrive/Documents/NetBeansProjects/SumProjectWeb/web/book/" +fileName;
                FileOutputStream file = new FileOutputStream(path);
                InputStream is=part.getInputStream();
                
                byte[] data=new byte[is.available()];
                is.read(data);
                file.write(data);
                file.close();

                session.setAttribute("succMsg", "Book Added Successfully");
                resp.sendRedirect("admin/add_books.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on server");
                resp.sendRedirect("admin/add_books.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
