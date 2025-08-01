<%-- 
    Document   : all_new_book
    Created on : Jan 21, 2024, 3:16:33 PM
    Author     : User
--%>

<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
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

            #toast{
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -125px;
                background: #333;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 100px #000;
            }

            #toast.display{
                visibility: visible;
                animation: fadeIn 0.5, fadeOut 0.55s 2.5s;
            }

            @keyframes fadeIn{from{ bottom:0;
                                    opacity:0;
                              }
                              to{
                                  bottom: 30px;
                                  opacity:1;
                              }               
            }

            @keyframes fadeOut{from { bottom:30px;
                                      opacity:1;
                               }
                               to{
                                   bottom:0;
                                   opacity: 0;
                               }
            }



        </style>
    </head>
    <body>
        <%
            User u = (User) session.getAttribute("userobj");
        %>
        <c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>
            <script type="text/javascript">
                showToast();
                function showToast(content) {
                    $('#toast').addClass("display");
                    $('#toast').html(content);
                    setTimeout(() => {
                        $("#toast").removeClass("display");
                    }, 2000)
                }
            </script>

            <c:remove var="addCart" scope="session" />

        </c:if>



        <%@include file="allcomp/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row p-3">

                <%
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
                    List<BookDtls> list = dao.getAllNewBook();
                    for (BookDtls b : list) {%>
                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center ml-3">
                            <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumblin">
                            <p><%= b.getBookname()%></p>
                            <p><%= b.getAuthor()%></p>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <div class="row">
                                <% if (u == null) {%>
                                <a href="Login.jsp" class="btn btn-success btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                                <% } else {%>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                                <%}%>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-eye"></i> View</a>
                                <a href="" class="btn btn-primary btn-sm ml-1">Rs.<%=b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                %>


            </div>

        </div>
    </body>
</html>
