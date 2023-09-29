<!-- employeeDetails.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Details</title>
</head>
<body>
    <h1>Employee Details</h1>

    <p>User ID: ${employee.userid}</p>
    <p>Name: ${employee.employee_name}</p>
    <p>Created By: ${employee.created_by}</p>
    <p>Department: ${employee.department_pk}</p>
    <!-- Add more attributes as needed -->

    <!-- Add a link or button to navigate back to the previous page if needed -->
    <a href="<c:url value='/previousPage'/>">Back to Previous Page</a>
</body>
</html>
