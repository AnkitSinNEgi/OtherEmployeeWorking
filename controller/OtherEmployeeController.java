package com.org.ils.il.otherEmployees.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.ils.il.otherEmployees.model.OtherEmployee;
import com.org.ils.il.otherEmployees.service.OtherEmployeesService;

@Controller
@RequestMapping("/otherEmployee")
public class OtherEmployeeController {
  
	@Autowired
    private OtherEmployeesService employeeService;
	
	
	
	//for testing purposes
	 @Autowired
	    public OtherEmployeeController(OtherEmployeesService otherEmployeeService) {
	        this.employeeService = otherEmployeeService;
	    }
	//for testing purpoese
	

 //to soow the registration form
    @RequestMapping("/form")
    public String showForm(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession(false);
        model.addAttribute("otherEmployee", new OtherEmployee());
        model.addAttribute("departments", employeeService.getDepartments());       
        return "OtherEmployees/employeeForm";
    }
 //to register the data of the employee
    @RequestMapping("/register")
    public String submitForm(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
    	 HttpSession session = request.getSession(false);
         Map<String, Object> sKey = new HashMap<String, Object>();
         sKey.put("userid", (Long) session.getAttribute("userid"));
         sKey.put("sKey", (String) session.getAttribute("skey"));
         employeeService.saveOtherEmployee(model, request);
    	 model.addAttribute("employee", employeeService.getOtherEmployeeByUserId(model,sKey,request));
        return "OtherEmployees/otherEmployeeRegisterSuccess";       
    }
 //to get the list of  all employees   
    @RequestMapping("/listAllEmployees")
    public String listAllEmployees(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
    	HttpSession session = request.getSession(false);   	
         Map<String, Object> sKey = new HashMap<String, Object>();
         sKey.put("userid", (Long) session.getAttribute("userid"));
         sKey.put("sKey", (String) session.getAttribute("skey"));
        List<OtherEmployee> employees = employeeService.listAllOtherEmployees( sKey);
        model.addAttribute("employees", employees);
        return "OtherEmployees/viewEmployees"; // Name of your JSP file to display the list
    }   
    
 //for opening an update form 
    @RequestMapping("/updateOtherEmployeeDetails") // added other in this
    public String showUpdateEmployeeDetailsForm(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
    	HttpSession session = request.getSession(false);
        Map<String, Object> sKey = new HashMap<String, Object>();
        sKey.put("userid", (Long) session.getAttribute("userid"));
        sKey.put("sKey", (String) session.getAttribute("skey"));
        model.addAttribute("departments", employeeService.getDepartments());
        model.addAttribute("employee", employeeService.getOtherEmployeeByFaceId(model,sKey,request));
   
        //System.out.print(model);     
        return "OtherEmployees/updateEmployeeDetails";             
    }

 // To update Other Employee
    @RequestMapping("/update")
    public String submitUpdateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
    	 HttpSession session = request.getSession(false);
         Map<String, Object> sKey = new HashMap<String, Object>();
         sKey.put("userid", (Long) session.getAttribute("userid"));
         sKey.put("sKey", (String) session.getAttribute("skey"));       	
    	
    	employeeService.updateOtherEmployee(model, request);
    	model.addAttribute("employee", employeeService.getOtherEmployeeByFaceId(model,sKey,request)); //User to Face id for test
    	
    	return "OtherEmployees/otherEmployeeRegisterSuccess";
   	
    }
 //to get data based on faceID//test
//    @RequestMapping("/recordByFaceId")
//    public ResponseEntity<OtherEmployee> getEmployeeByFaceId(@RequestParam("faceId")String faceId ,HttpServletRequest request)
//    {
//    	HttpSession session =request.getSession(false);
//    	Map<String,Object> sKey= new HashMap<>();
//    	sKey.put("userid",(Long)session.getAttribute("userid"));
//    	sKey.put("sKey",(String)session.getAttribute("skey"));
//    	
//    	OtherEmployee employee= employeeService.getOtherEmployeeByFaceId(faceId, sKey);
//    	HttpStatus status=(employee!=null)? HttpStatus.OK : HttpStatus.NOT_FOUND;
//    	return new ResponseEntity<>(employee,status);
//    }
    
    
    //test api
//    @RequestMapping("/recordByFaceId")
//    public ModelAndView getEmployeeByFaceId(@RequestParam("faceId") String faceId, HttpServletRequest request){
//        HttpSession session = request.getSession(false);
//        Map<String, Object> sKey = new HashMap<>();
//        sKey.put("userid", (Long) session.getAttribute("userid"));
//        sKey.put("sKey", (String) session.getAttribute("skey"));
//        		
//        OtherEmployee employee = employeeService.getOtherEmployeeByFaceId(faceId, sKey);
//        System.out.print(faceId);
//        ModelAndView modelAndView = new ModelAndView("employeeDetails"); // View name (employeeDetails.jsp)
//        modelAndView.addObject("employee", employee); // Add the employee object to the model
//
//        return modelAndView;
//    }
    
}
