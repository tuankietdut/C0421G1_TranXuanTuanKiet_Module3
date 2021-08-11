package model.service.Imp;

import model.bean.Service.ServiceType;
import model.repository.Imp.ServiceTypeRepositoryImp;
import model.repository.ServiceTypeRepository;
import model.service.ServiceTypeService;

import java.util.List;

public class ServiceTypeServiceImp implements ServiceTypeService {
    private ServiceTypeRepository serviceTypeRepository = new ServiceTypeRepositoryImp();
    @Override
    public List<ServiceType> getList() {
        return this.serviceTypeRepository.getList();
    }
}
