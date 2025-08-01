<%-- 
    Document   : Register
    Created on : Dec 21, 2023, 10:07:13 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Book Register</title>
        <%@include file="allcomp/allcss.jsp" %>
    </head>
    <body style="background-image: url(img/library2.jpg);">
        <%@include file="allcomp/navbar.jsp" %>
        <div class="conatiner p-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Registration Page</h4>
                            
                            <c:if test="${not empty successMsg}">
                            <p class="text-center text-success">${successMsg}</p>
                            <c:remove var="successMsg" scope="session" />
                            </c:if>
                            
                            <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session" />
                            </c:if>
                            
                            
                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="exampleInputName"><i class="fa-solid fa-file-lines"></i> Full Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Full Name" required="required" name="fname">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1"><i class="fa-solid fa-envelope"></i> Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPhone"><i class="fa-solid fa-phone"></i> Phone No.</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone Number" required="required" name="phno">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1"><i class="fa-solid fa-lock"></i> Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" name="password">
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms & conditions.</label>
                                </div>
                                <button type="submit" class="btn btn-primary">Sign Up</button>
                                <div class="login-register">
                                    <p>Already have an account? <a href="Login.jsp" class="login-link">Login</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
