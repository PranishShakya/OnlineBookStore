<%-- 
    Document   : edit_profile
    Created on : Feb 19, 2024, 3:42:23 PM
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
    </head>
    <body style="background-image: url(bggg.jpg);">
        <%@include file="allcomp/navbar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-primary p-1">Edit Profile</h4>


                            <c:if test="${not empty failedMsg}">
                                <h5 class="text-center text-danger">${failedMsg}</h5>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty succMsg}">
                                <h5 class="text-center text-success">${succMsg}</h5>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                            <form action="update_profile" method="post">
                                <input type="hidden" value="${userobj.id}" name="id">

                                <div class="form-group">
                                    <label for="exampleInputName"><i class="fa-solid fa-file-lines"></i> Full Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           placeholder="Enter Full Name" required="required" name="fname" value="${userobj.name}">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1"><i class="fa-solid fa-envelope"></i> Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           placeholder="Enter email" required="required" name="email" value="${userobj.email}">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPhone"><i class="fa-solid fa-phone"></i> Phone No.</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                           placeholder="Enter Phone Number" required="required" name="phno" value="${userobj.phno}">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1"><i class="fa-solid fa-lock"></i> Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" name="password">
                                </div>

                                <button type="submit" class="btn btn-primary">Update</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
