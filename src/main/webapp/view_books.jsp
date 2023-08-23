<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.Book_order" %>
<%@ page import="static org.apache.coyote.http11.Constants.a" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.DAO.BookOrderImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/9/2023
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Books Details</title>
    <%@include file="all_component/allCss.jsp" %>
    <style type="text/css">
        .back-img {
            background-image: url("img/b.jpg");
            height: 40vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;

        }
        .qr-img{background-image: url("img/img_1.png");
            height: 50vh;
            width: 110%;
            background-repeat: no-repeat;
            background-size: cover;

        }

        .crd-ho:hover {
            background-color: #fcf7f7;
        }

    </style>

    <script>
        function increaseQuantity() {
            var quantityInput = document.getElementById("quantity");
            quantityInput.value = parseInt(quantityInput.value) + 1;
        }

        function decreaseQuantity() {
            var quantityInput = document.getElementById("quantity");
            var quantity = parseInt(quantityInput.value);
            if (quantity > 0) {
                quantityInput.value = quantity - 1;
            }
        }
    </script>

</head>
<body style="background-color: #f0f1f2;">


<%@include file="all_component/navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>
   <%
       User u = (User) session.getAttribute("userobj");

       int bid=Integer.parseInt(request.getParameter("bid"));
       BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
       BookDtls b=dao.getBookbyId(bid);
    %>
<%
    BookOrderImpl dao1=new BookOrderImpl(DBConnect.getConn());
    List<Book_order> blist= dao1.getAllOrder();
%>




<div class="=container p-3">
    <div class="row ">
        <div class="col-md-6 text-center p-5 border bg-white">
            <img alt="" src="book/<%=b.getPhotoName()%>"
                 style="width: 150px; height:200px"  class="img-thumblin">
            <h6><%=b.getBookName()%></h6>
            <div class="col-md">
                <div class="card">
                    <div class="card-body">
                        <h6>...Book Info...</h6>
                        <h5 class="mt-3">Book Name: <span class="text-danger"><%=b.getBookName()%></span></h5>
                        <h5 class="mt-3">Author: <span class="text-danger"><%=b.getAuthor()%> </span></h5>
                        <h5 class="mt-3">Categories: <span class="text-danger"><%=b.getBookCategory()%> </span></h5>
                        <h5 class="mt-3"> ISBN:<span class="text-warning ui-front back-img"><%=b.getISBN()%> </span></h5>
                        <h5 class="mt-3">Book Description: <span class="text-danger"><%=b.getAbout()%> </span></h5>


                    </div>
                </div>
            </div>



        </div>
        <div class="col-md-6 text-center p-5 border bg-white">
            <h2><%=b.getBookName()%></h2>
            <%
            if("Old".equals(b.getBookCategory()))
                {%>
            <h5 class="text-primary">Contact to seller..!</h5>
                    <h5 class="text-primary">
                        <i class="far fa-envelope"></i>Email:<%=b.getEmail()%></h5>
                <%}
            %>

            <div class="row">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-money-bill-wave fa-2x"></i>
                    <p>Cash on Delivery Available</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-undo-alt fa-2x"></i>
                    <p><i class="fas fa-exclamation"></i>No Return</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-truck-moving fa-2x"></i>
                    <h6>Free Shipping</h6>
                    <p>Enjoy free shipping</p>
                </div>

                </div>

            <%
                if("Old".equals(b.getBookCategory())){
                    %>
            <div class="text-center p-3">
                <a href="index.jsp" class="btn btn-success"> <i class="fas fa-cart-plus"></i>Continue Shopping </a>
                <a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
            </div>

                <%}else{
                    %>



            <% if(u==null)
                        {%>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <%}else{%>
                        <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                 <a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i><%=b.getPrice()%></a> <br><br>
        </form>

            <div class="col-md">
                <div class="card">
                    <div class="card-body">
                        <h6> <i class="fas fa-info"></i> Services</h6>
                        <p> <i class="fas fa-check"></i>100% Authentic</p>
                        <p><i class="fas fa-exclamation"></i>Warranty not available</p>

                    </div>
                </div>
            </div>
                        <%}
                        %>

                <%}
            %>




        </div>
    </div>
</div>
</body>
</html>
