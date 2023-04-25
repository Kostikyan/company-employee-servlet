<%@ page import="com.model.Employee" %>
<%@ page import="com.manager.CompanyManager" %>
<%@ page import="com.model.Company" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mno
  Date: 4/25/23
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update employee</title>
</head>
<%
  Employee employee = (Employee) request.getAttribute("employee");
  CompanyManager companyManager = new CompanyManager();
  List<Company> companies = companyManager.getAll();
%>
<body>
<h2>Update Employee</h2>
<form action="updateEmployee" method="post">
  <input name="id" type="hidden" value="<%=employee.getId()%>">
  Name: <input name="name" type="text" value="<%=employee.getName()%>">
  Surname: <input name="surname" type="text" value="<%=employee.getSurname()%>">
  Email: <input name="email" type="text" value="<%=employee.getEmail()%>">
  Company:
  <select name="selectCompany">
    <% for (Company company : companies) { %>
    <option value="<%=company.getId()%>"><%=company.getName()%></option>
    <%}%>
  </select>
  <input type="submit" value="update">
</form>
</body>
</html>
