<%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/23/2023
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Rating System</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="all_component/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="text-center text-primary p-1"><i class="fa fa-street-view fa-3x"></i>Your Feedback</h5>


                    <form action="AddReviewServlet" method="post">

                        <div class="form-group">
                        <label for="exampleInputEmail1"> Name </label> <input
                            name="user_name" type="text" class="form-control"
                            id="exampleInputEmail1" aria-describedby="emailHelp"  value="${userobj.name}" readonly>
                </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1"> Email </label> <input
                                name="user_email" type="text" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp" value="${userobj.email}" readonly >
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1"> Rating </label>
                            <input type="number"  name="rating" min="1"x max="5"x required><br>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1"> Comment </label>
                            <textarea name="comment" minlength="10" maxlength="80" required></textarea><br>
                        </div>

                        <input type="submit" value="Submit Review">
                    </form>


                </div>

            </div>
        </div>

    </div>
</div>

</body>
</html>
