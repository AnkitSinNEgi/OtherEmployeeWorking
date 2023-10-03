<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Employee</title>
    <link href="webjars/bootstrap/5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height:  100vh;
            margin: 0;
        }
        #updateOtherEmployeeDetails{	
        		background-color:white;
             	font-size: 17px;
             	margin-left : 50px;
             	font-weight: 700;
             	height: 700px;
             	width: 600px;
             	box-shadow: 5px 10px #888888;
             	
            }
        #heading{
        text-align: center;
        font-size: 80px;     
        margin-top: 30px;   
        }
        #updateOtherEmployeeForm{
           margin-left: 30px;             
        }
        
    </style>
</head>
<body>
    <script src="webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
    <script src="webjars/jquery/3.6.4/jquery.min.js"></script>
    
    
    <!-- Update part -->
    <div id="updateOtherEmployeeDetails">    	
  
        <div id="heading">
         <h1>Employee Update Form</h1>
        </div>
          <br><br>
        <form:form id="updateOtherEmployeeForm" action="${pageContext.request.contextPath}/otherEmployee/update" method="post">
        <label for="userid">User ID : </label>
        <input type="text" id="userid" name="userid" readonly value="${employee.userid}"><br><br>

        <label for="employee_name">Employee Name : </label>
        <input type="text" id="employee_name" name="employee_name" value="${employee.employee_name}" required><br><br>

        <label for="created_by">Created By : </label>
        <input type="text" id="created_by" name="created_by" value="${employee.created_by}"><br><br>

        <label for="department_pk">Department : </label>
		<select id="department_pk" name="department_pk">
    		<c:forEach items="${departments}" var="department">
        		<option value="${department.department_id}">${department.department_name}</option>
    		</c:forEach>
		</select><br><br>
		<br><br>

        <label for="otheremp_in_time">In Time : </label>
		<input type="text" id="otheremp_in_time" name="otheremp_in_time" readonly value="${employee.otheremp_in_time}" placeholder="09:00 AM"><br><br>

		<label for="otheremp_out_time">Out Time : </label>
		<input type="text" id="otheremp_out_time" name="otheremp_out_time" readonly value="${employee.otheremp_out_time}" placeholder="05:30 PM"><br><br>

        <label for="face_id">Face ID : </label>
        <input type="text" id="face_id" name="face_id" readonly value="${employee.face_id}"><br><br>
		
        <input type="submit" value="Submit">
         <br><br>
        
        <a href="${pageContext.request.contextPath}/otherEmployee/listAllEmployees" >View All Registered Employees</a>
        
    </form:form><br>
              
    </div>
</body>
</html>