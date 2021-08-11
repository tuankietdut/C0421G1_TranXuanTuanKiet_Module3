package model.repository;
import model.bean.Service.ServiceType;

import java.util.List;

public interface ServiceTypeRepository {
    List<ServiceType> getList();

}
