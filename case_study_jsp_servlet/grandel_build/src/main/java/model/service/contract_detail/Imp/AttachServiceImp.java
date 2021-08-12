package model.service.contract_detail.Imp;

import model.repository.contract_detail.AttachServiceRepository;
import model.repository.contract_detail.Imp.AttachServiceRepositoryImp;
import model.service.contract_detail.AttachService;

import java.util.List;

public class AttachServiceImp implements AttachService {
    private AttachServiceRepository attachServiceRepository = new AttachServiceRepositoryImp();
    @Override
    public List<model.bean.contract_detail.AttachService> getList() {
        return this.attachServiceRepository.getList();
    }
}
