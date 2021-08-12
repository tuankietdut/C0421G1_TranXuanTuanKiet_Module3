package model.repository.customer_contract;

import model.bean.CustomerContract;

import java.util.List;

public interface CustomerContractRepository {
    List<CustomerContract> getList();

}
