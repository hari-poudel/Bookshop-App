<%--
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
                    <h4 class="text-center">Add Books</h4>

                    <c:if test="${(not empty succMsg)}">
                        <p class="text-center text-success"> ${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <c:if  test="${(not empty failedMsg)}">
                        <h5 class="text-center text-danger"> ${failedMsg}</h5>
                        <c:remove var="failedMsg" scope="session" />

                    </c:if>

                    <form action="../add_books" method="post"
                          enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Book Name *</label> <input
                                name="bname" type="text" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Author Name *</label> <input
                                name="author" type="text" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>

                        <div class="form-group">
                            <%--@declare id="exampleinput password1"--%><label for="exampleInput Password1">Price*</label>
                                <input name="price" type="number" class="form-control"
                                id="exampleInputPassword1" min="200"x max="1500"x>
                        </div>

                        <div class="form-group">
                            <label for="inputState">Book Categories </label> <select
                                id="inputState" name="categories" class="form-control">
                            <option selected > --select--</option>
                            <option value="New">New Book</option>
                        </select>
                        </div>
                        <div class="form-group">
                            <label for="inputState">Book Status</label> <select
                                id="inputState" name="status" class="form-control">
                            <option selected > --select--</option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                        </div>



                        <div class="form-group">
                            <%--@declare id="example formcontrolfile1"--%><label for="example FormControlFile1">Upload Photo</label> <input
                                name="bimg" type="file" class="form-control-file"
                                id="exampleFormControlFile1">
                        </div>




                        <div class="form-group">
                            <label for="exampleInputEmail1">Book Description</label> <input
                                name="about" type="text" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">ISBN</label> <input
                                name="ISBN" type="number" class="form-control"
                                id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>

                        <button type="submit" class="btn btn-primary">Add</button>
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
