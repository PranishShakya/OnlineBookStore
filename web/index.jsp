<%-- 
    Document   : index
    Created on : Dec 20, 2023, 11:57:58 AM
    Author     : User
--%>

<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EBooks Index</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="allcomp/allcss.jsp" %>
    <style type="text/css">
        .back-img{
            background: url("book/l7.jpg");
            height: 50vh;
            width: 100%;
            background-repeat:no-repeat;
            background-size:cover;
        }
        .crd-ho:hover{
            background-color:#f0f3f7;
        }
        /* Responsive styles */
        @media only screen and (max-width: 768px) {
            .back-img {
                height: 30vh; /* Adjust as needed for smaller screens */
            }

            h2.text-center.text-danger {
                font-size: 1.5rem; /* Adjust font size for smaller screens */
            }

            /* Additional responsive styles as needed */
        }

    </style>
</head>
<body>



    <%
        User u = (User) session.getAttribute("userobj");
    %>
    <%@include file="allcomp/navbar.jsp" %>
    <div class="container-fluid back-img">
        <h2 class="text-center  text-danger"><i class="fa-solid fa-book-bookmark"></i>Explore your Literary Paradise. Buy, Read, Repeat.</h2>
    </div>


    <!--        Start Recent Book-->

    <div class="container">
        <h3 class="text-center">Recent Book</h3>
        <div class="row">
            <%
                BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getCon());
                List<BookDtls> list1 = dao2.getRecentBooks();
                for (BookDtls b : list1) {%>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumblin">
                        <p><%=b.getBookname()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>
                            <%
                                if (b.getBookCategory().equals("Old")) {%>
                            Categories: <%=b.getBookCategory()%></p>
                        <div class="row">


                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ml-5"><i class="fa-solid fa-eye"></i> View</a>
                            <a href="" class="btn btn-primary btn-sm ml-1">Rs.<%=b.getPrice()%></a>
                        </div> 
                        <%} else {%>
                        Categories:
                        <%= b.getBookCategory()%></p>
                        <div class="row">
                            <% if (u == null) {%>
                            <a href="Login.jsp" class="btn btn-success btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                            <% } else {%>
                            <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                            <%}%>
                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-eye"></i> View</a>
                            <a href="" class="btn btn-primary btn-sm ml-1">Rs.<%=b.getPrice()%></a>
                        </div>
                        <% }
                        %>


                    </div>
                </div>
            </div>
            <%  }
            %> 
        </div>
    </div>
    <div class="text-center mt-2">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>


    <!--        End Recent Book-->
    <hr>





    <!--        Start New Book-->

    <div class="container">
        <h3 class="text-center">New Book</h3>
        <div class="row">
            <%
                BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
                List<BookDtls> list = dao.getNewBook();
                for (BookDtls b : list) {%>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumblin">
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
    <div class="text-center mt-2">
        <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>


    <!--        End New Book-->
    <hr>


    <!--        Start Old Book-->

    <div class="container">
        <h3 class="text-center">Old Book</h3>
        <div class="row">
            <%
                BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getCon());
                List<BookDtls> list3 = dao3.getOldBooks();
                for (BookDtls b : list3) {%>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumblin">
                        <p><%=b.getBookname()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Categories: <%=b.getBookCategory()%></p>
                        <div class="row"> 
                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ml-5"><i class="fa-solid fa-eye"></i> View</a>
                            <a href="" class="btn btn-primary btn-sm ml-1">Rs.<%=b.getPrice()%></a>
                        </div>
                    </div>
                </div>
            </div>
            <%  }
            %> 
        </div>
    </div>
    <div class="text-center mt-2">
        <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>


    <!--        End old Book-->




    <%@include file="allcomp/footer.jsp" %>   

</body>

