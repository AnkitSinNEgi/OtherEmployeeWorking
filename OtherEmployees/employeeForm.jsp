

<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title>${map.sub}</title>
        <style type="text/css" media="screen, print">
        	@import url("<c:url value="/static/lbsnaa/css/bootstrap.css"/>");
            @import url("<c:url value="/static/lbsnaa/css/bootstrap-responsive.css"/>"); 
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
        <script type="text/javascript" charset="utf-8">  </script>
        <style type="text/css">
            #fixedtipdiv
            {
                position:absolute;
                padding: 2px;
                border:1px solid black;
                font:normal 12px Verdana;
                line-height:18px;
                z-index:100;
            }
            #mainBody{
            background-color: E6E6E6;
            height:800px;
            }
            #registerOtherEmployeeForm{	
             	font-size: 20px;
             	margin-left : 50px;
             	font-weight: 700;
            }
            #updateEmployeeForm{	
             	font-size: 20px;
             	margin-left : 50px;
             	font-weight: 700;
            }
            #footerViewAllEmployee{
             font-size: 18px;
             margin-left: 50px;
             margin-top:330px;
             text-decoration: underline;
            }
            .heading{
            	text-align:center;
            	margin: 30px 30px 30px 30px;
            }           
            .container{         
              float:left;
              width:47%;
              background-color: white;
              margin-inline:20px;
              height:650px;
              box-shadow: 5px 10px #888888;
              margin-top:10px;
              paddding : 12 px;
            }
            
        </style>
    </head>
    <body>
 <!-- header panel -->
 <div id="mainBody">
        <div width="100%" style="background-color:white;">
                <table cellpadding="0" cellspacing="0" class="ils_header" >
                    <tr>
                        <td width="100%">
                            <table cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td width="20%" align="left"><img src="<c:url value="/static/images/cLogo_small.png"/>" border="0" style="height:32px;"/></td>
                                    <td width="60%" align="center" valign="center"><h1>${map.sub}</h1></td>
                                    <td width="20%" align="right">
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%">

                            <div class="navigation_text">
                                &nbsp; ${map.nav}
                            </div>
                            <div class="form_description">
                                This page displays all Priority in the system, and provide options to manage records such as add, edit, delete, excel download, print etc.
                            </div> 
                        </td>
                    </tr>
                </table>
                            
     </div>
  	<!-- right side panel  -->   
     <div class="container">
                   <div class="heading" style="margin-left: 20px;">
                    <h2>Employee Registration Form</h2>
                    </div>
    			<form:form id="registerOtherEmployeeForm" action="${pageContext.request.contextPath}/otherEmployee/register" method="post">
        		<label for="userid">User ID : </label>
        		<input type="text" placeholder="Auto-generated" id="userid" name="userid" readonly="true"><br>

       			 <label for="employee_name">Employee Name : </label>
        		<input type="text" placeholder="Enter Employee Name" id="employee_name" name="employee_name" required><br>

        		<label for="created_by">Created By : </label>
       			 <input type="text" placeholder="Enter Your Name" id="created_by" name="created_by" required><br>

       			 <label for="department_pk">Department : </label>
				<select id="department_pk" name="department_pk" >
    				<c:forEach items="${departments}" var="department">
    				
        			<option value="${department.department_id}">${department.department_name}</option>
    				</c:forEach>
				</select><br><br>
			
      		    <label for="otheremp_in_time">In Time : </label>
			    <input type="text" id="otheremp_in_time" name="otheremp_in_time" readonly value="${inTimeValue}" placeholder="09:00 AM"><br>

				<label for="otheremp_out_time">Out Time : </label>
		 		<input type="text" id="otheremp_out_time" name="otheremp_out_time" readonly value="${outTimeValue}" placeholder="05:30 PM"><br>

       			 <label for="face_id">Face ID : </label>
       		    <input type="text" placeholder="Enter FaceId" id="face_id" name="face_id" required><br>
	
        		<input type="submit" value="Submit">
   			  </form:form>
        </div>
	
	
	<!-- update panel starts -->     
  		<div class="container">
  		            <div class="heading">
                    <h2>Employee Updation Form</h2>
                    </div>
  		
  		 
    <div style="background-color:white; height:100px; width:120 px; ">
    <form:form id="registerOtherEmployeeForm" action="${pageContext.request.contextPath}/otherEmployee/updateOtherEmployeeDetails" method="post">
    <!-- ... other form fields ... -->
    <label for="viewEmployeeDetails">View Employee Details by Face ID : </label>
    <input type="text" placeholder="Enter FaceId" id="viewEmployeeDetails" name="face_id" required ><br>

     <!-- 
    <input type="submit" value="View Details" formaction="${pageContext.request.contextPath}/otherEmployee/viewEmployeeDetails">
     Button Example -->
    <br>
    <input type="submit" value="View Details" >
    
    <!-- Hyperlink Example --formaction="${pageContext.request.contextPath}/otherEmployee/updateEmployeeDetails"-->
    <!-- <a href="<c:url value='/otherEmployee/viewEmployeeDetails'/>?faceId=${viewEmployeeDetails}" class="btn btn-primary">View Details</a> -->

	</form:form>
  		  <br>
  		<div id="footerViewAllEmployee">
        <a href="${pageContext.request.contextPath}/otherEmployee/listAllEmployees" >View All Registered Employees</a>
        </div>
  </div>

 </div>

 </body></html>