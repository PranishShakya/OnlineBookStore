<%-- 
    Document   : all_books
    Created on : Jan 15, 2024, 11:24:46 AM
    Author     : User
--%>

<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin:All Orders</title>
        <%@include file="allcss.jsp" %>
    </head>
    <body>

        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        <%@include file="navbar.jsp" %>


        <h3 class="text-center">Your Orders</h3>
        <table class="table table-striped">
            <thead class="text-white bg-dark">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">E-Mail</th>
                    <th scope="col">Address</th>
                    <th scope="col">Ph-No</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>

                <%
                    BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getCon());
                    List<Book_Order> blist = dao.getAllOrder();
                    for (Book_Order b : blist) {%>
                <tr>
                    <th scope="row"><%=b.getOrderId()%></th>
                    <td><%=b.getUserName()%></td>
                    <td><%=b.getEmail()%></td>
                    <td><%=b.getFullAdd()%></td>
                    <td><%=b.getPhno()%></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getPaymentType()%></td>
                </tr>
                <%  }
                %>

            </tbody>
        </table>


    </body>
</html>
