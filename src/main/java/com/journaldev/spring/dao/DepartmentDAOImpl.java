package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Department;
import com.journaldev.spring.model.Employee;
import com.journaldev.spring.model.Person;
@Repository
public class DepartmentDAOImpl implements DepartmentDAO {
	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> listDepartment() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Department> departmentList = session.createQuery("from Department").list();
		for(Department d : departmentList){
			logger.info("Department List::"+d);
		}
		return departmentList;
	}
	@SuppressWarnings("unchecked")
	@Override
	public Department getDepartmentById(int id){
		Session session = this.sessionFactory.getCurrentSession();
		Department department=(Department) session.load(Department.class, new Integer(id));
		logger.info("Person loaded successfully, Person details="+department);
		return department;
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public void removeDepartment(int id){
		Session session = this.sessionFactory.getCurrentSession();
		Department  dep= (Department) session.load(Department.class, new Integer(id));
		if(null != dep){
			session.delete(dep);
		}
		logger.info("Person deleted successfully, person details="+dep);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> listEmployee(int deptId){
		Session session = this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Employee where dpt_id=:id");
		query.setParameter("id",deptId);
		List<Employee> employeelist=query.list();
		return employeelist;
	}
}
