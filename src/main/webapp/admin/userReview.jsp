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
<%@ page import="com.entity.review_user" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/6/2023
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin:All Order</title>
    <%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" />
</c:if>
<h3 class="text-center"> Users Rating</h3>
<table class="table table-striped">
    <thead class="bg-primary text-white">
    <tr>

        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Rating</th>
        <th scope="col">Comment</th>

    </tr>
    </thead>
    <tbody>
    <%
        ReviewDAOImpl dao=new ReviewDAOImpl(DBConnect.getConn());
        List<review_user> list= dao.getAllreview();
        for(review_user riv:list)
        {%>

    <tr>

        <td><%=riv.getName()%></td>
        <td><%=riv.getEmail()%></td>
        <td><%=riv.getRating()%></td>
        <td><%=riv.getComment()%></td>

    </tr>

    <%}
    %>


    </tbody>

    </tbody>
</table>
<div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>
