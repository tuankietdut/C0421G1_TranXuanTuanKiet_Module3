package model.service.employee;

import model.bean.Employee.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
    List<Employee> getList();
    Map<String, String> createEmployee(Employee employee);
    Map<String, String> editEmployee(Employee employee);
    boolean deleteEmployee(int id);
    Employee findById(int id);
}
