package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Department;
import com.journaldev.spring.model.Employee;

public interface DepartmentService {
	public List<Department> listDepartment();
	public Department getDepartmentById(int id);
	public void removeDepartment(int id);
	public List<Employee> listEmployee(int deptId);
}
