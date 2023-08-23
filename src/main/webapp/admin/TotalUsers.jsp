<%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/24/2023
  Time: 7:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.DAO.BookOrderImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.Book_order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.userservlet.AddReviewServlet" %>
<%@ page import="com.DAO.ReviewDAOImpl" %>
<%@ page import="com.entity.review_user" %>
<%@ page import="com.DAO.UserDAoImpl" %>
<%@ page import="com.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/6/2023
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Admin:All Users</title>
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
  <h3 class="text-left"> List of users</h3>
  <div class="coL-md-6">
    <form class="form-inline my-2 my-lg-0" action="search1.jsp" method="post">
      <input class="form-control mr-sm-2" type="search" name="ch1" placeholder="Search" aria-label="Search">
      <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
    </form>
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
    UserDAoImpl dao=new UserDAoImpl(DBConnect.getConn());
    List<User> list= dao.getAllUser();
    for(User us:list)
    {%>

  <tr>

    <td><%=us.getName()%></td>
    <td><%=us.getEmail()%></td>
    <td><%=us.getPhno()%></td>


  </tr>

  <%}
  %>


  </tbody>

  </tbody>
</table>
</div>
<div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
