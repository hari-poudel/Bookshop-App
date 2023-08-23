<%@ page import="com.DAO.CartDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/14/2023
  Time: 6:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>cart page</title>
  <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>
<c:if test="${empty userobj}">
  <c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty succMsg}">
  <div class="alert alert-success text-center" role="alert">
      ${succMsg}
  </div>
  <c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg}">
  <div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
  <c:remove var="failedMsg" scope="session"/>
</c:if>



<div class="container">
  <div class="row p-2">

    <div class="col-md">

      <div class="card bg-white">
        <div class="card-body">
          <h3 class="text-center text-success">Your Selected Books</h3>
          <table class="table table-striped">
            <thead>
            <tr>

              <th scope="col">Book Name</th>
              <th scope="col">Author</th>
              <th scope="col">Price</th>
              <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <%
              User u= (User)session.getAttribute("userobj");
              CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
              List<Cart> cart= dao.getBookByUser(u.getId());
              Double totalPrice=0.00;
              for(Cart c:cart) {
                totalPrice=c.getTotalprice();
            %>
            <tr>
              <td><%=c.getBookName()%></td>
              <td><%=c.getAuthor()%></td>
              <td><%=c.getPrice()%></td>




              <td>
                <a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid() %>&&cid=<%=c.getCid()%>"
                   class="btn btn-sm btn-danger">Remove</a>
              </td>
            </tr>
            <%}
            %>
            <tr>
              <td>Total Price</td>
              <td></td>

              <td><%=totalPrice%></td>
              <td></td>
            </tr>

            </tbody>
          </table>
        </div>

      </div>
    </div>

    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h3 class="text-center text-success">Your Details for order</h3>
          <form action="order" method="post">
            <input type="hidden" value="${userobj.id}" name="id">
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">Name</label>
                <input type="text" name="username" class="form-control" id="inputEmail4"
                       value="${userobj.name}">
              </div>
              <div class="form-group col-md-6">
                <label for="inputEmail4">Email</label>
                <input type="email" name="email" class="form-control" id="inputEmail4"
                       value="${userobj.email}" required>
              </div>
            </div>

            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">Phone Number</label>
                <input type="number" name="phno" class="form-control" id="inputEmail4"
                       value="${userobj.phno}" required>
              </div>
              <div class="form-group col-md-6">
                <label for="inputPassword4">Municipality</label>
                <input type="text" name="municipality" class="form-control" id="inputPassword4" required>
              </div>
            </div>

            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">District</label>
                <input type="text"name="district" class="form-control" id="inputEmail4" required>
              </div>
              <div class="form-group col-md-6">
                <label for="inputPassword4">City</label>
                <input type="text"name="city" class="form-control" id="inputPassword4" required>
              </div>
            </div>

            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">Province</label>
                <input type="text"name="province" class="form-control" id="inputEmail4" required >
              </div>
              <div class="form-group col-md-6">
                <label for="inputPassword4">Zip code</label>
                <input type="number" name="pincode" class="form-control" id="inputPassword4" required >
              </div>
            </div>


            <div class="form-group">
              <label>Payment </label>
              <select class="form-control" name="payment">
                <option value="noselect">..Select..</option>
                <option value="COD">Cash On delivery</option>
              </select>
            </div>


            <div class="text-center">
              <button class="btn btn-warning">Order Now</button>
              <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
            </div>



          </form>
        </div>
      </div>

    </div>
  </div>

</div>
</body>
</html>
