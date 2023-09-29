<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
            height: 100vh;
            margin: 0;
        }
        .employeeData {
            height: 600px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <script src="webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
    <script src="webjars/jquery/3.6.4/jquery.min.js"></script>
    
    
    <!-- Update part -->
    <div id="updateEmployeeDetails">
    	
  
        <div id="heading"> <h1>Employee Update Form</h1> </div>
          
        <form:form id="registerOtherEmployeeForm" action="${pageContext.request.contextPath}/otherEmployee/update" method="post">
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
    </form:form>
          
    </div>
</body>
</html>