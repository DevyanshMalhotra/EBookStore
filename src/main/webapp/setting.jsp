<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting Page</title>
<%@include file="allcomponents/allCss.jsp" %>
<style type="text/css">
a
{
text-decoration: none;
color: black;
}

a:hover
{
text-decoration: none;
}
</style>
</head>
<body style="background-color: #f0f2f2;">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="allcomponents/navbar.jsp" %>

<div class="container p-3">
<h3 class="text-center">Hello,${userobj.name}</h3>
<div class="row p-5">
<div class="col-md-4">
<a href="sellOldBook.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class="fa-solid fa-book-open fa-2x"></i>
</div>
<h3>Sell Books</h3>
</div>
</div>
</a>
</div>

<div class="col-md-4">
<a href="oldbook.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class="fa-solid fa-book-open fa-2x"></i>
</div>
<h3>Old Books</h3>
</div>
</div>
</a>
</div>


<div class="col-md-4">
<a href="editProfile.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class="fa-regular fa-pen-to-square fa-2x"></i>
</div>
<h4>Edit Profile</h4>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-3">
<a href="order.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-danger">
<i class="fa-solid fa-box-open fa-2x"></i>
</div>
<h4>Order</h4>
<p>Track your order</p>
</div>
</div>
</a>
</div>



<div class="col-md-6 mt-3">
<a href="helpline.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class="fa-solid fa-user-circle fa-2x"></i>
</div>
<h4>Help Center</h4>
<p>24*7 service</p>
</div>
</div>
</a>
</div>

</div>
</div>


<div style="margin-top: 80px;">
<%@include file="allcomponents/footer.jsp" %>
</div>
</body>
</html>