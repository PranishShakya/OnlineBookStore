<%-- 
    Document   : add_books
    Created on : Jan 15, 2024, 11:18:15 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
        <%@include file="allcss.jsp" %>
    </head>
    <body style="background-image: url(bggg.jpg);">
        <%@include file="navbar.jsp" %>

        <c:if test="${empty userobj}">
            <c:redirect url="../Login.jsp" />
        </c:if>
        <div class="conatiner p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>

                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>    


                            <form action="../add_books" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputEmail">Book Name*</label>
                                    <input name="bname" type="text" class="form-control"
                                           id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail">Author Name*</label>
                                    <input name="author" type="text" class="form-control"
                                           id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input name="price" type="number" class="form-control"
                                           id="exampleInputPassword1">
                                </div>

                                <div class="form-group">
                                    <label for="inputState">Book Categories*</label>
                                    <select id="inputState" name="categories" class="form-control">
                                        <option selected>--Select--</option> 
                                        <option value="New">New Book</option> 
                                    </select>       
                                </div>

                                <div class="form-group">
                                    <label for="inputState">Book Status*</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <option selected>--Select--</option> 
                                        <option value="Active">Active</option> 
                                        <option value="Inactive">Inactive</option> 
                                    </select>       
                                </div>


                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input name="bimg" type="file" class="form-control-file"
                                           id="exampleFormControlFile1">
                                </div>

                                <button type="submit" class="btn btn-primary">Add</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
