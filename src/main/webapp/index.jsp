<%@page import="com.model.User"%>
<%@page import="com.model.bookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Index</title>
<%@include file="allcomponents/allCss.jsp" %>
<style type="text/css">
.back-img
{
background: url("img/b.avif");
height: 70vh;
width: 100%;
background-size: cover;
background-repeat: no-repeat;
}

.cr-h:hover
{
background-color: #fcf7f7;
}
</style>
</head>

<body style="background-color: #f7f7f7">
<%@include file="allcomponents/navbar.jsp" %>
<%User u=(User)session.getAttribute("userobj"); %>

<div class="container-fluid back-img">
<h2 class="text-center text-light pt-4">Ebook Management System</h2>
</div>




<!-- -Start Recent Books -->
<div class="container">
<h3 class="text-center text-danger mt-2">Recent Books</h3>
<div class="row">

<%
BookDAOImpl dao1=new BookDAOImpl(DBConnect.getConn());
List<bookDtls> list1=dao1.getRecentBook();
for(bookDtls b:list1)
{
%>	
<div class="col-md-3">
<div class="card cr-h">
<div class="card-body text-center">
<img alt="" src="Books/<%=b.getPhoto() %> " style="width: 150px; height: 200px ; " class="img-thumblin">
<p><%=b.getBookname() %></p>
<p><%=b.getAuthor() %></p>
<p> 
<%
if(b.getBookCategory().equals("Old"))
{
%>	
Category type : <%=b.getBookCategory() %></p>
<div class="row">

<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-5">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
</div>
<%}else{ %>
Category type : <%=b.getBookCategory() %></p>
<div class="row">
<%if(u==null) 
{
%>
<a href="login.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>

<%}else 
	{
%>
<a href="cartcontroller?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
<%} %>

<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
</div>
	
<%} %>


</div>
</div>
</div>
<% 
}
%>

</div>

<div class="text-center mt-3">
<a href="all_recentbook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>

</div>

<hr>

<!-- End of recent books -->


<!-- -Start Old Books -->
<div class="container mt-3">
<h3 class="text-center text-danger mt-2">Old Books</h3>
<div class="row">
<%
BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
List<bookDtls> list2=dao2.getoldBook();
for(bookDtls b:list2)
{
%>	

<div class="col-md-3">
<div class="card cr-h">
<div class="card-body text-center">
<img alt="" src="Books/<%=b.getPhoto() %> " style="width: 150px; height: 200px ; " class="img-thumblin">
<p><%=b.getBookname() %></p>
<p><%=b.getAuthor() %></p>
<p> Category type : <%=b.getBookCategory() %></p>
<div class="row">
<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-5">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
</div>
</div>
</div>
</div>
<% 
}
%>

</div>

<div class="text-center mt-3">
<a href="all_oldbook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>

</div>

<!-- End of old books -->


<!-- -Start New Books -->
<div class="container mt-3">
<h3 class="text-center text-danger mt-2">New Books</h3>
<div class="row">

<%
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
List<bookDtls> list=dao.getNewBook();
for(bookDtls b:list)
{
%>	
<div class="col-md-3">
<div class="card cr-h">
<div class="card-body text-center">
<img alt="" src="Books/<%=b.getPhoto() %> " style="width: 150px; height: 200px ; " class="img-thumblin">
<p><%=b.getBookname() %></p>
<p><%=b.getAuthor() %></p>
<p> Category type : <%=b.getBookCategory() %></p>
<div class="row">

<%if(u==null) 
{
%>
<a href="login.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>

<%}else 
	{
%>
<a href="cartcontroller?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
<%} %>


<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
</div>
</div>
</div>
</div>
<% 
}
%>

</div>

<div class="text-center mt-3">
<a href="all_newbook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>

</div>

<!-- End of new books -->

<!-- End of new books -->

<%@include file="allcomponents/footer.jsp" %>


</body>
</html>