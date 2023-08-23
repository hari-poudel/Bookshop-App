<%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/14/2023
  Time: 7:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Setting Page</title>
  <%@include file="all_component/allCss.jsp" %>
</head>
<style type="text/css">
    a{
        text-decoration: none;
        color: black;
    }a:hover{
        text-decoration: none;
         }
</style>
<body style="background-color:#f0f1f2;">

<c:if test="${empty userobj}">
   <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>
<div class="container">
    <h3 class="text-center">Hello,${userobj.name}</h3>

    <div class="row p-5">
        <div class="col-md-4">
            <a href="sell_book.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-book-open fa-3x"></i>
                        </div>
                        <h3>Sell Old Book</h3>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-md-4">
            <a href="old_book.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-danger">
                            <i class="fas fa-book-open fa-3x"></i>
                        </div>
                        <h3> Old Book</h3>
                    </div>
                </div>
            </a>

        </div>

        <div class="col-md-4">
            <a href="Edit_profile.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-edit fa-3x"></i>
                        </div>
                        <h4>Edit Profile</h4>
                    </div>
                </div>
            </a>

        </div>




        <div class="col-md-4 mt-3">
            <a href="order.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-danger">
                            <i class="fas fa-box-open fa-3x"></i>
                        </div>
                        <h4>My Order</h4>
                        <p>track your order</p>
                    </div>
                </div>
            </a>

        </div>

        <div class="col-md-4 mt-3">
            <a href="helpline.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-user-circle fa-3x"></i>
                        </div>
                        <h4>Help Center </h4>
                        <p>24*7 Services..</p>
                    </div>
                </div>
            </a>

        </div>


        <div class="col-md-4 mt-3">
            <a href="ReviewSystem.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-danger">
                            <i class="fa fa-street-view fa-3x"></i>
                        </div>
                        <h4>Review</h4>
                        <p>Give Your Feedback</p>
                    </div>
                </div>
            </a>

        </div>





    </div>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>
