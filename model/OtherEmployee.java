package com.org.ils.il.otherEmployees.model;

public class OtherEmployee {
    private Long userid;
	private String employee_name;
    private String created_by;
    private Long department_pk;
    private String otheremp_in_time;
    private String otheremp_out_time;
    private String face_id;
    
    public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public Long getDepartment_pk() {
		return department_pk;
	}
	public void setDepartment_pk(Long department_pk) {
		this.department_pk = department_pk;
	}
	public String getOtheremp_in_time() {
		return otheremp_in_time;
	}
	public void setOtheremp_in_time(String otheremp_in_time) {
		this.otheremp_in_time = otheremp_in_time;
	}
	public String getOtheremp_out_time() {
		return otheremp_out_time;
	}
	public void setOtheremp_out_time(String otheremp_out_time) {
		this.otheremp_out_time = otheremp_out_time;
	}
	public String getFace_id() {
		return face_id;
	}
	public void setFace_id(String face_id) {
		this.face_id = face_id;
	}
}
