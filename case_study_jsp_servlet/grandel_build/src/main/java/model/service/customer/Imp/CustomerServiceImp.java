package model.service.customer.Imp;

import model.bean.Customer.Customer;
import model.repository.customer.CustomerRepository;
import model.repository.customer.Imp.CustomerRepositoryImp;
import model.service.customer.CustomerService;

import java.util.List;

public class CustomerServiceImp implements CustomerService {
    private CustomerRepository customerRepository = new CustomerRepositoryImp();
    @Override
    public List<Customer> getList() {
        return this.customerRepository.getList();
    }

    @Override
    public boolean createCustomer(Customer customer) {
        return this.customerRepository.createCustomer(customer);
    }

    @Override
    public boolean editCustomer(Customer customer) {
        return this.customerRepository.editCustomer(customer);
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