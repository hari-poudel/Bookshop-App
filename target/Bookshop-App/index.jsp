<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>BookShop:index</title>
    <%@include file="all_component/allCss.jsp" %>
    <style type="text/css">
        .back-img {
            background-image: url("img/b.jpg");
            height: 40vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;

        }

        .crd-ho:hover {
            background-color: #fcf7f7;
        }

    </style>
</head>
<body style="background-color:#f7f7f7;">
<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid back-img">
    <h2 style="color: black" class="text-center text-dark " > O nline BookShop System</h2>
</div>
<% Connection conn=DBConnect.getConn();
out.println(conn);
%>

<!-- start Recent Book -->

<div class="container">
    <h3 class="text-center">Recent Book</h3>
    <div class="row">
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i> Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <div class="text-center mt-2">
        <a href="" class="btn btn-danger btn-sm text-white">View All </a>
    </div>
</div>

<!-- End Recent Book -->

<hr>

<!-- start New Book -->

<div class="container">
    <h3 class="text-center">New Book</h3>
    <div class="row">
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <div class="text-center mt-2">
        <a href="" class="btn btn-danger btn-sm text-white">View All </a>
    </div>
</div>

<!-- End New Book -->


<hr>

<!-- start old Book -->

<div class="container">
    <h3 class="text-center">Old Book</h3>
    <div class="row">
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">
                        <a href="" class="btn btn-success btn-sm ml-5">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">

                        <a href="" class="btn btn-success btn-sm ml-5">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">

                        <a href="" class="btn btn-success btn-sm ml-5">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/ja.jpg" style="width: 150px; height:200px"
                         class="img-thumblin">
                    <p>java Programming</p>
                    <p>Author:Bert Bates</p>
                    <p>categories:New </p>
                    <div class="row ">

                        <a href="" class="btn btn-success btn-sm ml-5">View Details</a>
                        <a href="" class="btn btn-secondary btn-sm ml-1">$29</a>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <div class="text-center mt-2">
        <a href="" class="btn btn-danger btn-sm text-white">View All </a>
    </div>
</div>

<!-- End old Book -->
<%@include file="all_component/footer.jsp" %>

</body>
</html>