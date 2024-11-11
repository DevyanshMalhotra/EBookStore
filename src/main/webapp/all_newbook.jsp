<%@page import="com.model.User"%>
<%@page import="com.model.bookDtls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.util.List"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
<%@include file="allcomponents/allCss.jsp" %>
<style type="text/css">


.cr-h:hover
{
background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

</style>
</head>
<body>
<%User u=(User)session.getAttribute("userobj"); 

%>

<c:if test="${not empty addCart }">
<div id="toast">${addCart }</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>
</c:if>


<%@include file="allcomponents/navbar.jsp" %>
<div class="container-fluid">
<h3 class="text-center text-danger mt-3">New Books</h3>
<div class="row">
<%
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
List<bookDtls> list=dao.getAllNewBook();
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
</div>
</body>
</html>