package model.service.service_dich_vu;

import model.bean.Service.Service;

import java.util.List;
import java.util.Map;

public interface ServiceService {
    Map<String, String> createService(Service service);
    List<Service> getList();
    Service findById(int id);
    Map<String, String> updateService(Service service);
}
