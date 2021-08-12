package model.service.contract_detail.Imp;

import model.bean.contract_detail.ContractDetail;
import model.repository.contract_detail.ContractDetailRepository;
import model.repository.contract_detail.Imp.ContractDetailRepositoryImp;
import model.service.contract_detail.ContractDetailService;

import java.util.List;

public class ContractDetailServiceImp implements ContractDetailService {
    private ContractDetailRepository contractDetailRepository = new ContractDetailRepositoryImp();
    @Override
    public boolean createContractDetail(ContractDetail contractDetail) {
        return this.contractDetailRepository.createContractDetail(contractDetail);
    }
}
