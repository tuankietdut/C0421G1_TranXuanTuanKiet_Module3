package model.service.customer_contract.Imp;

import model.bean.CustomerContract;
import model.repository.customer_contract.CustomerContractRepository;
import model.repository.customer_contract.Imp.CustomerContractRepositoryImp;
import model.service.customer_contract.CustomerContractService;

import java.util.List;

public class CustomerContractServiceImp implements CustomerContractService {
    private CustomerContractRepository customerContractRepository = new CustomerContractRepositoryImp();

    @Override
    public List<CustomerContract> getList() {
        return this.customerContractRepository.getList();
    }
}
