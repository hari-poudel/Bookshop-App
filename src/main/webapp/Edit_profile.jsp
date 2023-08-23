<%--
  Created by IntelliJ IDEA.
  User: HARI
  Date: 6/14/2023
  Time: 8:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile info </title>
    <%@include file="all_component/allCss.jsp" %>

    <script>

        function validatePhoneNumber() {
            // Get the phone number from the input field
            var phoneNumber = document.getElementById("phno").value;

            // Create a regular expression pattern for the desired format
            var pattern = /^(98|97)\d{8}$/;

            // Check if the phone number matches the pattern
            if (!pattern.test(phoneNumber)) {
              alert("Phone number is valid.");
                return false;
            } else {
                return true;
            }
        }

    </script>

</head>
<body style="background-color:#f0f1f2;">


<%@include file="all_component/navbar.jsp" %>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<div class="container">
    <div class="row">

        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="text-center text-primary p-1"> Edit Profile</h5>

                    <c:if  test="${(not empty failedMsg)}">
                        <h5 class="text-center text-danger"> ${failedMsg}</h5>
                        <c:remove var="failedMsg" scope="session" />

                    </c:if>

                    <c:if  test="${(not empty succMsg)}">
                        <h5 class="text-center text-success"> ${succMsg}</h5>
                        <c:remove var="succMsg" scope="session" />

                    </c:if>

                    <form action="update_profile" method="post">
                        <input type="hidden" value="${userobj.id}" name="id">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Enter Full Name</label>
                            <input type="text" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name}">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" required="required" name="email" value="${userobj.email}"  readonly>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Phone Number</label>
                            <input type="number" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" required="required" name="phno" value="${userobj.phno}"
                                   id="phno" pattern="^(98|97)\d{8}$" title="Please enter a 10-digit number starting with 98 or 97">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1"
                                   placeholder="Password" required="required" name="password">
                        </div>

                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>
