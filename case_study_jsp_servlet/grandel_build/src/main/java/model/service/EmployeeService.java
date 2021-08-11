package model.service;

import model.bean.Employee.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> getList();
    boolean createEmployee(Employee employee);
    boolean editEmployee(Employee employee);
    boolean deleteEmployee(int id);
    Employee findById(int id);
}
