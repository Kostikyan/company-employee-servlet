<%@ page import="com.model.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mno
  Date: 4/25/23
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>employees</title>
</head>
<%List<Employee> employeeList = (List<Employee>) request.getAttribute("employees");%>
<body>
<h2>Employees</h2>
<a href="createEmployee">Create Employee</a>
<br>
<table border="1">
  <tr>
    <th>id</th>
    <th>name</th>
    <th>surname</th>
    <th>email</th>
    <th>Company</th>
    <th>Action</th>
  </tr>
  <% if(employeeList != null && !employeeList.isEmpty()){
    for (Employee employee : employeeList) {   %>
  <tr>
    <td><%=employee.getId()%></td>
    <td><%=employee.getName()%></td>
    <td><%=employee.getSurname()%></td>
    <td><%=employee.getEmail()%></td>
    <td><%=employee.getCompany()%></td>
    <td>
      <a href="removeEmployee?id=<%=employee.getId()%>">delete</a>
      <a href="updateEmployee?id=<%=employee.getId()%>">update</a>
    </td>
  </tr>
  <%}}%>
</table>
</body>
</html>
