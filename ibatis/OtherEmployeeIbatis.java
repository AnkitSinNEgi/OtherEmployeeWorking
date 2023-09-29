package com.org.ils.il.otherEmployees.ibatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ui.ModelMap;

import com.org.ils.il.otherEmployees.model.OtherEmployee;
import com.org.ils.il.otherEmployees.model.OtherEmployeeDepartment;

public interface OtherEmployeeIbatis {
	
	// To list all other employees
	@Select("Select userid, employee_name, created_by, department_pk, otheremp_in_time, otheremp_out_time, face_id from ${sKey}.biometric_other_emp_map")
	public List<OtherEmployee> listAllOtherEmployees(Map<String, Object> sKey);
	
	// To get employee by user id
	@Select("Select userid, employee_name, created_by, department_pk, otheremp_in_time, otheremp_out_time, face_id from ${skey}.biometric_other_emp_map where biometric_other_emp_map.userid = #{userid}")
	OtherEmployee findOtherEmployee(ModelMap mm);
	
	//To get other employee by face id
	@Select("Select userid, employee_name, created_by, department_pk, otheremp_in_time, otheremp_out_time, face_id from ${skey}.biometric_other_emp_map where biometric_other_emp_map.userid = #{face_id}")
	OtherEmployee findOtherEmployeeByFaceId(ModelMap mm);
	
	// To insert an employee
	@Insert("insert into biometric_other_emp_map(userid, employee_name, created_by, department_pk, otheremp_in_time, otheremp_out_time, face_id) values (#{userid}, #{employee_name}, #{created_by}, #{department_pk}, '09:00:00', '17:30:00', #{face_id})")
	@Options(useGeneratedKeys = true, keyProperty="userid")
	public void registerOtherEmployee(ModelMap mm);
	
	//Get latest user id
	@Select("Select max(userid) from biometric_other_emp_map")
	public Long getLatestUserID();
	
	// Get list of departments
	@Select("Select pk as department_id, department_name from department_master")
	public List<OtherEmployeeDepartment> getDepartments();
	
	// update an employee
	@Update("update biometric_other_emp_map set employee_name=#{employee_name}, created_by=#{created_by}, department_pk=#{department_pk}, face_id=#{face_id}")
	public void updateOtherEmployee(ModelMap mm);

	
}
