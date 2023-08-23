<%@ page import="com.entity.User" %>
<%@ page import="com.DAO.BookOrderImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Book_order" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/14/2023
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>Order info </title>
  <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>

<c:if  test="${(not empty failedMsg)}">
  <h5 class="text-center text-danger"> ${failedMsg}</h5>
  <c:remove var="failedMsg" scope="session" />

</c:if>

<c:if  test="${(not empty succMsg)}">
  <h5 class="text-center text-success"> ${succMsg}</h5>
  <c:remove var="succMsg" scope="session" />

</c:if>

<div class="container p-2">
  <h3 class="text-center text-primary"> Your Order</h3>
  <table class="table table-striped mt-3">
    <thead class="bg-primary text-white">
    <tr>
      <th scope="col">order ID</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
      <th scope="col">Order Time</th>
      <th scope="col"> Action </th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${empty userobj}">
      <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <%
      User u= (User)session.getAttribute("userobj");
      String email=u.getEmail();
      BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
      List<Book_order> list= dao.getAllOrder();
      for(Book_order b:list)
      {%>

    <tr>
      <th scope="row"><%=b.getOderId()%></th>

      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
      <td><%=b.getDate()%></td>
      <td>
        <a href="cancel_order?em=<%=email%>&&id=<%=b.getOderId()%>"
           class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Cancel</a>
      </td>

    </tr>

    <%}
    %>


    </tbody>

    </tbody>
  </table>
</div>
</body>
</html>
