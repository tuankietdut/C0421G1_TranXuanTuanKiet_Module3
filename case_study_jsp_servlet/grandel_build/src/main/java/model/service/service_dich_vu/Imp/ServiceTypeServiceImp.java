package model.service.service_dich_vu.Imp;

import model.bean.Service.ServiceType;
import model.repository.service_dich_vu.Imp.ServiceTypeRepositoryImp;
import model.repository.service_dich_vu.ServiceTypeRepository;
import model.service.service_dich_vu.ServiceTypeService;

import java.util.List;

public class ServiceTypeServiceImp implements ServiceTypeService {
    private ServiceTypeRepository serviceTypeRepository = new ServiceTypeRepositoryImp();
    @Override
    public List<ServiceType> getList() {
        return this.serviceTypeRepository.getList();
    }
}
