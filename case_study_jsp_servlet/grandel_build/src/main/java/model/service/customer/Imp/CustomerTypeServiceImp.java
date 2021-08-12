package model.service.customer.Imp;

import model.bean.Customer.CustomerType;
import model.repository.customer.CustomerTypeRepository;
import model.repository.customer.Imp.CustomerTypeRepositoryImp;
import model.service.customer.CustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImp implements CustomerTypeService {
    private CustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImp();
    @Override
    public List<CustomerType> getList() {
        return this.customerTypeRepository.getList();
    }
}
