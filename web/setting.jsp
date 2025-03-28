<%-- 
    Document   : setting
    Created on : Feb 19, 2024, 11:38:00 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allcomp/allcss.jsp" %>
        <style type="text/css">
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;
            }

        </style>
    </head>
    <body style="background-image: url(bggg.jpg);">
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        <%@include file="allcomp/navbar.jsp" %>
        <div class="container">
            <h3 class="text-center">Manage My Account!</h3>
            <div class="row p-5">

                <div class="col-md-4">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary"> <i class="fa-solid fa-book-open fa-3x"></i></div>
                                <h4>Sell Old Books</h4>
                            </div>                              
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="old_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary"> <i class="fa-solid fa-book-open fa-3x"></i></div>
                                <h4>Old Book</h4>
                            </div>                              
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-success"> <i class="fa-solid fa-address-card fa-3x"></i></div>
                                <h4>Edit Profile</h4>
                            </div>                              
                        </div>
                    </a>
                </div>

                <div class="col-md-6 mt-5">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger"> <i class="fa-solid fa-box-open fa-3x"></i></div>
                                <h4>My Orders</h4>
                                <p>Track your Order</p>
                            </div>                              
                        </div>
                    </a>
                </div>

                <div class="col-md-6 mt-5">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-warning"> <i class="fas fa-user-circle fa-3x"></i></div>
                                <h4>Help Center</h4>
                                <p>12*7 Service</p>
                            </div>                              
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
