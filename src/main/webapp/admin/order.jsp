<%@page import="com.model.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderDAOImpl"%>
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

<table class="table">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
      
    </tr>
  </thead>
  <tbody>
  
  <% 
  BookOrderDAOImpl dao=new BookOrderDAOImpl(DBConnect.getConn());
  List<Book_Order> list=dao.getAllOrder();
  for(Book_Order b: list)
  {
  %>
    <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFullAdd() %></td>
      <td><%=b.getPhno() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
      
    </tr>
    <%} %>
    
  </tbody>
</table>

<div style="margin-top: 255px">
<%@ include file="footer.jsp" %>
</div>

</body>
</html>