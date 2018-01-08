package com.journaldev.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.journaldev.spring.model.Department;
import com.journaldev.spring.model.Employee;
import com.journaldev.spring.model.LoginBean;
import com.journaldev.spring.model.Person;
import com.journaldev.spring.service.DepartmentService;
import com.journaldev.spring.service.LoginService;
import com.journaldev.spring.service.PersonService;

@Controller
//@RestController
@RequestMapping("/")
public class PersonController {
	
	 
	
	private PersonService personService;
	private LoginService loginService;
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
	}
	

	@Autowired(required=true)
	@Qualifier(value="loginService")
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	private DepartmentService departmentService;
	@Autowired(required=false)
	@Qualifier(value="departmentService")
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}


	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String init(Model model) {
       // model.addAttribute("msg", "Please Enter Your Login Details");
       // return "Department";
		//return "FlatWorldsDemo";
		//return "page4";
		//return "tablelevel_rules";
		return "reactJs_index";
		
    }
	
	@Autowired(required=false)
	@Qualifier(value="loginService")
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<LoginBean>> getUser(@PathVariable("id") String id) {
        System.out.println("Fetching User with id " + id);
        String password="1239s";
        ArrayList<LoginBean> loginList=new ArrayList<LoginBean>();
        loginList=(ArrayList<LoginBean>) this.loginService.getUserLogin(id,password);
       System.out.println("id="+id);
       for(LoginBean li:loginList){
    	   System.out.println("userName"+li.getUserName());
       }
      // return loginList;
        if (loginList == null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<List<LoginBean>>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<List<LoginBean>>(loginList, HttpStatus.OK);
    }
	// department list
	@RequestMapping(value="/department", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	
	public ResponseEntity<List<Department>> getDepartment(){
		List<Department> departmentList=new ArrayList<Department>();
		departmentList=this.departmentService.listDepartment();
		System.out.println("hi inside department");
		 for(Department li:departmentList){
	    	   System.out.println("departmentName= "+li.getDepartmentName());
	       }
		 if (departmentList == null) {
	          //  System.out.println("User with id " + id + " not found");
	            return new ResponseEntity<List<Department>>(HttpStatus.NOT_FOUND);
	        }
	        return new ResponseEntity<List<Department>>(departmentList, HttpStatus.OK);
	}
	//Department By Id
	@RequestMapping(value="/department/{id}", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Department>getdepartmentById(@PathVariable("id") int id){
		Department department=new Department();
          department=this.departmentService.getDepartmentById(id);
        System.out.println(department.getDepartmentName());
          if(department==null){
        	  return new ResponseEntity<Department>(HttpStatus.NOT_FOUND);
          }
		return new ResponseEntity<Department>(department, HttpStatus.OK);
	}
	// Remove department
	@RequestMapping(value="department/{id}",method=RequestMethod.DELETE,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Department> deleteDepartment(@PathVariable("id") int id){
		this.departmentService.removeDepartment(id);
		return new ResponseEntity<Department>(HttpStatus.OK);
	}
	// Employee List by department 
	@RequestMapping(value="employeeList/{id}",method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Employee>> getEmployee(@PathVariable("id") int id){
		List<Employee> employeeList=new ArrayList<Employee>();
		employeeList=this.departmentService.listEmployee(id);
		if (employeeList == null) {
	          //  System.out.println("User with id " + id + " not found");
	            return new ResponseEntity<List<Employee>>(HttpStatus.NOT_FOUND);
	        }
	        return new ResponseEntity<List<Employee>>(employeeList, HttpStatus.OK);
	}
	@RequestMapping(method=RequestMethod.POST)
	public String userLogin(Model model,@ModelAttribute("loginBean") LoginBean loginBean){
		ArrayList<LoginBean> loginList=new ArrayList<LoginBean>();
		
		if(loginBean !=null && loginBean.getUserName() !=null && loginBean.getPassword() !=null ){
			loginList=(ArrayList<LoginBean>) this.loginService.getUserLogin(loginBean.getUserName(),loginBean.getPassword());
			if(loginBean.getUserName().equals("soumen") && loginBean.getPassword().equals("samanta")){
				model.addAttribute("msg", "welcome" + loginBean.getUserName());
                return "user";
			}
			if(loginList.size()>0){
				 return "user";
			}
				else {
                model.addAttribute("error", "Invalid Details");
                return "home";
            }
        } else {
            model.addAttribute("error", "Please enter Details");
            return "home";
		}
	}
	//
	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "person";
	}
	
	//For add and update person both
	@RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p){
		
		if(p.getId() == 0){
			//new person, add it
			this.personService.addPerson(p);
		}else{
			//existing person, call update
			this.personService.updatePerson(p);
		}
		
		return "redirect:/persons";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
		
        this.personService.removePerson(id);
        return "redirect:/persons";
    }
 
    @RequestMapping("/edit/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        model.addAttribute("listPersons", this.personService.listPersons());
        return "person";
    }
	
}
