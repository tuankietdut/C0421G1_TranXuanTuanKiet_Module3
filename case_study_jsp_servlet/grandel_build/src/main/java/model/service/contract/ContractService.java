package model.service.contract;

import model.bean.Service.Service;
import model.bean.contract.Contract;

import java.util.List;

public interface ContractService {
    boolean createContract(Contract contract);
    List<Contract> getList();
}
