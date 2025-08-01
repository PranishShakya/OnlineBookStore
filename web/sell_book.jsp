<%-- 
    Document   : sell_book.jsp
    Created on : Feb 19, 2024, 1:15:10 PM
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

        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp" />
        </c:if>


        <%@include file="allcomp/navbar.jsp" %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4" >
                    <div class="card">
                        <div class="card-body">  
                            <h5 class="text-center text-primary p-1">Sell Old Books</h5>
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>
                            <form action="add_old_book" method="post" enctype="multipart/form-data">


                                <input type="hidden" value="${userobj.email}" name="user">


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
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input name="bimg" type="file" class="form-control-file"
                                           id="exampleFormControlFile1">
                                </div>

                                <button type="submit" class="btn btn-primary">Sell</button>                         
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
