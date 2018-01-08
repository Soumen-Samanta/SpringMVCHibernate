package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Department;
import com.journaldev.spring.model.Employee;
import com.journaldev.spring.model.Person;

public interface DepartmentDAO {
public List<Department> listDepartment();
public Department getDepartmentById(int id);
public void removeDepartment(int id);
public List<Employee> listEmployee(int deptId);

}
