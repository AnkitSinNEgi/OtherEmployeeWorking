<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Form</title>
    <!-- Add your CSS styles or external CSS links here if needed -->
       <style type="text/css" media="screen, print">
            @import url("<c:url value="/static/styles/demo_page.css"/>");
            @import url("<c:url value="/static/styles/demo_table.css"/>");
            @import url("<c:url value="/static/styles/tabletools/media/css/TableTools.css"/>");
            @import url("<c:url value="/static/styles/tabletools/media/css/ColVis.css"/>");
            @import url("<c:url value="/static/styles/footertag.css"/>");
        </style>
        <script type="text/javascript"  charset="utf-8" src="<c:url value="/static/scripts/jquery.dataTables.js"/>"></script>
        <script type="text/javascript"  charset="utf-8" src="<c:url value="/static/styles/tabletools/media/ZeroClipboard/ZeroClipboard.js"/>"></script>
        <script type="text/javascript"  charset="utf-8" src="<c:url value="/static/styles/tabletools/media/js/TableTools.js"/>"></script>
        <script type="text/javascript"  charset="utf-8" src="<c:url value="/static/styles/tabletools/media/js/ColVis.js"/>"></script>
 <style>
        /* Internal CSS Styles */
   label {
            font-size: 18px;
            font-weight: bold;
        }
 </style>
	
</head>
<body>

    <h1>Employee Registration Form</h1>
 <div id="registration-form" style="margin-left: 200px;">
		<form action="${pageContext.request.contextPath}/otherEmployee/register" method="post">
		    <label for="userid">User ID:</label>
		    <input type="text" id="userid" name="userid" required>
		
		    <label for="employee_name">Employee Name:</label>
		    <input type="text" id="employee_name" name="employee_name" required>
		
		    <label for="created_by">Created By:</label>
		    <input type="text" id="created_by" name="created_by" required>
		
		    <label for="department_pk">Department:</label>
		    <select id="department_pk" name="department_pk">
		        <c:forEach items="${departments}" var="department">
		            <option value="${department.department_id}">${department.department_name}</option>
		        </c:forEach>
		    </select>
		
		    <label for="otheremp_in_time">In Time:</label>
		    <input type="text" id="otheremp_in_time" name="otheremp_in_time" readonly value="${inTimeValue}" placeholder="09:00 AM">
		
		    <label for="otheremp_out_time">Out Time:</label>
		    <input type="text" id="otheremp_out_time" name="otheremp_out_time" readonly value="${outTimeValue}" placeholder="05:30 PM">
		
		    <label for="face_id">Face ID:</label>
		    <input type="text" id="face_id" name="face_id" required>
		
		    <input type="submit" value="Submit">
		</form>
</div>
</body>
</html>
