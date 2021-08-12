package model.service.employee.Imp;

import model.bean.Employee.Education;
import model.repository.employee.EducationRepository;
import model.repository.employee.Imp.EducationRepositoryImp;
import model.service.employee.EducationService;

import java.util.List;

public class EducationServiceImp implements EducationService {
    private EducationRepository educationRepository = new EducationRepositoryImp();
    @Override
    public List<Education> getList() {
        return this.educationRepository.getList();
    }
}
