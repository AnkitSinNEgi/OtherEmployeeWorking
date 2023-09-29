package com.org.ils.il.otherEmployees.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.org.ils.il.otherEmployees.model.OtherEmployee;
import com.org.ils.il.otherEmployees.model.OtherEmployeeDepartment;

public interface OtherEmployeesService {
	//to get list of all employees
	public List<OtherEmployee> listAllOtherEmployees(Map<String, Object> sKey);
	
	//to get details for one employee
	public OtherEmployee getOtherEmployeeByUserId(ModelMap mm, Map<String, Object> sKey, HttpServletRequest request);
	
	//to register or save employee
	public void saveOtherEmployee(ModelMap model, HttpServletRequest request);
	
	//get all departments
	public List<OtherEmployeeDepartment> getDepartments();
	
	//update an employee
	public void updateOtherEmployee(ModelMap model, HttpServletRequest request);
	
	//to get details for one employee by faceid
	public OtherEmployee getOtherEmployeeByFaceId(ModelMap mm, Map<String, Object> sKey, HttpServletRequest request);

	//test
	public OtherEmployee getOtherEmployeeByFaceId(String faceId, Map<String, Object> sKey);
	//test
	
	
}
