<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/6/2023
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>Admin:Add Books</title>
  <%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj}">
  <c:redirect url="../login.jsp" />
</c:if>
<div class="container">
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <div class="card">
        <div class="card-body">
          <h4 class="text-center">Edit Books</h4>



          <%
            Integer id=Integer.parseInt(request.getParameter("id"));
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            BookDtls b =dao.getBookbyId(id);

            %>
          <form action="../editbooks" method="post">
            <input type="hidden" name="id" value="<%=b.getBookId()%>">

            <div class="form-group">
              <label for="exampleInputEmail1">Book Name </label> <input
                    name="bname" type="text" class="form-control"
                    id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getBookName()%>">
            </div>

            <div class="form-group">
              <label for="exampleInputEmail1">Author Name </label> <input
                    name="author" type="text" class="form-control"
                    id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getAuthor()%>">
            </div>

            <div class="form-group">
              <%--@declare id="exampleinput password1"--%><label for="exampleInput Password1">Price</label> <input
                    name="price" type="number" class="form-control"
                    id="exampleInputPassword1" value="<%=b.getPrice()%>">
            </div>



            <div class="form-group">
              <label for="inputState">Book Status</label> <select
                    id="inputState" name="status" class="form-control">
              <%
                if("Active".equals(b.getStatus())){
              %>
              <option value="Active">Active</option>
              <option value="Inactive">Inactive</option>
              <%
              }else{
              %>
              <option value="Inactive">Inactive</option>
              <option value="Active">Active</option>
              <%
                }
              %>
            </select>
            </div>

            <button type="submit" class="btn btn-primary">update</button>
          </form>
        </div>
      </div>
    </div>

  </div>

</div>
<div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
