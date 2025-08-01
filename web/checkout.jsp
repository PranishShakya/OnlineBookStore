<%-- 
    Document   : cart.jsp
    Created on : Jan 29, 2024, 8:08:51 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <%@include file="allcomp/allcss.jsp" %>
    </head>
    <body style="background-image: url(img/library2.jpg);">
        <%@include file="allcomp/navbar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>


        <c:if test="${not empty succMsg}">
            <div class="alert alert-success text-center" role="alert">
                ${succMsg}
            </div>
            <c:remove var="succMsg" scope="session"/>
        </c:if>


        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger text-center" role="alert">
                ${failedMsg}
            </div>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>
        <div class="container">
            <div class="row p-3">
                <div class="col-md-6">
                    <div class="card bg-white">
                        <div class="card-body">
                            <h3 class="text-center text-success">Selected Items</h3>
                            <table class="table table-striped mr-4">
                                <thead>
                                    <tr>
                                        <th scope="col">Book name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        User u = (User) session.getAttribute("userobj");
                                        CartDAOImpl dao = new CartDAOImpl(DBConnect.getCon());
                                        List<Cart> cart = dao.getBookByUser(u.getId());
                                        Double totalPrice = 0.00;
                                        for (Cart c : cart) {
                                            totalPrice = c.getTotalPrice();
                                    %>

                                    <tr>
                                        <th scope="row"><%=c.getBookName()%></th>
                                        <td><%=c.getAuthor()%></td>
                                        <td><%=c.getPrice()%></td>
                                        <td>
                                            <a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                    <%}
                                    %>
                                    <tr>
                                        <td>Total Price</td>
                                        <td></td>
                                        <td></td>
                                        <td><%=totalPrice%></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your details for placing order</h3>
                            <form action="order" method="post">
                                
                                
                                <input type="hidden" value="${userobj.id}" name="id" >
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Full Name</label>
                                        <input type="text" class="form-control" id="fname" name="username" value="${userobj.name}" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">E-mail</label>
                                        <input type="email" class="form-control" id="email" placeholder="Email" name="email" value="${userobj.email}" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Phone No.</label>
                                        <input type="number" class="form-control" id="num" placeholder="Ph Number" name="phno" value="${userobj.phno}" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input type="text" class="form-control" id="address" placeholder="Address" name="address" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input type="text" class="form-control" id="lm" placeholder="Landmark" name="landmark" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input type="text" class="form-control" id="city" placeholder="City" name="city" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Province</label>
                                        <input type="text" class="form-control" id="province" placeholder="Province" name="province" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Zip-code</label>
                                        <input type="number" class="form-control" id="zip" placeholder="Zip Code" name="zipcode" required>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label>Payment Method</label>
                                    <select class="form-control" name="payment">
                                        <option value="noselect">--Select--</option>
                                        <option>Cash on Delivery</option>
                                        <option>Khalti</option>
                                    </select>
                                </div>

                                <div class="text-center">
                                    <button class="btn btn-warning">Order Now</button>
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
    </body>
</html>
