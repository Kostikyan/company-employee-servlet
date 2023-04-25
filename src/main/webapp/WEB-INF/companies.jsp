<%@ page import="java.util.List" %>
<%@ page import="com.model.Company" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Companies</title>
</head>
<% List<Company> companyList = (List<Company>) request.getAttribute("companies"); %>
<body>

<h2>Companies</h2> <a href="createCompany">Create Company</a>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>country</th>
        <th>action</th>
    </tr>
    <% if(companyList != null && !companyList.isEmpty()){
        for (Company company : companyList) {   %>
        <tr>
            <td><%=company.getId()%></td>
            <td><%=company.getName()%></td>
            <td><%=company.getCountry()%></td>
            <td><a href="removeCompany?id=<%=company.getId()%>">delete</a>
                <a href="updateCompany?id=<%=company.getId()%>">update</a>
            </td>
        </tr>
    <%}}%>
</table>


</body>
</html>
