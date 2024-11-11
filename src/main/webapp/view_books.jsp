<%@page import="com.model.User"%>
<%@page import="com.model.bookDtls"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Details Page</title>
<%@include file="allcomponents/allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="allcomponents/navbar.jsp" %>

<%User u=(User)session.getAttribute("userobj"); %>

<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
bookDtls b=dao.getbookbyId(bid);

%>
<div class="container p-5">
<div class="row ">
<div class="col-md-6 text-center p-5 border " style="background-color: white;">
<img alt="" src="Books/<%=b.getPhoto() %>" style="width: 100px; height: 150px"><br>
<h4 class="mt-3">Book Name:<span class="text-success"><%=b.getBookname() %></span></h4>
<h4>Author: <span class="text-success"><%=b.getAuthor()%></span></h4>
<h4>Category : <span class="text-success"><%=b.getBookCategory()%></span> </h4>
</div>
<div class="col-md-6 text-center p-5 border bg-white">
<h2><%=b.getBookname()%></h2>

<% if("Old".equals(b.getBookCategory())) 
{
%>
<h4 class="text-primary">Contact to Seller</h4>
<h5 class="text-primary"><i class="fa-regular fa-envelope"></i>Email:<%=b.getEmail() %></h5>
<%} %>

<div class="row">
<div class="col-md-4 text-danger text-center p-2">
<i class="fa-solid fa-money-bill-wave fa-2x"></i>
<p>Cash On Delivery</p>
</div>
<div class="col-md-4 text-danger text-center p-2">
<i class="fa-solid fa-rotate-right fa-2x"></i>
<p>Return Avaliable</p>
</div>
<div class="col-md-4 text-danger text-center p-2">
<i class="fa-solid fa-truck-fast fa-2x"></i>
<p>Free Shipping</p>
</div>



</div>
<%if("Old".equals(b.getBookCategory())) 
{
%>
<div class="text-center p-3">
<a href="index.jsp" class="btn btn-success "><i class="fa-solid fa-cart-plus"></i>Continue Shopping</a>
<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
</div>
<%}
else
{
	if(u==null){
%>
<div class="text-center p-3">
<a href="login.jsp" class="btn btn-primary "><i class="fa-solid fa-cart-plus"></i>Add To Cart</a>
<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
</div>
<%} else {%>
<div class="text-center p-3">
<a href="cartcontroller?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-primary "><i class="fa-solid fa-cart-plus"></i>Add To Cart</a>
<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
</div>

<%}} %>

</div>
</div>
</div>
</body>
</html>