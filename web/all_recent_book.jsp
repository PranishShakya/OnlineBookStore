<%-- 
    Document   : all_recent_book
    Created on : Jan 21, 2024, 3:16:33 PM
    Author     : User
--%>

<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Recent Books</title>
        <%@include file="allcomp/allcss.jsp" %>
        <style type="text/css">
            .crd-ho:hover{
                background-color:#f0f3f7;
            }
        </style>
    </head>
    <body>
        <%@include file="allcomp/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row p-3">

                <%
                    User u = (User) session.getAttribute("userobj");
                %>

                <%
                    BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getCon());
                    List<BookDtls> list1 = dao2.getAllRecentBook();
                    for (BookDtls b : list1) {%>
                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center ml-2">
                            <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumblin">
                            <p><%=b.getBookname()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>
                                <%
                                    if (b.getBookCategory().equals("Old")) {%>
                                Categories: <%=b.getBookCategory()%></p>
                            <div class="row">


                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ml-5"><i class="fa-solid fa-eye"></i> View Details</a>
                                <a href="" class="btn btn-primary btn-sm ml-1">Rs.<%=b.getPrice()%></a>
                            </div> 
                            <%} else {%>
                            Categories:
                            <%= b.getBookCategory()%></p>
                            <div class="row">
                                <% if (u == null) {%>
                                <a href="Login.jsp" class="btn btn-success btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                                <% } else {%>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                                <%}%>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-eye"></i> View</a>
                                <a href="" class="btn btn-primary btn-sm ml-1">Rs.<%=b.getPrice()%></a>
                            </div>
                            <% }
                            %>


                        </div>
                    </div>
                </div>
                <%  }
                %>

            </div>

        </div>
    </body>
</html>
