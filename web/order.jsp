<%-- 
    Document   : order.jsp
    Created on : Feb 19, 2024, 3:50:05 PM
    Author     : User
--%>

<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allcomp/allcss.jsp" %>
    </head>
    <body style="background-color:#f0f3f7;">
        <%@include file="allcomp/navbar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>

        <div class="container mt-3">
            <h3 class="text-center mt-2">My Orders</h3>
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        User u = (User) session.getAttribute("userobj");
                        BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getCon());
                        List<Book_Order> blist = dao.getBook(u.getEmail());
                        for (Book_Order b : blist) {%>
                    <tr>
                        <th scope="row"><%=b.getOrderId()%></th>
                        <td><%=b.getUserName()%></td>
                        <td><%=b.getBookName()%></td>
                        <td><%=b.getAuthor()%></td>
                        <td><%=b.getPrice()%></td>
                        <td><%=b.getPaymentType()%></td>
                    </tr>
                    <% }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>
