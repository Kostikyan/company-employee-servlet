<%@ page import="com.manager.CompanyManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Company" %><%--
  Created by IntelliJ IDEA.
  User: mno
  Date: 4/25/23
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create employee</title>
</head>
<%
    CompanyManager companyManager = new CompanyManager();
    List<Company> companies = companyManager.getAll();
%>
<body>
<h2>Create Employee</h2>
<form action="createEmployee" method="post">
    Name: <input type="text" name="name"> <br>
    Surname: <input type="text" name="surname"> <br>
    Email: <input type="text" name="email"> <br>
    Company:
    <select name="selectCompany">
        <% for (Company company : companies) { %>
        <option value="<%=company.getId()%>"><%=company.getName()%></option>
        <%}%>
    </select> <br>
    <input type="submit" value="create">
</form>
</body>
</html>
