package model.service.employee.Imp;

import model.bean.Employee.Division;
import model.repository.employee.DivisionRepository;
import model.repository.employee.Imp.DivisionRepositoryImp;
import model.service.employee.DivisionService;

import java.util.List;

public class DivisionServiceImp implements DivisionService {
    private DivisionRepository divisionRepository = new DivisionRepositoryImp();
    @Override
    public List<Division> getList() {
        return this.divisionRepository.getList();
    }
}
