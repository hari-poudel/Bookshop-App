<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %><%--
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
<%
    User u = (User) session.getAttribute("userobj");
%>
<%@include file="all_component/navbar.jsp" %>
<h3 class="text-center"> </h3>
<div class="container-fluid">
    <div class="row p-3">
        <%
            String ch=request.getParameter("ch");
            BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list2= dao2.getBookBySearch(ch);
            for(BookDtls b:list2)
            {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mt-2">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>"
                         style="width: 100px; height:150px"  class="img-thumblin">
                    <p><%=b.getBookName()%></p>
                    <p>Authors:<%=b.getAuthor()%></p>
                    <p>
                        <%
                            if(b.getBookCategory().equals("Old"))
                            {%>
                        categories:<%=b.getBookCategory()%> </p>
                    <div class="row ">
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">RS.<%=b.getPrice()%></a>
                    </div>
                    <%}else{
                    %>
                    categories:<%=b.getBookCategory()%> </p>
                    <div class="row ">
                        <% if(u==null)
                        {%>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <%}else{%>
                        <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <%}
                        %>
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">RS.<%=b.getPrice()%> </a>
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

</div>
</body>
</html>
