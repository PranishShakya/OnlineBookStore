<%-- 
    Document   : all_old_book
    Created on : Jan 21, 2024, 3:16:33 PM
    Author     : User
--%>

<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Books</title>
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
                    BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getCon());
                    List<BookDtls> list3 = dao3.getAllOldBook();
                    for (BookDtls b : list3) {%>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumblin">
                            <p><%=b.getBookname()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row"> 
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ml-5"><i class="fa-solid fa-eye"></i> View Details</a>
                                <a href="" class="btn btn-primary btn-sm ml-2">Rs.<%=b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%  }
                %>


            </div>

        </div>
    </body>
</html>
