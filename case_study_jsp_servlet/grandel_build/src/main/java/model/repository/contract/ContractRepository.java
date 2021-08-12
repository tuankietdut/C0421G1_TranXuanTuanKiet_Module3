package model.repository.contract;
import model.bean.contract.Contract;

import java.util.List;

public interface ContractRepository {
    boolean createContract(Contract contract);
    List<Contract> getList();
}
