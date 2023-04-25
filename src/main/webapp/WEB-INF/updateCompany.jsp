<%@ page import="com.model.Company" %><%--
  Created by IntelliJ IDEA.
  User: mno
  Date: 4/25/23
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%Company company = (Company) request.getAttribute("company");%>
<a href="/companies"> Back </a>
<body>
<h1>Update Company</h1>
<form action="updateCompany" method="post">
    <input name="id" type="hidden" value="<%=company.getId()%>">
    Name: <input name="name" type="text" value="<%=company.getName()%>">
    Country: <input name="country" type="text" value="<%=company.getCountry()%>">
    <input type="submit" value="update">
</form>
</body>
</html>
