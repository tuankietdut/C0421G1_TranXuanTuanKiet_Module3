package model.service.contract.Imp;

import model.bean.contract.Contract;
import model.repository.contract.ContractRepository;
import model.repository.contract.Imp.ContractRepositoryImp;
import model.service.contract.ContractService;

import java.util.List;

public class ContractServiceImp implements ContractService {
    private ContractRepository contractRepository = new ContractRepositoryImp();
    @Override
    public boolean createContract(Contract contract) {
        return this.contractRepository.createContract(contract);
    }

    @Override
    public List<Contract> getList() {
        return this.contractRepository.getList();
    }
}
