<%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/14/2023
  Time: 8:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Address INfo.. </title>
  <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>
<div class="container">
  <div class="row p-3">
    <div class="col-md-6 offset-md-3">
      <div class="card">
        <div class="card-body">
          <h3 class="text-center text-success"> Add Address</h3>
          <form action="">
            <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputPassword4">Address</label>
              <input type="text" class="form-control" id="inputPassword4" >
            </div>


            <div class="form-group col-md-6">
              <label for="inputPassword4">LandMark</label>
              <input type="text" class="form-control" id="inputPassword4" >
            </div>
       </div>

            <div class="form-row">
            <div class="form-group col-md-4">
              <label for="inputPassword4">City</label>
              <input type="text" class="form-control" id="inputPassword4" >
            </div>


            <div class="form-group col-md-4">
              <label for="inputPassword4">state</label>
              <input type="text" class="form-control" id="inputPassword4" >
            </div>

              <div class="form-group col-md-4">
                <label for="inputPassword4">Zip </label>
                <input type="text" class="form-control" id="inputPassword4" >
              </div>

            </div>
            <div class="text-center">
              <button class="btn btn-warning "> Add Address</button>
            </div>
          </form>
        </div>

      </div>

    </div>
  </div>
</div>

</body>
</html>
