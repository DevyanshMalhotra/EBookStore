<%@page import="com.model.bookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="allCss.jsp" %>
</head>
<body>

<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp"></c:redirect>
</c:if>

<h2 class="text-center p-3"> Hello Admin</h2>

<c:if test="${not empty succMsg }">
<h3 class="text-center text-success">${succMsg }</h3>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty falMsg }">
<p class="text-center text-danger">${falMsg }</p>
<c:remove var="falMsg" scope="session"/>
</c:if>

<table class="table">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Images</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    
    <% 
    BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
    List<bookDtls> blst=dao.getAllBooks();
    for(bookDtls b:blst)
    {
    %>
    <tr>
    <td><%=b.getBookid() %></td>
    <td><img src="../Books/<%=b.getPhoto()%>" style="width: 50px; height: 50px"  ></td>
    <td><%=b.getBookname() %></td>
    <td><%=b.getAuthor() %></td>
    <td><%=b.getPrice() %></td>
    <td><%=b.getBookCategory() %></td>
    <td><%=b.getStatus() %></td>
    <td> <a href="editbooks.jsp?id=<%=b.getBookid() %>" class="btn btn-sm btn-primary"><i class="fa-regular fa-pen-to-square"></i>Edit</a>
     <a href="../deletecontroller?id=<%=b.getBookid() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a></td>
    </tr>
    
    <% 
    }
    %>
  </tbody>
</table>

<div style="margin-top: 235px">
<%@ include file="footer.jsp" %>
</div>

</body>
</html>