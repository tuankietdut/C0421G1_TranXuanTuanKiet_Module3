package model.service.customer;

import model.bean.Customer.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> getList();
    boolean createCustomer(Customer customer);
    boolean editCustomer(Customer customer);
    boolean deleteCustomer(int id);
    Customer findById(int id);
}
