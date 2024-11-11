<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Login</title>
<%@include file="allcomponents/allCss.jsp" %>
</head>
<body style="background-color: #f7f7f7;">

<%@include file="allcomponents/navbar.jsp" %>
<div class="container p-3 mb-8">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center pb-2">Login Page</h4>

<c:if test="${not empty falMsg }">
<p class="text-center  text-danger">${falMsg}</p>
<c:remove var="falMsg" scope="session"/>
</c:if>

<c:if test="${not empty succMsg }">
<p class="text-center  text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>







<form action="logincontroller" method="post">


  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password" required="required" name="password">
  </div>
  
  
  <div class="text-center">
  <button type="submit" class="btn btn-primary btn-center">Submit</button><br>
  <a href="register.jsp">Register</a>
  </div>
  
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top: 185px">
<%@include file="allcomponents/footer.jsp" %>
</div>

</body>
</html>