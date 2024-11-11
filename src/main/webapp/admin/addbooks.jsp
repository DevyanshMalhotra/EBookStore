<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add book</title>
<%@ include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">

<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp"></c:redirect>
</c:if>


<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Add Books</h4>

<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg }</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty falMsg }">
<p class="text-center text-danger">${falMsg }</p>
<c:remove var="falMsg" scope="session"/>
</c:if>

<form action="../BookAdd" method="post" enctype="multipart/form-data">
<div class="form-group">
<label for="exampleInputEmail1">Book Name</label>
<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Author Name</label>
<input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
</div>

<div class="form-group">
<label for="exampleInputPassword1">Price</label>
<input name="price" type="number" class="form-control" id="exampleInputPassword1" required="required">
</div>

<div class="form-group">
<label for="inputState" >Book Categories</label>
<select id="inputSate" name="category" class="form-control">
<option selected">----select----</option>
<option value="New">New Book</option>
</select>
</div>


<div class="form-group">
<label for="inputState">Book Status</label>
<select id="inputSate" name="status" class="form-control">
<option selected">----select-----</option>
<option value="Active">Active</option>
<option value="Inactive">Inactive</option>
</select>
</div>

<div class="form-group">
<label for="exampleFormControlFile1">Upload Photo</label>
<input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1" required="required">
</div>

<button type="submit" class="btn btn-primary  btn-center">Add</button>

</form>
</div>
</div>
</div>
</div>
</div>

<div style="margin-top: 25px">
<%@ include file="footer.jsp" %>
</div>

</body>
</html>