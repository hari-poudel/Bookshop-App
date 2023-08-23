<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/9/2023
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Recent Book</title>
    <%@include file="all_component/allCss.jsp" %>
    <style type="text/css">
        .crd-ho:hover {
            background-color: #fcf7f7;
        }

    </style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<h3 class="text-center"> ..Old Books..</h3>
<div class="container-fluid">
    <div class="row p-3">
        <%
            BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list3= dao3.getAllOldBook();
            for(BookDtls b:list3)
            {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mt-2">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>"
                         style="width: 100px; height:150px"  class="img-thumblin">
                    <h6><%=b.getBookName()%></h6>

                    <div class="row">
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5"><i class="fas fa-cart-plus"></i>BUY NOW</a>
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">Details</a>
                    </div>

                </div>
            </div>
        </div>
        <%

            }
        %>



    </div>

</div>
</body>
</html>
