package model.repository.employee;

import model.bean.Employee.Education;
import model.bean.Employee.Position;

import java.util.List;

public interface EducationRepository {
    List<Education> getList();
}
