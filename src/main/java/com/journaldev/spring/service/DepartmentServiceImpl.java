package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.DepartmentDAO;
import com.journaldev.spring.model.Department;
import com.journaldev.spring.model.Employee;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	private DepartmentDAO departmentDao;
	

	public void setDepartmentDao(DepartmentDAO departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	@Transactional
	public List<Department> listDepartment(){
		return this.departmentDao.listDepartment();
	}
	@Override
	@Transactional
	public Department getDepartmentById(int id){
		return this.departmentDao.getDepartmentById(id);
	}
	@Override
	@Transactional
	public void removeDepartment(int id){
		 this.departmentDao.removeDepartment(id);
	}
	@Override
	@Transactional
	public List<Employee> listEmployee(int deptId){
		return this.departmentDao.listEmployee(deptId);
	}
}
