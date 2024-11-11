<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.bookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
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
</style>
</head>
<body>
<%@include file="allcomponents/navbar.jsp" %>
<%User u=(User)session.getAttribute("userobj"); %>
<div class="container-fluid">
<h3 class="text-center text-danger mt-3">Recent Books</h3>
    <div class="row ">
        <%
            BookDAOImpl dao1=new BookDAOImpl(DBConnect.getConn());
            List<bookDtls> list1=dao1.getAllRecentBook();
            for(bookDtls b:list1)
            {
        %>	
            <div class="col-md-3 ">
                <div class="card cr-h ">
                    <div class="card-body text-center">
                        <img alt="" src="Books/<%=b.getPhoto() %> " style="width: 150px; height: 200px ; " class="img-thumblin">
                        <p><%=b.getBookname() %></p>
                        <p><%=b.getAuthor() %></p>
                        <p> 
                            <%
                                if(b.getBookCategory().equals("Old"))
                                {
                            %>	
                                    Category type : <%=b.getBookCategory() %>
                                    </p>
                                    <div class="row">
                                        <a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-5">View Details</a>
                                        <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
                                    </div>
                            <% } else { %>
                                    Category type : <%=b.getBookCategory() %>
                                    </p>
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
                            <% } %>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>
</body>
</html>
