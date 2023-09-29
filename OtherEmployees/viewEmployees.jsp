<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Employee List</title>
    <style>
        body {
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 60%;
            margin: 0;
        }
        .container {
         	margin-top:140px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .frame-container{           
        	height:90%;
        	overflow-y:scroll;
        	border:1px solid #ccc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Employee List</h2>
        
        <div class="frame-container">
        <table border="1">
            <tr>
                <th>Employee ID</th>
                <th>Employee Name</th>
                <th>Department ID</th>
                <th>In Time</th>
                <th>Out Time</th>
                <th>Face ID</th>
            </tr>
            <c:forEach items="${employees}" var="employee">
                <tr>
                    <td>${employee.userid}</td>
                    <td>${employee.employee_name}</td>
                    <td>${employee.department_pk}</td>
                    <td>${employee.otheremp_in_time}</td>
                    <td>${employee.otheremp_out_time}</td>
                    <td>${employee.face_id}</td>
                    
                </tr>
            </c:forEach>
        </table>
        
        </div>
        <br>
        <a href="${pageContext.request.contextPath}/otherEmployee/form">Register New Employee</a> 
       <!--<a href="/otherEmployee/form">Register New Employee</a>  --> 
    </div>
</body>
</html>