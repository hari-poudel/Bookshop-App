<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/14/2023
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>sell Book</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>
<%@include file="all_component/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="text-center text-primary p-1">Edit Old Books</h5>

                    <%
                        Integer id=Integer.parseInt(request.getParameter("id"));
                        BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
                        BookDtls c =dao.getBookbyId(id);

                    %>


                    <form action="editoldbooks" method="post">
                    <input type="hidden" name="id" value="<%=c.getBookId()%>">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Book Name </label> <input
                                name="bname" type="text" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=c.getBookName()%>">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Author Name </label> <input
                                name="author" type="text" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=c.getAuthor()%>">
                        </div>

                        <div class="form-group">
                            <%--@declare id="exampleinput password1"--%><label for="exampleInput Password1">Price</label> <input
                                name="price" type="number" class="form-control"
                                id="exampleInputPassword1" value="<%=c.getPrice()%>">
                        </div>



                        <button type="submit" class="btn btn-primary">Update </button>
                    </form>

                </div>

            </div>
        </div>

    </div>
</div>
</body>
</html>
