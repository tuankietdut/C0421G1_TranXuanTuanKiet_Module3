package model.service.Imp;

import model.bean.Customer.CustomerType;
import model.repository.CustomerTypeRepository;
import model.repository.Imp.CustomerTypeRepositoryImp;
import model.service.CustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImp implements CustomerTypeService {
    private CustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImp();
    @Override
    public List<CustomerType> getList() {
        return this.customerTypeRepository.getList();
    }
}
