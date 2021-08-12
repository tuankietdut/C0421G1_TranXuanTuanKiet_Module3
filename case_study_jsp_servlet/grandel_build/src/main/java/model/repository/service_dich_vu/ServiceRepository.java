package model.repository.service_dich_vu;

import model.bean.Service.Service;

import java.util.List;

public interface ServiceRepository {
    boolean createService(Service service);
    List<Service> getList();
    Service findById(int id);
    boolean updateService(Service service);
}
