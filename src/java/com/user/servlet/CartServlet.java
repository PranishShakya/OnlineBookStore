package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
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
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            int uid = Integer.parseInt(request.getParameter("uid"));

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
            BookDtls b = dao.getBookById(bid);

            Cart c = new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookname());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getCon());
            boolean f = dao2.addCart(c);

            HttpSession session = request.getSession();

            if (f) {
                session.setAttribute("addCart", "Book added to cart.");
                response.sendRedirect("all_new_book.jsp");
            } else {
                session.setAttribute("failed", "Something wrong on server.");
                response.sendRedirect("all_new_book.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
