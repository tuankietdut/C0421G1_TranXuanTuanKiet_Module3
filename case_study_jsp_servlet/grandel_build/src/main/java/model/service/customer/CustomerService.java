package model.service.customer;

import model.bean.Customer.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<Customer> getList();
    Map<String, String> createCustomer(Customer customer);
    Map<String, String> editCustomer(Customer customer);
    boolean deleteCustomer(int id);
    Customer findById(int id);
}
