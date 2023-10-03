package com.org.ils.il.otherEmployees.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.org.ils.il.general.model.AccessPoint;
import com.org.ils.il.otherEmployees.ibatis.OtherEmployeeIbatis;
import com.org.ils.il.otherEmployees.model.OtherEmployee;
import com.org.ils.il.otherEmployees.model.OtherEmployeeDepartment;
import com.org.ils.il.otherEmployees.service.OtherEmployeesService;

@Service
public class OtherEmployeeServiceImpl extends ApplicationObjectSupport implements OtherEmployeesService {

	
	@Override
	public List<OtherEmployee> listAllOtherEmployees(Map<String, Object> sKey) {
		SqlSession session = AccessPoint.getDBTemplate().openSession();
		List<OtherEmployee> list = null;
		try {
			OtherEmployeeIbatis mapper = session.getMapper(OtherEmployeeIbatis.class);
			list = mapper.listAllOtherEmployees(sKey);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public void saveOtherEmployee(ModelMap model, HttpServletRequest request) {
        SqlSession session = AccessPoint.getDBTemplate().openSession();
        try {
            OtherEmployeeIbatis mapper = session.getMapper(OtherEmployeeIbatis.class);
            Long lastUserID = mapper.getLatestUserID();
            model.put("userid", lastUserID+1);
            model.put("employee_name", request.getParameter("employee_name"));
            model.put("created_by", request.getParameter("department_pk"));
            model.put("department_pk", request.getParameter("department_pk"));
            model.put("face_id", request.getParameter("face_id"));
            mapper.registerOtherEmployee(model);
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        } finally {
            session.commit();
            session.close();
        }
    }
	
	@Override
	public void updateOtherEmployee(ModelMap model, HttpServletRequest request) {
		SqlSession session = AccessPoint.getDBTemplate().openSession();
        try {
            OtherEmployeeIbatis mapper = session.getMapper(OtherEmployeeIbatis.class);
//            Long lastUserID = mapper.getLatestUserID();
//            model.put("userid", lastUserID+1);
            model.put("employee_name", request.getParameter("employee_name"));
            model.put("created_by", request.getParameter("department_pk"));
            model.put("department_pk", request.getParameter("department_pk"));
            model.put("face_id", request.getParameter("face_id"));
            System.out.println("userid: "+model.get("userid"));
            mapper.updateOtherEmployee(model);
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        } finally {
            session.commit();
            session.close();
        }
	}

	@Override
	public OtherEmployee getOtherEmployeeByUserId(ModelMap mm, Map<String, Object> sKey , HttpServletRequest request) {
		SqlSession session = AccessPoint.getDBTemplate().openSession();
		OtherEmployee oe = null;
		try {
			OtherEmployeeIbatis mapper = session.getMapper(OtherEmployeeIbatis.class);
		  //  mm.put("userid", request.getParameter("userid"));
		    System.out.println("Ye skey hai "+sKey.get("sKey"));	    
		    System.out.println("Ye userid  hai "+sKey.get("userid"));
			mm.put("skey",sKey.get("sKey"));
			mm.put("userid", mapper.getLatestUserID());
		    oe = mapper.findOtherEmployee(mm);
		} finally {
			session.commit();
			session.close();
		}
		return oe;
	}
	
	@Override
	public OtherEmployee getOtherEmployeeByFaceId(ModelMap mm, Map<String, Object> sKey , HttpServletRequest request) {
		SqlSession session = AccessPoint.getDBTemplate().openSession();
		OtherEmployee oe = null;
		try {
			OtherEmployeeIbatis mapper = session.getMapper(OtherEmployeeIbatis.class);
		  //  mm.put("userid", request.getParameter("userid"));
			mm.put("skey",sKey.get("sKey"));
			mm.put("face_id", request.getParameter("face_id"));
			System.out.println("face_id "+mm.get("face_id"));
		    oe = mapper.findOtherEmployeeByFaceId(mm);
		    System.out.println("User id: "+oe.getUserid());
		} finally {
			session.commit();
			session.close();
		}
		return oe;
	}
	
	@Override
	public List<OtherEmployeeDepartment> getDepartments() {
		SqlSession session = AccessPoint.getDBTemplate().openSession();
		List<OtherEmployeeDepartment> departments = new ArrayList<OtherEmployeeDepartment>();
		try {
			OtherEmployeeIbatis mapper = session.getMapper(OtherEmployeeIbatis.class);
			departments = mapper.getDepartments();
		} finally {
			session.commit();
			session.close();
		}
		return departments;
	}

//	public OtherEmployee getOtherEmployeeByFaceId(String faceId, Map<String, Object> sKey) {
//		SqlSession session= AccessPoint.getDBTemplate().openSession();
//		OtherEmployee oe= null;
//		try {
//			OtherEmployeeIbatis mapper =session.getMapper(OtherEmployeeIbatis.class);
//			oe= mapper.findOtherEmployeeByFaceId(faceId,(String)sKey.get("sKey"));
//		}finally {
//		session.commit();
//		session.close();
//		}
//		return oe;
//	}
}
