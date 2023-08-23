<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<div class="container-fluid style="height:10px;background-color:></div>
<div class="container-fluid p-3 bg-light">
<div class="row">
<div class="col-md-3 tex-info">
<h3><i class ="fas fa-book"></i>BookShop</h3>
</div>
<div class="coL-md-6">
<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
      <input class="form-control mr-sm-2" type="search" name="ch" placeholder="what do u want to read ?" aria-label="Search">
      <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>
<c:if test="${not empty userobj}">


  <div class="col-md-3">
   <a href="cart.jsp"><i class="fas fa-cart-plus fa-2x"></i></a>
    <a  href="" class="btn btn-success"><i class="fas fa-user-plus"></i>${userobj.name}</a>
    <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white"><i class="fas fa-sign-in-alt"></i>Logout</a>
  </div>


</c:if>

  <c:if test="${empty userobj}">

    <div class="col-md-3 mt">
      <a  href="login.jsp" class="btn btn-success"><i class="fas fa-sign-in-alt"></i>Login</a>
      <a href="Register.jsp"class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>Register</a>
    </div>
  </c:if>

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
          <h4>Are you Sure...?</h4>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <a href="Logout" type="button" class="btn btn-primary text-white">Logout</a>
        </div>
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>
<!-- end logout modal -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class ="fas fa-home"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_recent_book.jsp"><i class ="fas fa-book-open"></i>Recent Book</a>
      </li>
     
      <li class="nav-item active">
        <a class="nav-link disabled" href="all_new_book.jsp"><i class ="fas fa-book-open"></i>New Book</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_old_book.jsp"><i class ="fas fa-book-open"></i>Old Book</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="setting.jsp" class="btn btn-light my-2 my-sm-0 " type="submit"><i class ="fas fa-cog"></i>Setting</a>
      <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class ="fas fa-phone-square-alt"></i>Contact Us</a>
    </form>
  </div>
</nav>