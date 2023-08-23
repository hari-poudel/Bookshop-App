<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
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
    <title>Admin:All Books</title>
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
<h3 class="text-center"> Book Management Section </h3>
<c:if test="${(not empty succMsg)}">
    <h5 class="text-center text-success"> ${succMsg}</h5>
    <c:remove var="succMsg" scope="session" />
</c:if>
<c:if  test="${(not empty failedMsg)}">
    <h5 class="text-center text-danger"> ${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session" />

</c:if>
<div class="container p-2">
    <div class="row">

        <a href="all_books.jsp" class="btn btn-success btn-sm ml-4"><i class ="fas fa-book-open"></i>See All Books</a>
    </div>
    <table class="table table-striped">
        <thead class="bg-primary text-white">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Image</th>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Reaming QTY</th>
            <th scope="col">Category</th>
            <th scope="col">Status</th>
            <th scope="col">ISBN</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            String ch2=request.getParameter("ch2");
            BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list2= dao2.getBookBySearch(ch2);
            for(BookDtls b:list2)
            {
        %>
        <tr>
            <td><%=b.getBookId()%></td>
            <td><img src="../book/<%=b.getPhotoName()%>" style="width: 50px; height: 50px;"></td>
            <td><%=b.getBookName()%>  </td>
            <td><%=b.getAuthor()%> </td>
            <td><%=b.getPrice()%> </td>
            <td>
                <%=b.getQuantity()%>

            </td>
            <td><%=b.getBookCategory()%> </td>
            <td><%=b.getStatus()%> </td>
            <td><%=b.getISBN()%></td>
            <td>


                <a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn brn-sm btn-primary"><i class="fas fa-edit"></i>  Edit</a><br><br>
                <a href="../delete?id=<%=b.getBookId() %>" class="btn brn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
            </td>
        </tr>

        <%
            }
        %>

        </tbody>
    </table>
</div>
<div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>
