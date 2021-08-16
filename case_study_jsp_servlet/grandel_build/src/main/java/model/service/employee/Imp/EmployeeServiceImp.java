package model.service.employee.Imp;

import model.bean.Customer.Customer;
import model.bean.Employee.Employee;
import model.repository.employee.Imp.EmployeeRepositoryImp;
import model.repository.employee.EmployeeRepository;
import model.service.common.Imp.ValidateServiceImp;
import model.service.common.ValidateService;
import model.service.employee.EmployeeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImp implements EmployeeService {
    private final ValidateService validateService = new ValidateServiceImp();
    private final EmployeeRepository employeeRepository = new EmployeeRepositoryImp();
    @Override
    public List<Employee> getList() {
        return this.employeeRepository.getList();
    }

    @Override
    public Map<String, String> createEmployee(Employee employee) {
        Map<String, String> stringMap = new HashMap<>();
        if (!this.validateService.validatePhone(employee.getPhone())){
            stringMap.put("errorPhone","Not Ok right here");
        }
        if (!this.validateService.validateEmail(employee.getEmail())){
            stringMap.put("errorEmail","Not Ok right here");
        }
        if (!this.validateService.validateIdCard(employee.getIdCard())){
            stringMap.put("errorIdCard","Not Ok right here");
        }
        if (!stringMap.isEmpty()){
            stringMap.put("result","fall");
            return stringMap;
        }
        if (this.employeeRepository.createEmployee(employee)){
            stringMap.put("result","success");
        }else {
            stringMap.put("result","errorDataBase");
        }
        return stringMap;


    }

    @Override
    public Map<String, String> editEmployee(Employee employee) {
        Map<String, String> stringMap = new HashMap<>();
        if (!this.validateService.validatePhone(employee.getPhone())){
            stringMap.put("errorPhone","Not Ok right here");
        }
        if (!this.validateService.validateEmail(employee.getEmail())){
            stringMap.put("errorEmail","Not Ok right here");
        }
        if (!this.validateService.validateIdCard(employee.getIdCard())){
            stringMap.put("errorIdCard","Not Ok right here");
        }
        if (!stringMap.isEmpty()){
            stringMap.put("result","fall");
            return stringMap;
        }
        if (this.employeeRepository.editEmployee(employee)){
            stringMap.put("result","success");
        }else {
            stringMap.put("result","errorDataBase");
        }
        return stringMap;

    }

    @Override
    public boolean deleteEmployee(int id) {
        return this.employeeRepository.deleteEmployee(id);
    }

    @Override
    public Employee findById(int id) {
        return this.employeeRepository.findById(id);
    }
}
