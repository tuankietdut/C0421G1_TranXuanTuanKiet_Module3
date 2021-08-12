package model.service.service_dich_vu.Imp;

import model.bean.Service.Service;
import model.repository.service_dich_vu.Imp.ServiceRepositoryImp;
import model.repository.service_dich_vu.ServiceRepository;
import model.service.service_dich_vu.ServiceService;

import java.util.List;

public class ServiceServiceImp implements ServiceService {
    private ServiceRepository serviceRepository = new ServiceRepositoryImp();
    @Override
    public boolean createService(Service service) {
        return this.serviceRepository.createService(service);
    }

    @Override
    public List<Service> getList() {
        return this.serviceRepository.getList();
    }

    @Override
    public Service findById(int id) {
        return this.serviceRepository.findById(id);
    }

    @Override
    public boolean updateService(Service service) {
        return this.serviceRepository.updateService(service);
    }
}
