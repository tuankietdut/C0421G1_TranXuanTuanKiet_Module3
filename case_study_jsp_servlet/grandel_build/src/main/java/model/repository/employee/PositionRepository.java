package model.repository.employee;

import model.bean.Employee.Position;

import java.util.List;

public interface PositionRepository {
    List<Position> getList();
}
