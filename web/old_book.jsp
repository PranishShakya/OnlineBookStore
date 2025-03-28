<%-- 
    Document   : old_book
    Created on : Feb 20, 2024, 6:26:20 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Old Book</title>
        <%@include file="allcomp/allcss.jsp" %>
    </head>
    <body style="background-color:#f0f3f7;">
        <%@include file="allcomp/navbar.jsp" %>

        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"/>
        </c:if>


        <c:if test="${not empty succMsg}">
            <div class="alert alert-success text-center">
                ${succMsg}
            </div>
            <c:remove var="succMsg" scope="session" />
        </c:if>

        

        <div class="container p-5">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>                       
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        User u = (User) session.getAttribute("userobj");
                        String email = u.getEmail();
                        BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
                        List<BookDtls> list = dao.getBookByOld(email, "Old");
                        for (BookDtls b : list) {
                    %>
                    <tr>                      
                        <td><%= b.getBookname()%></td>
                        <td><%= b.getAuthor()%></td>
                        <td><%= b.getPrice()%></td>
                        <td><%= b.getBookCategory()%></td>
                        <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>
