<%--
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
          <h5 class="text-center text-primary p-1">Sell Old Books</h5>

          <c:if test="${(not empty succMsg)}">
            <p class="text-center text-success"> ${succMsg}</p>
            <c:remove var="succMsg" scope="session" />
          </c:if>

          <c:if  test="${(not empty failedMsg)}">
            <h5 class="text-center text-danger"> ${failedMsg}</h5>
            <c:remove var="failedMsg" scope="session" />

          </c:if>

          <form action="add_old_book" method="post"
                enctype="multipart/form-data">
            <input type="hidden" value="${userobj.email}" name="user">

            <div class="form-group">
              <label for="exampleInputEmail1">Book Name </label> <input
                    name="bname" type="text" class="form-control"
                    id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>

            <div class="form-group">
              <label for="exampleInputEmail1">Author Name </label> <input
                    name="author" type="text" class="form-control"
                    id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>

            <div class="form-group">
              <%--@declare id="exampleinput password1"--%><label for="exampleInput Password1">Price</label> <input
                    name="price" type="number" min="100"x max="1500"x class="form-control"
                    id="exampleInputPassword1">
            </div>


            <div class="form-group">
              <%--@declare id="example formcontrolfile1"--%><label for="example FormControlFile1">Upload Photo</label> <input
                    name="bimg" type="file" class="form-control-file"
                    id="exampleFormControlFile1">
            </div>


            <div class="form-group">
              <label for="exampleInputEmail1">Book Description</label>
              <textarea name="about" minlength="10" maxlength="80"
                    id="exampleInputEmail1" aria-describedby="emailHelp"></textarea>
            </div>

            <div class="form-group">
              <label for="exampleInputEmail1">ISBN</label> <input
                    name="ISBN" type="number" class="form-control"
                    id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>

            <button type="submit" class="btn btn-primary">Sell </button>
          </form>

        </div>

      </div>
    </div>

  </div>
</div>
</body>
</html>
