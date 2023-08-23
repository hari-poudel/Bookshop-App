<%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/1/2023
  Time: 12:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Admin:Home</title>

    <%@include file="allCss.jsp"%>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" />
</c:if>
<h4 class="text-center"> Hello Admin</h4>
<div class="container">
    <div class="row p-5">
        <div class="col-md-4">
            <a href="add_books.jsp">
            <div class="card">
                <div class="card-body text-center ">
                    <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                    <h4>Add Books</h4>
                    ....
                </div>
            </div>
            </a>
        </div>


        <div class="col-md-4">
            <a href="all_books.jsp">

                <div class="card">
                    <div class="card-body text-center">
                        <i class=" fas fa-book-open fa-3x text-danger "></i><br>

                        <h4>All Books</h4>
                        .....
                    </div>
                </div>
            </a>
        </div>


        <div class="col-md-4">
            <a href="all_order.jsp">

                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-box-open fa-3x text-warning"></i><br>
                        <h4>order</h4>
                        ....
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md mt-2">
            <a href="TotalUsers.jsp">

                <div class="card">
                    <div class="card-body text-center">
                        <i class="fa fa-users fa-3x"></i><br>
                        <h4>Users</h4>
                        ....
                    </div>
                </div>
            </a>
        </div>


        <div class="col-md mt-2">
            <a href="userReview.jsp">

                <div class="card">
                    <div class="card-body text-center">
                        <i class="fa fa-street-view fa-3x"></i><br>
                        <h4>User Review</h4>
                        ....
                    </div>
                </div>
            </a>
        </div>


        <div class="col-md mt-2">
           <a data-toggle="modal" data-target="#exampleModalCenter">
               <div class="card">
                   <div class="card-body text-center">
                       <i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
                       <h4>logout</h4>
                       ....
                   </div>
               </div>
           </a>
        </div>
    </div>

</div>





<!--  modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4>Are you Sure...</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="../Logout" type="button" class="btn btn-primary text-white">Logout</a>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<!-- end logout modal -->

<div style="margin-top: 130px;">
    <%@include file="footer.jsp" %>
</div>
</body>
</html>
