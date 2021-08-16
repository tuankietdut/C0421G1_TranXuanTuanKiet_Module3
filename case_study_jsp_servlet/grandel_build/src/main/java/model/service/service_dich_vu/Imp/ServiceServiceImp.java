package model.service.service_dich_vu.Imp;

import model.bean.Service.Service;
import model.repository.service_dich_vu.Imp.ServiceRepositoryImp;
import model.repository.service_dich_vu.ServiceRepository;
import model.service.common.Imp.ValidateServiceImp;
import model.service.common.ValidateService;
import model.service.service_dich_vu.ServiceService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceServiceImp implements ServiceService {
    private ServiceRepository serviceRepository = new ServiceRepositoryImp();
    private final ValidateService validateService = new ValidateServiceImp();
    @Override
    public Map<String, String> createService(Service service) {
        Map<String, String> stringMap = new HashMap<>();
        if (!this.validateService.validateCodeService(service.getName())){
            stringMap.put("errorCodeService","Not Ok right here");
        }
        if (!this.validateService.validateMoney(service.getCost())){
            stringMap.put("errorCost","Not Ok right here");
        }
        if (!this.validateService.validateMoney(service.getPoolArea())){
            stringMap.put("errorPoolArea","Not Ok right here");
        }
        if (!this.validateService.validateNumberInt(service.getArea())){
            stringMap.put("errorArea","Not Ok right here");
        }
        if (!this.validateService.validateNumberInt(service.getFloor())){
            stringMap.put("errorFloor","Not Ok right here");
        }
        if (!this.validateService.validateNumberInt(service.getMaxPeople())){
            stringMap.put("errorMaxPeople","Not Ok right here");
        }
        if (!stringMap.isEmpty()){
            stringMap.put("result","fall");
            return stringMap;
        }
        if (this.serviceRepository.createService(service)){
            stringMap.put("result","success");
        }else {
            stringMap.put("result","errorDataBase");
        }
        return stringMap;

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
    public Map<String, String> updateService(Service service) {
        Map<String, String> stringMap = new HashMap<>();
        if (!this.validateService.validateCodeService(service.getName())){
            stringMap.put("errorCodeService","Not Ok right here");
        }
        if (!this.validateService.validateMoney(service.getCost())){
            stringMap.put("errorCost","Not Ok right here");
        }
        if (!this.validateService.validateMoney(service.getPoolArea())){
            stringMap.put("errorPoolArea","Not Ok right here");
        }
        if (!this.validateService.validateNumberInt(service.getArea())){
            stringMap.put("errorArea","Not Ok right here");
        }
        if (!this.validateService.validateNumberInt(service.getFloor())){
            stringMap.put("errorFloor","Not Ok right here");
        }
        if (!this.validateService.validateNumberInt(service.getMaxPeople())){
            stringMap.put("errorMaxPeople","Not Ok right here");
        }
        if (!stringMap.isEmpty()){
            stringMap.put("result","fall");
            return stringMap;
        }
        if (this.serviceRepository.updateService(service)){
            stringMap.put("result","success");
        }else {
            stringMap.put("result","errorDataBase");
        }
        return stringMap;

    }
}
