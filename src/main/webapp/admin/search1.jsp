<%@ page import="com.DAO.UserDAoImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 7/31/2023
  Time: 7:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="allCss.jsp"%>
    <style>
        table, th, td {
            border:1px solid black;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" />
</c:if>
<div class="container p-2">

    <div class="row">

        <a href="TotalUsers.jsp" class="btn btn-success btn-sm ml-4"><i class="fa fa-users fa-1x"></i> See All Users</a>
    </div>
<table class="table table-striped" style="width:100%">
    <thead class="bg-primary text-white">
    <tr>

        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">phone number</th>


    </tr>
    </thead>
    <tbody>
    <%
        String ch1=request.getParameter("ch1");
        UserDAoImpl dao=new UserDAoImpl(DBConnect.getConn());
        List<User> list= dao.getUserBySearch(ch1);
        for(User us:list)
        {
    %>

    <tr>
        <td><%=us.getName()%></td>
        <td><%=us.getEmail()%></td>
        <td><%=us.getPhno()%></td>


    </tr>
    <%
        }
    %>

    </tbody>

    </tbody>
</table>



</div>
</body>
</html>

