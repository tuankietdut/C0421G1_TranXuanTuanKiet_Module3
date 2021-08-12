package model.repository.employee;

import model.bean.Employee.Division;

import java.util.List;

public interface DivisionRepository {
    List<Division> getList();
}
