<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>BookShop:index</title>
    <%@include file="all_component/allCss.jsp" %>
    <style type="text/css">
        .back-img {
            background-image: url("img/b.jpg");
            height: 40vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;

        }

        .crd-ho:hover {
            background-color: #fcf7f7;
        }

    </style>
</head>
<body style="background-color:#f7f7f7;">
<%
    User u = (User) session.getAttribute("userobj");
%>
<%@include file="all_component/navbar.jsp" %>
<h6 class="text-center" style="color: black;">Your Next Great Read Among Our Best Sellers..!</h6>
<div class="container-fluid back-img">

</div>




<c:if  test="${(not empty failedMsg)}">
    <h5 class="text-center text-danger"> ${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session" />

</c:if>

<c:if  test="${(not empty succMsg)}">
    <h5 class="text-center text-success"> ${succMsg}</h5>
    <c:remove var="succMsg" scope="session" />

</c:if>

<!-- start Recent Book -->

<div class="container">
    <h3 class="text-center">Recent Book</h3>
    <div class="row">
        <%
        BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
       List<BookDtls> list2= dao2.getRecentBooks();
       for(BookDtls b:list2)
       {
           %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">



                    <img alt="" src="book/<%=b.getPhotoName()%>"
                         style="width: 150px; height:200px"  class="img-thumblin">
                    <p><%=b.getBookName()%></p>


                    </p>

                    <p>
                        <%
                            if(b.getBookCategory().equals("Old"))
                            {%>
                    <p>Categories:<%=b.getBookCategory()%></p>
                     <div class="row">

                    <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-4"><i class="fas fa-cart-plus"></i>BUY NOW</a>
                    <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">Details</a>
                </div>
                            <%}else{

                                %>
                    categories:<%=b.getBookCategory()%> </p>
                    <div class="row ">
                        <% if(u==null)
                        {%>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <%}else{%>
                        <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-4"><i class="fas fa-cart-plus"></i> BUY NOW</a>
                        <%}
                        %>


                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">Details</a>

                    </div>

                    <%
                            }
                            %>


                </div>
            </div>
        </div>
        <%

       }
        %>

    </div>
    <div class="text-center mt-2">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">EXPLORE BOOKS </a>
    </div>
</div>

<!-- End Recent Book -->

<hr>

<!-- start New Book -->

<div class="container">
    <h3 class="text-center">New Book</h3>
    <div class="row">

            <%
                BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
                List<BookDtls>list=dao.getNewBook();
                for(BookDtls b:list) {
                    %>
        <div class="col-md-3 ">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>"
                    style="width: 150px; height:200px"  class="img-thumblin">
                    <p><%=b.getBookName()%></p>
                    <div class="row md-3 mt">
                        <% if(u==null)
                        {%>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>BUY NOW</a>
                        <%}else{%>
                        <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-4"><i class="fas fa-cart-plus"></i> BUY NOW</a>
                        <%}
                        %>
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">Details</a>

                    </div>
                </div>
            </div>
        </div>

                <%
                }
            %>
    </div>
    <div class="text-center mt-2">
        <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">EXPLORE BOOKS </a>
    </div>
</div>

<!-- End New Book -->


<hr>

<!-- start old Book -->

<div class="container">
    <h3 class="text-center">Old Book</h3>
    <div class="row">

        <%
            BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list3= dao3.getOldBooks();
            for(BookDtls b:list3)
            {
        %>
        <div class="col-md-3 mt">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>"
                         style="width: 150px; height:200px"  class="img-thumblin">
                    <p><%=b.getBookName()%></p>
                    <div class="row">
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-4"><i class="fas fa-cart-plus"></i>BUY NOW</a>
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">Details</a>
                    </div>

                </div>
            </div>
        </div>
        <%

            }
        %>


    </div>
    <div class="text-center mt-2">
        <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">EXPLORE BOOKS </a>
    </div>

</div>

<!-- making review-->
< <div >
    <a href="ReviewSystem.jsp">
        <div class="card">
            <div class="card-body text-center">
                <div class="text-primary">
                    <i class="fa fa-street-view fa-2x"></i></i>
                </div>
                <h6>Give your Feedback to our system </h6>
            </div>
        </div>
    </a>

</div>
<!-- End old Book -->
<%@include file="all_component/footer.jsp" %>

</body>
</html>