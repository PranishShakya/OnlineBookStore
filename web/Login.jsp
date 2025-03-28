<%-- 
    Document   : Login
    Created on : Dec 21, 2023, 10:58:58 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Book Login</title>
        <%@include file="allcomp/allcss.jsp" %>
    </head>
    <body style="background-image: url(img/library2.jpg);">
        <%@include file="allcomp/navbar.jsp" %>
        <div class="container  p-5">
            <div class="row mt-2">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Login</h3>

                            <c:if test="${not empty failedMsg}">
                                <h5 class="text-center text-danger">${failedMsg}</h5>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty succMsg}">
                                <h5 class="text-center text-success">${succMsg}</h5>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>



                            <form action="login"  method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><i class="fa-solid fa-envelope"></i> Email</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1"><i class="fa-solid fa-lock"></i> Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" name="password">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                                <div class="login-register">
                                    <p>Don't have an account? <a href="Register.jsp" class="register-link">Register</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
