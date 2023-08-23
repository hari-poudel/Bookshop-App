<%@ page import="com.DAO.BookOrderImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.Book_order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/6/2023
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Admin:All Order</title>
    <%@include file="allCss.jsp"%>
    <style>
        table, th, td {
            border:1px solid black;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container ">
<h3 class="text-center">List of Order</h3>
<table class="table table-striped" style="width:100%">
    <thead class="bg-primary text-white">
    <tr>
        <th scope="col">order ID</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Phone</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Payment Type</th>
        <th scope="col">Order Time</th>
    </tr>
    </thead>
    <tbody>
    <%
        BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
       List<Book_order> blist= dao.getAllOrder();
       for(Book_order b:blist)
       {%>

    <tr>
        <th scope="row"><%=b.getOderId()%></th>
        <td><%=b.getUsername()%></td>
        <td><%=b.getEmail()%></td>
        <td><%=b.getFulladd()%></td>
        <td><%=b.getPhno()%></td>
        <td><%=b.getBookName()%></td>
        <td><%=b.getAuthor()%></td>
        <td><%=b.getPrice()%></td>
        <td><%=b.getPaymentType()%></td>
        <td><%=b.getDate()%></td>
    </tr>

    <%}
    %>


    </tbody>
</table>
</div>
</body>
</html>
