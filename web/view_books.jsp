<%-- 
    Document   : view_books
    Created on : Jan 21, 2024, 6:58:17 PM
    Author     : User
--%>

<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allcomp/allcss.jsp" %>
    </head>
    <body style="background-image: url(admin/bggg.jpg); ">
        <%@include file="allcomp/navbar.jsp" %>
        <%
            int bid = Integer.parseInt(request.getParameter("bid"));
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
            BookDtls b = dao.getBookById(bid);

        %>


        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="book/<%=b.getPhotoName()%>" style="height: 150px; width: 100px;"><br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname()%></span></h4>
                    <h4>Author Name: <span class="text-success" ><%=b.getAuthor()%></span></h4>
                    <h4>Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=b.getBookname()%></h2>

                    <%
                        if ("Old".equals(b.getBookCategory())) {%>
                    <h5 class="text-primary">Contact to Seller</h5>
                    <h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email:<%=b.getEmail()%></h5>
                    <% }
                    %>
                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-regular fa-money-bill-1 fa-2x"></i>
                            <p>Cash on Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-wallet fa-2x"></i>
                            <p><a href="#">Wallet</a></p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-truck fa-2x"></i>
                            <p>Free Delivery</p>
                        </div>
                    </div>


                    <%
                        if ("Old".equals(b.getBookCategory())) {%>
                    <div class="text-center p-3">
                        <a href="index.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Continue Shopping</a>
                        <a href="" class="btn btn-primary">Rs.<%=b.getPrice()%></a>
                    </div>
                    <%} else {%>
                    <div class="text-center p-3">
                        <a href="Login.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Add to Cart</a>
                        <a href="" class="btn btn-primary">Rs.<%=b.getPrice()%></a>
                    </div>
                    <%}
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
