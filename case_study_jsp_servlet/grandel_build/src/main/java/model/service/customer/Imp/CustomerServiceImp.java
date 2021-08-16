package model.service.customer.Imp;

import model.bean.Customer.Customer;
import model.repository.customer.CustomerRepository;
import model.repository.customer.Imp.CustomerRepositoryImp;
import model.service.common.Imp.ValidateServiceImp;
import model.service.common.ValidateService;
import model.service.customer.CustomerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImp implements CustomerService {
    private final ValidateService validateService = new ValidateServiceImp();
    private final CustomerRepository customerRepository = new CustomerRepositoryImp();
    @Override
    public List<Customer> getList() {
        return this.customerRepository.getList();
    }

    @Override
    public Map<String, String> createCustomer(Customer customer) {
        Map<String, String> stringMap = new HashMap<>();
        if (!this.validateService.validateCodeCustomer(customer.getCodeCustomer())){
            stringMap.put("errorCodeCustomer","Not Ok right here");
        }
        if (!this.validateService.validatePhone(customer.getPhone())){
            stringMap.put("errorPhone","Not Ok right here");
        }
        if (!this.validateService.validateEmail(customer.getEmail())){
            stringMap.put("errorEmail","Not Ok right here");
        }
        if (!this.validateService.validateIdCard(customer.getIdCard())){
            stringMap.put("errorIdCard","Not Ok right here");
        }
        if (!stringMap.isEmpty()){
            stringMap.put("result","fall");
            return stringMap;
        }
        if (this.customerRepository.createCustomer(customer)){
            stringMap.put("result","success");
        }else {
            stringMap.put("result","errorDataBase");
        }
        return stringMap;
    }

    @Override
    public Map<String, String> editCustomer(Customer customer) {
        Map<String, String> stringMap = new HashMap<>();
        if (!this.validateService.validateCodeCustomer(customer.getCodeCustomer())){
            stringMap.put("errorCodeCustomer","Not Ok right here");
        }
        if (!this.validateService.validatePhone(customer.getPhone())){
            stringMap.put("errorPhone","Not Ok right here");
        }
        if (!this.validateService.validateEmail(customer.getEmail())){
            stringMap.put("errorEmail","Not Ok right here");
        }
        if (!this.validateService.validateIdCard(customer.getIdCard())){
            stringMap.put("errorIdCard","Not Ok right here");
        }
        if (!stringMap.isEmpty()){
            stringMap.put("result","fall");
            return stringMap;
        }
        if (this.customerRepository.editCustomer(customer)){
            stringMap.put("result","success");
        }else {
            stringMap.put("result","errorDataBase");
        }
        return stringMap;
    }

    @Override
    public boolean deleteCustomer(int id) {
        return this.customerRepository.deleteCustomer(id);
    }

    @Override
    public Customer findById(int id) {
        return this.customerRepository.findById(id);
    }
}
